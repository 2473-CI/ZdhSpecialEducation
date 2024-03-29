package szitu.springboot.service;

import szitu.springboot.model.Teacher;

import java.util.List;

public interface TeacherService {
    public Teacher getByAccount(String account);

    public void insert(Teacher teacher);

    public void update(Teacher teacher);

    public void delete(Long teacherId);

    public List<Teacher> select();

    public List<Teacher> search(Integer schoolId, String userName, String userPhone, String userMail, Integer page, Integer size);
}
