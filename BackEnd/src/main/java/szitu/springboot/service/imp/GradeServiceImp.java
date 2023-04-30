package szitu.springboot.service.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import szitu.springboot.mapper.GradeMapper;
import szitu.springboot.model.Grade;
import szitu.springboot.service.GradeService;

import java.util.List;

@Service
public class GradeServiceImp implements GradeService {

    @Autowired
    private GradeMapper gradeMapper;
    @Override
    public List<Grade> getAll() {
        return gradeMapper.getAll();
    }
}
