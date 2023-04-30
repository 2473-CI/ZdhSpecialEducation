package szitu.springboot.service;

import org.apache.ibatis.annotations.Param;
import szitu.springboot.model.School;

import java.util.List;

public interface SchoolService {
    public List<School> selectAllSchool();

    public boolean addSchool(String schoolName, String provinceCode, String cityCode, String regionCode);

    public void delete(Long schoolId);

    List<School> selectAllFilterRegion(Long regionCode);
}
