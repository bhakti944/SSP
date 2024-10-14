package p1;
import java.io.Serializable;
public class Student implements Serializable {
    private static final long serialVersionUID = 1L;
    private String id;
    private String name;
    private String address;
    private String email;
    private String phone;
    private String course;
    private String gender;
    private String interests; // Change to String
    // Getters and Setters
    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }
    public String getCourse() { return course; }
    public void setCourse(String course) { this.course = course; }
    public String getGender() { return gender; }
    public void setGender(String gender) { this.gender = gender; }
    public String getInterests() { return interests; } // Update to String
    public void setInterests(String interests) { this.interests = interests; } // Update to String
}
