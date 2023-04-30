package szitu.springboot.service.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import szitu.springboot.mapper.LoveMapper;
import szitu.springboot.model.Love;
import szitu.springboot.service.LoveService;

import java.awt.*;

@Service
public class LoveServiceImp implements LoveService {
    @Autowired
    public LoveMapper loveMapper;
    @Override
    public void init(Long studentid) {
        loveMapper.initLove(studentid);
    }

    @Override
    public Love get(Long studentId) {
        return loveMapper.SelectLove(studentId);
    }

    @Override
    public void update(Love love) {
        loveMapper.UpdateLove(love);
    }
}
