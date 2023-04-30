package szitu.springboot.service.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import szitu.springboot.mapper.StudentMapper;
import szitu.springboot.model.Student;
import szitu.springboot.service.StudentService;

import java.util.List;

@Service
public class StudentServiceImp implements StudentService {
    @Autowired
    private StudentMapper studentMapper;

    @Override
    public List<Student> getAll() {
        return studentMapper.selectAll();
    }

    @Override
    public List<Student> search(Long schoolId, Long clazzId, String studentName, String studentGender, Long obstacleId, Long arrangeId, Long offset, Long size) {
        return studentMapper.search(schoolId, clazzId, studentName, studentGender, obstacleId, arrangeId, offset, size);
    }

    @Override
    public Long searchCount(Long schoolId, Long clazzId, String studentName, String studentGender, Long obstacleId, Long arrangeId) {
        return studentMapper.searchCount(schoolId, clazzId, studentName, studentGender, obstacleId, arrangeId);
    }

    @Override
    public boolean deleteStudent(Long studentId) {
        try {
            studentMapper.deleteStudent(studentId);
            return true;
        }catch (Exception err){
            return false;
        }

    }

    @Override
    public void add(Long schoolId, Long clazzId, String studentName, String studentHead, String studentGender, Long obstacleId, Long arrangeId) {
        studentMapper.insertStudent(schoolId, clazzId, studentName, studentHead, studentGender, obstacleId, arrangeId);
    }

    @Override
    public Student getByStudentId(Long studentId) {
        return studentMapper.selectByStudentId(studentId);
    }

    @Override
    public void update(Long studentId, Long clazzId, String studentName, String studentHead, String studentGender, Long obstacleId, Long arrangeId) {
        studentMapper.update(studentId, clazzId, studentName, studentHead, studentGender, obstacleId, arrangeId);
    }

    @Override
    public Student getByAccount(String account) {
        return studentMapper.getByAccount(account);
    }

    @Override
    public List<Student> needAuth(String authorization, Long schoolId, Long regionId, Long offset, Long size) {
        return studentMapper.needAuth(authorization, schoolId, regionId, offset, size);
    }

    @Override
    public Student getById(Long studentId) {
        return studentMapper.getById(studentId);
    }

    @Override
    public void auth(Long studentId, String authorization) {
        studentMapper.auth(studentId, authorization);
    }


}
