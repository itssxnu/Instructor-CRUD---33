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
                    instructor.setDob(parts[2]);
                    instructor.setGender(parts[3]);
                    instructor.setNationality(parts[4]);
                    instructor.setNic(parts[5]);
                    instructor.setProfilePicture(parts[6]);
                    instructor.setPhone(parts[7]);
                    instructor.setQualification(parts[8]);
                    instructor.setSpecialization(parts[9]);
                    instructor.setExperience(Integer.parseInt(parts[10]));
                    instructor.setDepartment(parts[11]);
                    instructor.setDesignation(parts[12]);
                    instructor.setEmail(parts[13]);
                    instructor.setPassword(parts[14]);
                    return instructor;
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean updateInstructor(Instructor updatedInstructor) {
        List<Instructor> instructors = new ArrayList<>();
        boolean found = false;

        // Read all instructors
        try (BufferedReader br = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length >= 15) {
                    if (parts[13].equalsIgnoreCase(updatedInstructor.getEmail())) {
                        instructors.add(updatedInstructor);
                        found = true;
                    } else {
                        Instructor instructor = new Instructor(
                                parts[0], parts[1], parts[2], parts[3], parts[4], parts[5],
                                parts[6], parts[7], parts[8], parts[9], Integer.parseInt(parts[10]),
                                parts[11], parts[12], parts[13], parts[14]
                        );
                        instructors.add(instructor);
                    }
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }

        // Write back all instructors
        if (found) {
            try (BufferedWriter bw = new BufferedWriter(new FileWriter(file))) {
                for (Instructor instructor : instructors) {
                    bw.write(String.join(",",
                            instructor.getFirstName(),
                            instructor.getLastName(),
                            instructor.getDob(),
                            instructor.getGender(),
                            instructor.getNationality(),
                            instructor.getNic(),
                            instructor.getProfilePicture(),
                            instructor.getPhone(),
                            instructor.getQualification(),
                            instructor.getSpecialization(),
                            String.valueOf(instructor.getExperience()),
                            instructor.getDepartment(),
                            instructor.getDesignation(),
                            instructor.getEmail(),
                            instructor.getPassword()));
                    bw.newLine();
                }
                return true;
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    public boolean emailExists(String email) {
        try (BufferedReader br = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length >= 15 && parts[13].equalsIgnoreCase(email)) {
                    return true;
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return false;
    }
}