package project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.method.annotation.MvcUriComponentsBuilder;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import project.model.User;
import project.service.IUserService;
import project.service.TownService;




@Controller
public class UserController {

    @Autowired
    TownService townServ;

    @Autowired
    IUserService userServ;

    @RequestMapping("/")
    public String index() {
        return "index";
    }


    @RequestMapping("/user/id{id}/delete")
    @PreAuthorize("isAuthenticated()")
    public String delete(RedirectAttributes redirectAttributes, ModelMap map, @PathVariable int id) {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (user.getId() != id) {
            return "redirect:" + MvcUriComponentsBuilder.fromMappingName("SC#profile").build();
        }

        userServ.remove(user.getId());


        SecurityContextHolder.getContext().getAuthentication().setAuthenticated(false);
        return "redirect:" + MvcUriComponentsBuilder.fromMappingName("UC#index").build();
    }

}

