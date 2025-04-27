package com.app.course.instructor.instructor.dao;

import com.app.course.instructor.instructor.model.Course;

import java.io.*;
import java.util.*;

public class CourseDAO {
    private final String courseFilePath;
    private final String enrollmentFilePath;

    public CourseDAO(String courseFilePath, String enrollmentFilePath) {
        this.courseFilePath = courseFilePath;
        this.enrollmentFilePath = enrollmentFilePath;
    }

    public List<Course> getCoursesByInstructor(String email) {
        List<Course> list = new ArrayList<>();
        try (BufferedReader br = new BufferedReader(new FileReader(courseFilePath))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] tokens = line.split("\\|");
                if (tokens.length >= 10 && tokens[9].equalsIgnoreCase(email)) {
                    Course course = new Course(tokens[0], tokens[1]);
                    list.add(course);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Course> getAllPredefinedCourses() {
        List<Course> courses = new ArrayList<>();
        String predefinedPath = this.courseFilePath.replace("courses.txt", "predefined_courses.txt");

        try (BufferedReader br = new BufferedReader(new FileReader(predefinedPath))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] tokens = line.split("\\|");
                if (tokens.length >= 5) {
                    courses.add(new Course(
                            tokens[0],  // courseId
                            tokens[1],  // title
                            tokens[2],  // description
                            tokens[3],  // startDate
                            tokens[4],  // endDate
                            ""         // instructorEmail (empty for predefined)
                    ));
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return courses;
    }

    public boolean assignCourseToInstructor(Course course, String instructorEmail) {
        course.setInstructorEmail(instructorEmail);
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(courseFilePath, true))) {
            bw.write(String.join("|",
                    course.getCourseId(),
                    course.getTitle(),
                    course.getDescription(),
                    course.getStartDate(),
                    course.getEndDate(),
                    course.getInstructorEmail()));
            bw.newLine();
            return true;
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
    }

    public int countEnrolledStudents(String courseId) {
        int count = 0;
        try (BufferedReader br = new BufferedReader(new FileReader(enrollmentFilePath))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] tokens = line.split("\\|");
                if (tokens.length == 2 && tokens[0].equalsIgnoreCase(courseId)) {
                    count++;
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return count;
    }

    public List<String> getEnrolledStudents(String courseId) {
        List<String> students = new ArrayList<>();
        try (BufferedReader br = new BufferedReader(new FileReader(enrollmentFilePath))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] tokens = line.split("\\|");
                if (tokens.length == 2 && tokens[1].equals(courseId)) {
                    students.add(tokens[0]);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return students;
    }

    public boolean updateCourse(Course updatedCourse) {
        List<Course> allCourses = new ArrayList<>();
        boolean updated = false;

        // Read all courses
        try (BufferedReader br = new BufferedReader(new FileReader(courseFilePath))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] tokens = line.split("\\|");
                if (tokens.length >= 6) {
                    if (tokens[0].equals(updatedCourse.getCourseId())) {
                        // Replace with updated course
                        allCourses.add(updatedCourse);
                        updated = true;
                    } else {
                        // Keep existing course
                        allCourses.add(new Course(
                                tokens[0], tokens[1], tokens[2],
                                tokens[3], tokens[4], tokens[5]));
                    }
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }

        // Write all courses back
        if (updated) {
            try (BufferedWriter bw = new BufferedWriter(new FileWriter(courseFilePath))) {
                for (Course course : allCourses) {
                    bw.write(String.join("|",
                            course.getCourseId(),
                            course.getTitle(),
                            course.getDescription() != null ? course.getDescription() : "",
                            course.getStartDate() != null ? course.getStartDate() : "",
                            course.getEndDate() != null ? course.getEndDate() : "",
                            course.getInstructorEmail() != null ? course.getInstructorEmail() : ""));
                    bw.newLine();
                }
                return true;
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return false;
    }

}
