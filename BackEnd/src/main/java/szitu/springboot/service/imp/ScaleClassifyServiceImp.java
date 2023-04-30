package szitu.springboot.service.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import szitu.springboot.mapper.ScaleClassifyMapper;
import szitu.springboot.model.ScaleClassify;
import szitu.springboot.service.ScaleClassifyService;

import java.util.List;

@Service
public class ScaleClassifyServiceImp implements ScaleClassifyService {
    @Autowired
    public ScaleClassifyMapper scaleClassifyMapper;

    @Override
    public List<ScaleClassify> getAll() {
        return scaleClassifyMapper.getAll();
    }

    @Override
    public List<ScaleClassify> search(String classify1, String classify2, String classify3) {
        return scaleClassifyMapper.search(classify1, classify2, classify3);
    }

    @Override
    public void add(String classify1, String classify2, String classify3) {
        scaleClassifyMapper.insert(classify1, classify2, classify3);
    }

    @Override
    public void delete(Long id) {
        scaleClassifyMapper.delete(id);
    }


}
