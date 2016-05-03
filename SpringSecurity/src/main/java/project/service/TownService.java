package project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import project.model.Town;
import project.repo.TownRepository;

import java.util.ArrayList;

/**
 * Created by Daniel Shchepetov on 23.04.2016.
 */
@Service
public class TownService {


    @Autowired
    TownRepository townRepo;


    public ArrayList<Town> getTowns() {
        return townRepo.findAll();
    }

    public Town getTown(int id) {
        return townRepo.findOne(id);
    }


}
