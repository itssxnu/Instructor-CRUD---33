package com.app.course.instructor.instructor.dao;

import com.app.course.instructor.instructor.model.Instructor;
import java.io.*;
import java.util.*;

public class InstructorDAO {
    private static final String FILE_PATH = "D:\\data-33\\instructors.txt";

    public void saveInstructor(Instructor instructor) {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            String line = String.join(",",
                    instructor.getId(),
                    instructor.getFirstName(),
                    instructor.getLastName(),
                    instructor.getDob(),
                    instructor.getGender(),
                    instructor.getNationality(),
                    instructor.getNic(),
                    instructor.getProfilePic(),
                    instructor.getPhone(),
                    instructor.getQualification(),
                    instructor.getExpertise(),
                    String.valueOf(instructor.getExperience()),
                    instructor.getDepartment(),
                    instructor.getDesignation(),
                    instructor.getEmail(),
                    instructor.getPassword()
            );
            bw.write(line);
            bw.newLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public List<Instructor> getAllInstructors() {
        List<Instructor> instructors = new ArrayList<>();
        try (BufferedReader br = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] data = line.split(",");
                Instructor instructor = new Instructor(
                        data[0], data[1], data[2], data[3], data[4], data[5],
                        data[6], data[7], data[8], data[9], data[10],
                        Integer.parseInt(data[11]), data[12], data[13],
                        data[14], data[15]
                );
                instructors.add(instructor);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return instructors;
    }

    public Instructor getInstructorById(String id) {
        return getAllInstructors().stream()
                .filter(i -> i.getId().equals(id))
                .findFirst()
                .orElse(null);
    }

    public void updateInstructors(List<Instructor> instructors) {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (Instructor instructor : instructors) {
                String line = String.join(",",
                        instructor.getId(),
                        instructor.getFirstName(),
                        instructor.getLastName(),
                        instructor.getDob(),
                        instructor.getGender(),
                        instructor.getNationality(),
                        instructor.getNic(),
                        instructor.getProfilePic(),
                        instructor.getPhone(),
                        instructor.getQualification(),
                        instructor.getExpertise(),
                        String.valueOf(instructor.getExperience()),
                        instructor.getDepartment(),
                        instructor.getDesignation(),
                        instructor.getEmail(),
                        instructor.getPassword()
                );
                bw.write(line);
                bw.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

