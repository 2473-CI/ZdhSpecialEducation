package szitu.springboot.service;

import szitu.springboot.model.StudentDevelopment;

import java.util.List;

public interface StudentDevelopmentService {
    public List<StudentDevelopment> selectByStudentId(Long studentId);

    public void insert(StudentDevelopment studentDevelopment);
}
