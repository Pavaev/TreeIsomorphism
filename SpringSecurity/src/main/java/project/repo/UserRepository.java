package project.repo;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import project.model.User;

/**
 * Created by Daniel Shchepetov on 22.04.2016.
 */
@Repository
public interface UserRepository extends CrudRepository<User, Integer> {
    User findByUsername(String username);
}
