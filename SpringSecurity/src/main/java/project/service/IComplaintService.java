package project.service;

import org.springframework.data.domain.Page;
import project.model.Complaint;

/**
 * Created by Daniel Shchepetov on 15.04.2016.
 */
public interface IComplaintService {

    void delete(int id);

    Complaint getOne(int id);

    void add(Complaint comp);

    Page<Complaint> getPage(Integer pageNum, String from, String to, String comp);

    Page<Complaint> getPage(Integer pageNum);


}
