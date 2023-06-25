package szitu.springboot.service.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import szitu.springboot.mapper.EchartsMapper;
import szitu.springboot.service.EchartsService;

import java.util.List;
import java.util.Map;

@Service
public class EchartsServiceImp implements EchartsService {

    @Autowired
    private EchartsMapper echartsMapper;


    @Override
    public List<Map> obsProportion(Map map) {
        return echartsMapper.obsProportion(map);
    }

    @Override
    public List<Map> classStatistics(Map map) {
        return echartsMapper.classStatistics(map);
    }

    @Override
    public Integer countTeacherByStudentId(Map map) {
        return echartsMapper.countTeacherByStudentId(map);
    }

    @Override
    public Integer countFileBySchoolId(Integer schoolId) {
        return echartsMapper.countFileBySchoolId(schoolId);
    }

    @Override
    public Integer countNewStudentBySchoolId(Integer schoolId) {
        return echartsMapper.countNewStudentBySchoolId(schoolId);
    }

    @Override
    public Integer countExerciseBySchoolId(Integer schoolId) {
        return echartsMapper.countExerciseBySchoolId(schoolId);
    }

    @Override
    public Integer countAnswerBySchoolIdEnd(Integer schoolId) {
        return echartsMapper.countAnswerBySchoolIdEnd(schoolId);
    }

    @Override
    public Integer countAnswerBySchoolIdPadding(Integer schoolId) {
        return echartsMapper.countAnswerBySchoolIdPadding(schoolId);
    }

    @Override
    public Integer countAnswerBySchoolId(Integer schoolId) {
        return echartsMapper.countAnswerBySchoolId(schoolId);
    }

    @Override
    public Integer countClassBySchoolId(Integer schoolId) {
        return echartsMapper.countClassBySchoolId(schoolId);
    }

    @Override
    public Integer countIepEnd(Integer studentId) {
        return echartsMapper.countIepEnd(studentId);
    }

    @Override
    public Integer countIep(Integer studentId) {
        return echartsMapper.countIep(studentId);
    }
}
