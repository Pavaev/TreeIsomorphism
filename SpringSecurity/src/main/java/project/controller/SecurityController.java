package project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.method.annotation.MvcUriComponentsBuilder;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import project.aspectJ.Log;
import project.model.Login;
import project.model.Town;
import project.model.User;
import project.repo.UserAuthorityRepository;
import project.service.IUserService;
import project.service.TownService;

import javax.validation.Valid;
import java.util.ArrayList;

/**
 * Created by Daniel Shchepetov on 27.04.2016.
 */
@Controller
public class SecurityController {

    @Autowired
    TownService townServ;

    @Autowired
    private IUserService userServ;

    @Autowired
    private UserAuthorityRepository userAuthorityRepo;


    @RequestMapping(value = "/register", method = RequestMethod.GET)
    @PreAuthorize("isAnonymous()")
    public String reg(ModelMap map) {
        ArrayList<Town> townList = townServ.getTowns();
        map.put("user", new User());
        map.put("townList", townList);
        map.put("userAuthorities", userAuthorityRepo.findAll());
        return "register";
    }


    @RequestMapping(value = "/register", method = RequestMethod.POST)
    @PreAuthorize("isAnonymous()")
    public String register(
            RedirectAttributes redirectAttributes,
            @Valid User user,
            BindingResult result,
            ModelMap map
    ) {
        ArrayList<Town> townList = townServ.getTowns();
        map.put("townList", townList);
        if (result.hasErrors()) {
            return "register";
        } else {
            try {
                userServ.register(user);
                redirectAttributes.addFlashAttribute("message", "Success!");
                redirectAttributes.addFlashAttribute("messageType", "success");
                return "redirect:" + MvcUriComponentsBuilder.fromPath("/").build();
            } catch (DuplicateKeyException ex) {
                result.rejectValue("username", "entry.duplicate", "There is account with such email already.");
            }
        }
        map.put("userAuthorities", userAuthorityRepo.findAll());
        return "register";
    }


    @RequestMapping(value = "/login")
    @PreAuthorize("isAnonymous()")
    public String login(@ModelAttribute("login") Login login, BindingResult result, ModelMap map) {
        return "login";
    }


    @Log
    @RequestMapping("/user/id{id}")
    @PreAuthorize("isAuthenticated()")
    public String user(@PathVariable int id, ModelMap map) {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (user != null && user.getId() == id) {
            return profile(map);
        } else {
            map.put("user", userServ.getOne(id));
        }
        return "profile";
    }

    @Log
    @RequestMapping("/profile")
    @PreAuthorize("isAuthenticated()")
    public String profile(ModelMap map) {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        map.put("user", user);
        return "profile";
    }


}
