package com.app.course.instructor.instructor.dao;

import com.app.course.instructor.instructor.model.Course;
import com.app.course.instructor.instructor.model.Student;
import com.app.course.instructor.instructor.util.InsertionSortUtil;

import java.io.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeFormatterBuilder;
import java.time.temporal.ChronoField;
import java.util.*;

public class CourseDAO {
    private final String courseFilePath;
    private final String enrollmentFilePath;

    // Flexible date-time formatter that handles different precisions
    private static final DateTimeFormatter formatter = new DateTimeFormatterBuilder()
            .appendPattern("yyyy-MM-dd'T'HH:mm:ss")
            .appendFraction(ChronoField.NANO_OF_SECOND, 0, 9, true)
            .toFormatter();

    public CourseDAO(String courseFilePath, String enrollmentFilePath) {
        this.courseFilePath = courseFilePath;
        this.enrollmentFilePath = enrollmentFilePath;
    }

    public List<Course> getAllCourses() {
        List<Course> courses = new ArrayList<>();
        try (BufferedReader br = new BufferedReader(new FileReader(courseFilePath))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] tokens = line.split("\\|");
                if (tokens.length >= 6) {
                    courses.add(new Course(
                            tokens[0],  // courseId
                            tokens[1],  // title
                            tokens[2],  // description
                            tokens[3],  // price
                            tokens[4],  // startDate
                            tokens[5]   // endDate
                    ));
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return courses;
    }

    public List<Student> getStudentsForCourse(String courseId) {
        List<Student> students = new ArrayList<>();
        try (BufferedReader br = new BufferedReader(new FileReader(enrollmentFilePath))) {
            String line;
            while ((line = br.readLine()) != null) {
                try {
                    String[] tokens = line.split(",");
                    if (tokens.length >= 12) {
                        // Parse the date with flexible format
                        LocalDateTime createdAt = LocalDateTime.parse(tokens[4], formatter);

                        Student student = new Student(
                                tokens[5],  // firstName
                                tokens[6],  // lastName
                                tokens[7],  // dateOfBirth
                                tokens[8],  // gender
                                tokens[9],  // nationality
                                tokens[10], // email
                                tokens[11], // password
                                tokens[0],  // id
                                tokens[1],  // contactNumber
                                tokens[2],  // school
                                tokens[3],  // grade
                                createdAt   // createdAt
                        );
                        students.add(student);
                    }
                } catch (Exception e) {
                    System.err.println("Error parsing student record: " + line);
                    e.printStackTrace();
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return students;
    }

    public List<Student> getAllStudents() {
        List<Student> students = new ArrayList<>();
        try (BufferedReader br = new BufferedReader(new FileReader(enrollmentFilePath))) {
            String line;
            while ((line = br.readLine()) != null) {
                try {
                    String[] tokens = line.split(",");
                    if (tokens.length >= 12) {
                        LocalDateTime createdAt = LocalDateTime.parse(tokens[4], formatter);
                        Student student = new Student(
                                tokens[5],  // firstName
                                tokens[6],  // lastName
                                tokens[7],  // dateOfBirth
                                tokens[8],  // gender
                                tokens[9],  // nationality
                                tokens[10], // email
                                tokens[11], // password
                                tokens[0],  // id
                                tokens[1],  // contactNumber
                                tokens[2],  // school
                                tokens[3],  // grade
                                createdAt   // createdAt
                        );
                        students.add(student);
                    }
                } catch (Exception e) {
                    System.err.println("Error parsing student record: " + line);
                    e.printStackTrace();
                }
            }
            // Sort students by join date
            InsertionSortUtil.sortStudentsByJoinDate(students);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return students;
    }
}