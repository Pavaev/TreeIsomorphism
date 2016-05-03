package project.repo;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import project.model.UserAuthority;

/**
 * Created by Daniel Shchepetov on 26.04.2016.
 */
@Repository
public interface UserAuthorityRepository extends CrudRepository<UserAuthority, Integer> {
    UserAuthority findByAuthority(String role_user);
}
