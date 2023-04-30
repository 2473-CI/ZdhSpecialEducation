package szitu.springboot.service.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import szitu.springboot.mapper.SchoolMapper;
import szitu.springboot.model.School;
import szitu.springboot.service.SchoolService;

import java.util.List;

@Service
public class SchoolServiceImpl implements SchoolService {
    @Autowired
    private SchoolMapper schoolMapper;

    @Override
    public List<School> selectAllSchool() {
        return schoolMapper.selectAllSchool();
    }

    @Override
    public boolean addSchool(String schoolName, String provinceCode, String cityCode, String regionCode) {
        // 学校名称不能为空
        if(schoolName == null){
            return false;
        }
        try {
            schoolMapper.InsertSchool(schoolName, provinceCode, cityCode, regionCode);
            return true;
        }catch (Exception err){
            return false;
        }
    }

    @Override
    public void delete(Long schoolId) {
        schoolMapper.delete(schoolId);
    }

    @Override
    public List<School> selectAllFilterRegion(Long regionCode) {
        return schoolMapper.selectAllFilterRegion(regionCode);
    }
}
