package szitu.springboot.service.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import szitu.springboot.mapper.FamilyBasicMapper;
import szitu.springboot.model.FamilyBasic;
import szitu.springboot.service.FamilyBasicService;

@Service
public class FamilyBasicServiceImp implements FamilyBasicService {
    @Autowired
    public FamilyBasicMapper familyBasicMapper;

    @Override
    public void init(Long studentId) {
        familyBasicMapper.initFamilyBasic(studentId);
    }

    @Override
    public FamilyBasic get(Long studentId) {
        return familyBasicMapper.selectByStudentId(studentId);
    }

    @Override
    public void update(FamilyBasic familyBasic) {
        familyBasicMapper.updateFamilyBasic(familyBasic);
    }

}
