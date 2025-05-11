package com.app.course.instructor.instructor.model;

public class User {
    protected String firstName;
    protected String lastName;
    protected String DateOfBirth;
    protected String gender;
    protected String nationality;
    protected String email;
    protected String password;

    public User() {
    }

    public User(String firstName, String lastName, String dateOfBirth, String gender, String nationality, String email,String password) {
        this.firstName = firstName;
        this.lastName = lastName;
        DateOfBirth = dateOfBirth;
        this.gender = gender;
        this.nationality = nationality;
        this.email = email;
        this.password = password;
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

    public String getDob() {
        return DateOfBirth;
    }

    public void setDob(String dateOfBirth) {
        DateOfBirth = dateOfBirth;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getNationality() {
        return nationality;
    }

    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}


