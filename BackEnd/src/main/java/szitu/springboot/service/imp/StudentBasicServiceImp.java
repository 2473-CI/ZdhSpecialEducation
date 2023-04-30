package szitu.springboot.service.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import szitu.springboot.mapper.StudentBasicMapper;
import szitu.springboot.model.StudentBasic;
import szitu.springboot.service.StudentBasicService;

import java.util.Date;

@Service
public class StudentBasicServiceImp implements StudentBasicService {

    @Autowired
    private StudentBasicMapper studentBasicMapper;

    @Override
    public void init(Long studentId, Date date) {
        studentBasicMapper.init(studentId, date);
    }

    @Override
    public StudentBasic getByStudentId(long studentId) {
        return studentBasicMapper.selectByStudentId(studentId);
    }

    @Override
    public void update(StudentBasic studentBasic) {
        studentBasicMapper.update(studentBasic);
    }
}
