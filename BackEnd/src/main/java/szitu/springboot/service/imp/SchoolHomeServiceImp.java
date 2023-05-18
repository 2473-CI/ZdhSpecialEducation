package szitu.springboot.service.imp;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import szitu.springboot.mapper.SchoolHomeMapper;
import szitu.springboot.model.SchoolHome;
import szitu.springboot.service.SchoolHomeService;

import java.util.List;

@Service
public class SchoolHomeServiceImp implements SchoolHomeService {
    @Autowired
    private SchoolHomeMapper schoolHomeMapper;

    @Override
    public List<SchoolHome> selectByStudentId(SchoolHome schoolHome) {
        return schoolHomeMapper.selectByStudentId(schoolHome);
    }

    @Override
    public void deleteById(SchoolHome schoolHome) {
        schoolHomeMapper.deleteById(schoolHome);
    }

    @Override
    public void insert(SchoolHome schoolHome) {
        schoolHomeMapper.insert(schoolHome);
    }
}
