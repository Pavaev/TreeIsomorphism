package project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import project.model.User;
import project.repo.UserAuthorityRepository;
import project.repo.UserRepository;


/**
 * Created by Daniel Shchepetov on 22.04.2016.
 */
@Service
public class UserService implements IUserService, UserDetailsService {

    @Autowired
    private UserRepository userRepo;

    @Autowired
    private UserAuthorityRepository userAuthorityRepo;

    @Autowired
    private PasswordEncoder passwordEncoder;


    @Override
    public void register(User user) {
        if (userRepo.findByUsername(user.getUsername()) != null) {
            throw new DuplicateKeyException("Такой email уже зарегистрирован");
        }
        user.addAuthority(userAuthorityRepo.findByAuthority("ROLE_USER"));
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        userRepo.save(user);
    }

    @Override
    public void remove(int id) {
        ;
        userRepo.delete(id);
    }


    public User getOne(int id) {
        return userRepo.findOne(id);
    }


    @Override
    public UserDetails loadUserByUsername(final String username) throws UsernameNotFoundException {
        return userRepo.findByUsername(username);
    }
}
