package szitu.springboot.service.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import szitu.springboot.mapper.GrowUpMapper;
import szitu.springboot.model.GrowUp;
import szitu.springboot.service.GrowUpService;

@Service
public class GrowUpServiceImp implements GrowUpService {
    @Autowired
    private GrowUpMapper growUpMapper;


    @Override
    public void init(Long studentId) {
        growUpMapper.initGrowUp(studentId);
    }

    @Override
    public GrowUp get(Long studentId) {
        return growUpMapper.selectByStudentId(studentId);
    }

    @Override
    public void update(GrowUp growUp) {
        growUpMapper.update(growUp);
    }
}
