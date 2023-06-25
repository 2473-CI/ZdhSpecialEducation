package szitu.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import szitu.springboot.mapper.EchartsMapper;

import java.util.List;
import java.util.Map;

public interface EchartsService {

    public List<Map> obsProportion(Map map);

    public List<Map> classStatistics(Map map);

    public Integer countTeacherByStudentId(Map map);
    public Integer countFileBySchoolId(Integer schoolId);

    public Integer countNewStudentBySchoolId(Integer schoolId);

}
