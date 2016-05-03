package project.repo;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import project.model.Complaint;


/**
 * Created by Daniel Shchepetov on 14.04.2016.
 */

    @Repository
    public interface ComplaintRepository  extends CrudRepository<Complaint, Integer> {
    Page<Complaint> findAll(Pageable pageable);

    @Query("SELECT c FROM Complaint c WHERE c.id BETWEEN :fr AND :to AND c.company LIKE CONCAT('%',:comp,'%')")
    Page<Complaint> findAllWithParams(Pageable pageable, @Param("fr") int from, @Param("to")int to, @Param("comp") String comp);


}



