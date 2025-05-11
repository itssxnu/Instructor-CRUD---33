package com.app.course.instructor.instructor.model;

import java.time.LocalDate;
import java.time.LocalDateTime;

public class Student extends User {
    private String id;
    private String contactNumber;
    private String school;
    private String grade;
    private LocalDateTime createdAt;

    public Student() {}

    public Student(String firstName, String lastName, String dateOfBirth, String gender, String nationality, String email, String password, String id, String contactNumber, String school, String grade, LocalDateTime createdAt) {
        super(firstName, lastName, dateOfBirth, gender, nationality, email, password);
        this.id = id;
        this.contactNumber = contactNumber;
        this.school = school;
        this.grade = grade;
        this.createdAt = createdAt;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getContactNumber() {
        return contactNumber;
    }

    public void setContactNumber(String contactNumber) {
        this.contactNumber = contactNumber;
    }

    public String getSchool() {
        return school;
    }

    public void setSchool(String school) {
        this.school = school;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    @Override
    public String toString() {
        return  id + ',' + contactNumber +"," + school  +"," + grade  +"," + createdAt +"," + firstName  +"," + lastName  +"," + DateOfBirth  +"," + gender  +"," + nationality  +"," + email  +"," + password;
    }
}
