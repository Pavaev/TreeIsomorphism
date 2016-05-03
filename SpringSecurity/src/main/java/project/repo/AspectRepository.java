package project.repo;

import org.springframework.data.repository.CrudRepository;
import project.model.UserLog;

/**
 * Created by Daniel Shchepetov on 02.05.2016.
 */
public interface AspectRepository extends CrudRepository<UserLog, Integer> {
}
