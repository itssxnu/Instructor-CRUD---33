package com.app.course.instructor.instructor.model;

public class Course {
    private String courseId;
    private String title;
    private String description;
    private String price;
    private String startDate;
    private String endDate;

    public Course(String courseId, String title) {
        this.courseId = courseId;
        this.title = title;
    }

    public Course(String courseId, String title, String description,
                  String price, String startDate, String endDate) {
        this.courseId = courseId;
        this.title = title;
        this.description = description;
        this.price = price;
        this.startDate = startDate;
        this.endDate = endDate;
    }

    // Getters and setters for all fields
    public String getCourseId() { return courseId; }
    public String getTitle() { return title; }
    public String getDescription() { return description; }
    public String getPrice() { return price; }
    public String getStartDate() { return startDate; }
    public String getEndDate() { return endDate; }

    public void setTitle(String title) { this.title = title; }
    public void setDescription(String description) { this.description = description; }
    public void setPrice(String price) { this.price = price; }
    public void setStartDate(String startDate) { this.startDate = startDate; }
    public void setEndDate(String endDate) { this.endDate = endDate; }
}