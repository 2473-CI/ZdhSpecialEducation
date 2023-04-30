package szitu.springboot.service;

import szitu.springboot.model.StudentBasic;

import java.util.Date;

public interface StudentBasicService {
    public void init(Long studentId, Date date);

    public StudentBasic getByStudentId(long studentId);

    public void update(StudentBasic studentBasic);
}
