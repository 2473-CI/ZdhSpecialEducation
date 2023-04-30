package szitu.springboot.service.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import szitu.springboot.mapper.ArrangeMapper;
import szitu.springboot.model.Arrange;
import szitu.springboot.service.ArrangeService;

import java.util.List;

@Service
public class ArrangeServiceImp implements ArrangeService {
    @Autowired
    private ArrangeMapper arrangeMapper;

    @Override
    public List<Arrange> getAll() {
        return arrangeMapper.selectAll();
    }
}
