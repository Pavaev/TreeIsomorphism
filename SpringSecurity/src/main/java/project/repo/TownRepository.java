package project.repo;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import project.model.Town;

import java.util.ArrayList;

/**
 * Created by Daniel Shchepetov on 22.04.2016.
 */

@Repository
public interface TownRepository extends CrudRepository<Town, Integer> {

    ArrayList<Town> findAll();


}
