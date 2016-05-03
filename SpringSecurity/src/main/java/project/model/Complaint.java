package project.model;


import org.hibernate.validator.constraints.*;


import javax.persistence.*;
import java.util.Objects;


/**
 * Created by Daniel Shchepetov on 02.04.2016.
 */
@Entity
@Table(name="complaint")
public class Complaint {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", unique = true, nullable = false)
    private int id;

    @Length(max = 100)
    @Column(nullable = false)
    private String company = "Meow";


    @Length(max = 255)
    @Column(nullable = false)
    private String post;


    @Length(max = 100)
    @Column(nullable = false)
    private String header;

    @Column
    private String coords;


    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;


    public Complaint() {
    }


    @Override
    public int hashCode() {
        int hash = 3;
        hash = 41 * hash + this.id;
        hash = 41 * hash + Objects.hashCode(this.company);
        hash = 41 * hash + Objects.hashCode(this.post);
        hash = 41 * hash + Objects.hashCode(this.header);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Complaint other = (Complaint) obj;
        if (this.id != other.id) {
            return false;
        }
        if (!Objects.equals(this.company, other.company)) {
            return false;
        }
        if (!Objects.equals(this.post, other.post)) {
            return false;
        }
        if (!Objects.equals(this.header, other.header)) {
            return false;
        }
        return true;
    }


    public String getHeader() {
        return header;
    }

    public void setHeader(String header) {
        this.header = header;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }



    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getPost() {
        return post;
    }

    public void setPost(String post) {
        this.post = post;
    }


    public String getCoords() {
        return coords;
    }

    public void setCoords(String coords) {
        this.coords = coords;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
