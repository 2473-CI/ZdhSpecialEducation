package szitu.springboot.service.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import szitu.springboot.mapper.SpecialMapper;
import szitu.springboot.model.Special;
import szitu.springboot.service.SpecialService;

import java.util.List;

@Service
public class SpecialServiceImp implements SpecialService {
    @Autowired
    private SpecialMapper specialMapper;

    @Override
    public List<Special> selectByStudentId(Special special) {
        return specialMapper.selectByStudentId(special);
    }

    @Override
    public void deleteById(Special special) {
        specialMapper.deleteById(special);
    }

    @Override
    public void insert(Special special) {
        specialMapper.insert(special);
    }
}
