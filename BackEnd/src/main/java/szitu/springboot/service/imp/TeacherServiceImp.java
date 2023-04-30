package szitu.springboot.service.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import szitu.springboot.mapper.TeacherMapper;
import szitu.springboot.model.Teacher;
import szitu.springboot.service.TeacherService;

import java.util.List;

@Service
public class TeacherServiceImp implements TeacherService {
    @Autowired
    private TeacherMapper teacherMapper;

    @Override
    public Teacher getByAccount(String account) {
        return teacherMapper.getByAccount(account);
    }

    @Override
    public void update(Teacher teacher) {
        teacherMapper.update(teacher);
    }

    @Override
    public void delete(Long teacherId){
        teacherMapper.delete(teacherId);
    }

    @Override
    public void insert(Teacher teacher) {
        teacherMapper.insert(teacher);
    }

    @Override
    public List<Teacher> select(){
        return teacherMapper.select();
    }
}
