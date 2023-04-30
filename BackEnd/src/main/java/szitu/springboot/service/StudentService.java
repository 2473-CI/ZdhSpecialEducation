package szitu.springboot.service;

import szitu.springboot.model.Student;

import java.util.List;

public interface StudentService {
    public List<Student> getAll();

    public List<Student> search(Long schoolId, Long clazzId, String studentName,
                                String studentGender, Long obstacleId, Long arrangeId,
                                Long offset, Long size);
    public Long searchCount(Long schoolId, Long clazzId, String studentName,
                                String studentGender, Long obstacleId, Long arrangeId);

    public boolean deleteStudent(Long studentId);

    public void add(Long schoolId, Long clazzId, String studentName,
                    String studentHead, String studentGender, Long obstacleId, Long arrangeId);

    public Student getByStudentId(Long studentId);

    public void update(Long studentId, Long clazzId, String studentName, String studentHead, String studentGender, Long obstacleId, Long arrangeId);

    public Student getByAccount(String account);

    public List<Student> needAuth(String authorization, Long schoolId, Long regionId, Long offset, Long size);

    public Student getById(Long studentId);

    public void auth(Long studentId, String authorization);
}
