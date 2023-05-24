package szitu.springboot.service.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import szitu.springboot.mapper.ServeMapper;
import szitu.springboot.model.Serve;
import szitu.springboot.service.ServeService;

import java.util.List;

@Service
public class ServeServiceImp implements ServeService {
    @Autowired
    private ServeMapper serveMapper;

    @Override
    public void insert(Serve serve) {
        serveMapper.insert(serve);
    }

    @Override
    public void delete(Serve serve) {
        serveMapper.delete(serve);
    }

    @Override
    public List<Serve> selectByStudentId(Serve serve) {
        return serveMapper.selectByStudentId(serve);
    }
}
