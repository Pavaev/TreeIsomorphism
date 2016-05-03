package project.model;


import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.security.core.CredentialsContainer;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.Entity;
import javax.persistence.*;
import java.util.*;


@Entity
@Table(name = "user")
public class User implements CredentialsContainer, UserDetails {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", unique = true, nullable = false)
    private int id;


    @Column(nullable = false)
    @Length(max = 100)
    @NotBlank(message = "First Name cannot be empty")
    private String firstName = "Ivan";

    @Column(nullable = false)
    @Length(max = 100)
    @NotBlank(message = "Last Name cannot be empty")
    private String lastName = "Ivanov";

    @Column
    private String midName = "Ivanovich";

    @Email(message = "This email is not valid")
    @NotBlank(message = "Email cannot be empty")
    @Column(nullable = false)
    @Length(min=6, max = 30)
    private String username = "28530@mail.ru";

    @NotBlank(message = "Password cannot be empty")
    @Column(nullable = false)
    private String password = "123456";

    @Column
    private String phone = "88005553535";


    @OneToMany(orphanRemoval=true, cascade = CascadeType.ALL ,targetEntity = Complaint.class)
    @JoinColumn(name="user_id", referencedColumnName="id")
    private List<Complaint> comps;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(referencedColumnName = "id", nullable = false)
    private Town town;

    @Column
    private String sex = "Не указано";


    @ManyToMany(fetch = FetchType.EAGER, cascade = {CascadeType.MERGE})
    @JoinTable(
            name = "user_user_role",
            joinColumns = @JoinColumn(name = "user"),
            inverseJoinColumns = @JoinColumn(name = "user_role")
    )
    private Set<UserAuthority> authorities = new HashSet<>();


    @Override
    public int hashCode() {
        int hash = 5;
        hash = 71 * hash + this.id;
        hash = 71 * hash + Objects.hashCode(this.firstName);
        hash = 71 * hash + Objects.hashCode(this.lastName);
        hash = 71 * hash + Objects.hashCode(this.midName);
        hash = 71 * hash + Objects.hashCode(this.username);
        hash = 71 * hash + Objects.hashCode(this.phone);
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
        final User other = (User) obj;
        if (this.id != other.id) {
            return false;
        }
        if (!Objects.equals(this.firstName, other.firstName)) {
            return false;
        }
        if (!Objects.equals(this.lastName, other.lastName)) {
            return false;
        }
        if (!Objects.equals(this.midName, other.midName)) {
            return false;
        }
        if (!Objects.equals(this.username, other.username)) {
            return false;
        }
        if (!Objects.equals(this.phone, other.phone)) {
            return false;
        }
        return true;
    }


    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }


    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getMidName() {
        return midName;
    }

    public void setMidName(String midName) {
        this.midName = midName;
    }

    @Override
    public Set<UserAuthority> getAuthorities() {
        return authorities;
    }

    public void setAuthorities(Set<UserAuthority> authorities) {
        this.authorities = authorities;
    }


    public void addAuthority(UserAuthority authority) {
        this.authorities.add(authority);
    }

    public String getPassword() {
        return password;
    }

    @Override
    public String getUsername() {
        return username;
    }


    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getId() {
            return id;
    }

    public void setId(int id) {
        this.id = id;
    }


    public Town getTown() {
        return town;
    }

    public void setTown(Town town) {
        this.town = town;
    }

    @Override
    public void eraseCredentials() {
        this.password = null;
    }


    public void setUsername(String username) {
        this.username = username;
    }

    public List<Complaint> getComps() {
        return comps;
    }

    public void setComps(List<Complaint> comps) {
        this.comps = comps;
    }
}
