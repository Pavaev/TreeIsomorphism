package project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import project.model.Complaint;
import project.repo.ComplaintRepository;

/**
 * Created by Daniel Shchepetov on 15.04.2016.
 */
@Service
@Transactional
public class ComplaintService implements IComplaintService {
    private static final int PAGE_SIZE = 5;
    @Autowired
    private ComplaintRepository complaintRepo;

    @Override
    public void delete(int id) {
        complaintRepo.delete(id);
    }

    @Override
    public Complaint getOne(int id) {
        return complaintRepo.findOne(id);
    }

    @Override
    public void add(Complaint comp) {
        complaintRepo.save(comp);
    }

    @Override
    public Page<Complaint> getPage(Integer pageNum, String from, String to, String comp) {
        PageRequest request =
                new PageRequest(pageNum - 1, PAGE_SIZE);
        if (from == null || to == null) {
            return complaintRepo.findAll(request);
        }
        return complaintRepo.findAllWithParams(request, Integer.parseInt(from), Integer.parseInt(to), comp);
    }

    @Override
    public Page<Complaint> getPage(Integer pageNum) {
        PageRequest request =
                new PageRequest(pageNum - 1, PAGE_SIZE);

        return complaintRepo.findAll(request);
    }

}
