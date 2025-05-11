package com.app.course.instructor.instructor.util;

import com.app.course.instructor.instructor.model.Student;
import java.util.List;
import java.time.LocalDateTime;

public class InsertionSortUtil {

    public static void sortStudentsByJoinDate(List<Student> students) {
        if (students == null || students.size() <= 1) {
            return;
        }

        for (int i = 1; i < students.size(); i++) {
            Student current = students.get(i);
            LocalDateTime currentDate = current.getCreatedAt();
            int j = i - 1;

            while (j >= 0 && students.get(j).getCreatedAt().isAfter(currentDate)) {
                students.set(j + 1, students.get(j));
                j--;
            }
            students.set(j + 1, current);
        }
    }
}