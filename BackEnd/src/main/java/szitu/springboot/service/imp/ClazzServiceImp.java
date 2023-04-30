package szitu.springboot.service.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import szitu.springboot.mapper.ClazzMapper;
import szitu.springboot.model.Clazz;
import szitu.springboot.service.ClazzService;

import java.util.List;

@Service
public class ClazzServiceImp implements ClazzService {
    @Autowired
    private ClazzMapper clazzMapper;
    @Override
    public List<Clazz> getAll() {
        return clazzMapper.getAll();
    }

    @Override
    public List<Clazz> searchBySchool(Long schoolId, Long gradeId, String clazzName, Long offset, Long size) {
        return clazzMapper.selectBySchoolAndGrade(schoolId, gradeId, clazzName, offset, size);
    }

    @Override
    public Long searchBySchoolCount(Long schoolId, Long gradeId, String clazzName) {
        return clazzMapper.selectBySchoolAndGradeCount(schoolId, gradeId, clazzName);
    }

    @Override
    public boolean deleteClazz(Long clazzId) {
        try {
            clazzMapper.deleteClazz(clazzId);
            return true;
        }catch (Exception err){
            return false;
        }

    }

    @Override
    public void updateClazz(Long clazzId, Long gradeId, String clazzName, String description) {
        clazzMapper.updateClazz(clazzId, gradeId, clazzName, description);
    }

    @Override
    public void add(Long schoolId, Long gradeId, String clazzName, String description) {
        clazzMapper.insertClazz(schoolId, gradeId, clazzName, description);
    }

}
