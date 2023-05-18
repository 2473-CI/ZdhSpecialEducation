package szitu.springboot.service.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import szitu.springboot.mapper.ReflectMapper;
import szitu.springboot.model.Reflect;
import szitu.springboot.service.ReflectService;

import java.util.List;

@Service
public class ReflectServiceImp implements ReflectService {
    @Autowired
    private ReflectMapper reflectMapper;

    @Override
    public List<Reflect> selectByStudentId(Reflect reflect) {
        return reflectMapper.selectByStudentId(reflect);
    }

    @Override
    public void deleteById(Reflect reflect) {
        reflectMapper.deleteById(reflect);
    }

    @Override
    public void insert(Reflect reflect) {
        reflectMapper.insert(reflect);
    }
}
