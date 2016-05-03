package project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import project.model.UserLog;
import project.repo.AspectRepository;

/**
 * Created by Daniel Shchepetov on 02.05.2016.
 */
@Service
public class AspectService {
    @Autowired
    AspectRepository aspectRepo;

   public void add(UserLog userLog){
       aspectRepo.save(userLog);
   }
}
