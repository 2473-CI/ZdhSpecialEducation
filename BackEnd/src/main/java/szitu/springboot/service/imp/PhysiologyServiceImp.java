package szitu.springboot.service.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import szitu.springboot.mapper.PhysiologyMapper;
import szitu.springboot.model.Physiology;
import szitu.springboot.service.PhysiologyService;

@Service
public class PhysiologyServiceImp implements PhysiologyService {

    @Autowired
    private PhysiologyMapper physiologyMapper;


    @Override
    public void init(Long studentId) {
        physiologyMapper.initPhysiologyMapper(studentId);
    }

    @Override
    public Physiology get(Long studentId) {
        return physiologyMapper.SelectByStudentId(studentId);
    }

    @Override
    public void update(Physiology physiology) {
        physiologyMapper.updatePhysiology(physiology);
    }
}
