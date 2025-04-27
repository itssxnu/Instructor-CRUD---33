package com.app.course.instructor.instructor.model;

public class Course {
    private String courseId;
    private String title;
    private String description;
    private String startDate;
    private String endDate;
    private String instructorEmail;

    public Course(String courseId, String title) {
        this.courseId = courseId;
        this.title = title;
    }

    public Course(String courseId, String title, String description,
                  String startDate, String endDate, String instructorEmail) {
        this.courseId = courseId;
        this.title = title;
        this.description = description;
        this.startDate = startDate;
        this.endDate = endDate;
        this.instructorEmail = instructorEmail;
    }

    // Add getters and setters for all fields
    public String getCourseId() { return courseId; }
    public String getTitle() { return title; }
    public String getDescription() { return description; }
    public String getStartDate() { return startDate; }
    public String getEndDate() { return endDate; }
    public String getInstructorEmail() { return instructorEmail; }

    public void setTitle(String title) { this.title = title; }
    public void setDescription(String description) { this.description = description; }
    public void setStartDate(String startDate) { this.startDate = startDate; }
    public void setEndDate(String endDate) { this.endDate = endDate; }
    public void setInstructorEmail(String instructorEmail) { this.instructorEmail = instructorEmail; }
}