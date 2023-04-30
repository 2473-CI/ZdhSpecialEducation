package szitu.springboot.service.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import szitu.springboot.mapper.ScaleMapper;
import szitu.springboot.model.Scale;
import szitu.springboot.service.ScaleService;

import java.util.List;

@Service
public class ScaleServiceImpl implements ScaleService {
    @Autowired
    private ScaleMapper scaleMapper;

    @Override
    public void insert(Long studentBasicId, String title, String context, String scoring) {
        scaleMapper.insert(studentBasicId, title, context, scoring);
    }

    @Override
    public List<Scale> getAll() {
        return scaleMapper.getAll();
    }

    @Override
    public List<Scale> search(String classify1, String classify2, String classify3, String title) {
        return scaleMapper.search(classify1, classify2, classify3, title);
    }

    @Override
    public Scale getById(Long id) {
        return scaleMapper.getOneContext(id);
    }

    @Override
    public void delete(Long scaleId) {
        scaleMapper.delete(scaleId);
    }
}
