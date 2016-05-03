package project.service;

import project.model.User;


/**
 * Created by Daniel Shchepetov on 22.04.2016.
 */
public interface IUserService {
    void register(User user);

    void remove(int id);

    User getOne(int id);

}
