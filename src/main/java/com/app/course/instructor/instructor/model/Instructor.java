package com.app.course.instructor.instructor.model;

public class Instructor extends User {
    private String nic;
    private String profilePicture;
    private String phone;
    private String qualification;
    private String specialization;
    private int experience;
    private String department;
    private String designation;

    public Instructor() {
        super();
    }

    public Instructor(String firstName, String lastName, String dob,
                      String gender, String nationality, String nic,
                      String profilePicture, String phone, String qualification,
                      String specialization, int experience, String department,
                      String designation, String email, String password) {
        super(firstName, lastName, dob, gender, nationality, email, password);
        this.nic = nic;
        this.profilePicture = profilePicture;
        this.phone = phone;
        this.qualification = qualification;
        this.specialization = specialization;
        this.experience = experience;
        this.department = department;
        this.designation = designation;
    }


    public String getNic() {
        return nic;
    }

    public void setNic(String nic) {
        this.nic = nic;
    }

    public String getProfilePicture() {
        return profilePicture;
    }

    public void setProfilePicture(String profilePicture) {
        this.profilePicture = profilePicture;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getQualification() {
        return qualification;
    }

    public void setQualification(String qualification) {
        this.qualification = qualification;
    }

    public String getSpecialization() {
        return specialization;
    }

    public void setSpecialization(String specialization) {
        this.specialization = specialization;
    }

    public int getExperience() {
        return experience;
    }

    public void setExperience(int experience) {
        this.experience = experience;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getDesignation() {
        return designation;
    }

    public void setDesignation(String designation) {
        this.designation = designation;
    }
}