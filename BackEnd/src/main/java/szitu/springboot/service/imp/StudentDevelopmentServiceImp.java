package szitu.springboot.service.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import szitu.springboot.mapper.StudentDevelopmentMapper;
import szitu.springboot.model.StudentDevelopment;

import java.util.List;

@Service
public class StudentDevelopmentServiceImp implements StudentDevelopmentMapper {
    @Autowired
    private StudentDevelopmentMapper studentDevelopmentMapper;

    @Override
    public List<StudentDevelopment> selectByStudentId(Long studentId) {
        return studentDevelopmentMapper.selectByStudentId(studentId);
    }

    @Override
    public void insert(StudentDevelopment studentDevelopment) {
        studentDevelopmentMapper.insert(studentDevelopment);
    }
}
