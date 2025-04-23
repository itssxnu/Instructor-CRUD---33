package com.app.course.instructor.instructor.dao;

import com.app.course.instructor.instructor.model.Instructor;
import java.io.*;
import java.util.*;

public class InstructorDAO {
    private final File file;

    public InstructorDAO(String path) {
        this.file = new File(path);
        if (!file.exists()) {
            try { file.createNewFile(); } catch (IOException e) { e.printStackTrace(); }
        }
    }

    public Instructor validateLogin(String email, String password) {
        try (BufferedReader br = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length >= 15 && parts[13].equalsIgnoreCase(email) && parts[14].equals(password)) {
                    Instructor instructor = new Instructor();
                    instructor.setFirstName(parts[0]);
                    instructor.setLastName(parts[1]);
                    instructor.setEmail(parts[13]);
                    // Populate other fields as needed
                    return instructor;
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean registerInstructor(Instructor instructor) {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(file, true))) {
            StringBuilder sb = new StringBuilder();
            sb.append(instructor.getFirstName()).append(",")
                    .append(instructor.getLastName()).append(",")
                    .append(instructor.getDob()).append(",")
                    .append(instructor.getGender()).append(",")
                    .append(instructor.getNationality()).append(",")
                    .append(instructor.getNic()).append(",")
                    .append(instructor.getProfilePicture()).append(",")
                    .append(instructor.getPhone()).append(",")
                    .append(instructor.getQualification()).append(",")
                    .append(instructor.getSpecialization()).append(",")
                    .append(instructor.getExperience()).append(",")
                    .append(instructor.getDepartment()).append(",")
                    .append(instructor.getDesignation()).append(",")
                    .append(instructor.getEmail()).append(",")
                    .append(instructor.getPassword());

            bw.write(sb.toString());
            bw.newLine();
            return true;
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
    }

}

