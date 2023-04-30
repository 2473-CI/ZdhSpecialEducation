package szitu.springboot.service.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import szitu.springboot.mapper.CommitteeMapper;
import szitu.springboot.model.Committee;
import szitu.springboot.service.CommitteeService;

import java.util.List;

@Service
public class CommitteeServiceImpl implements CommitteeService {
    @Autowired
    private CommitteeMapper committeeMapper;

    /**
     * 增
     * @param committee
     */
    @Override
    public void create(Committee committee) {
        committeeMapper.insert(committee);
    }

    /**
     * 删
     * @return
     */
    @Override
    public void delete(Long regionId) {
        committeeMapper.delete(regionId);
    }

    /**
     * 改
     * @return
     */
    @Override
    public void update(Committee committee) {
        committeeMapper.update(committee);
    }
    /**
     * 查
     * @return
     */
    @Override
    public List<Committee> getAll() {
        return committeeMapper.getAll();
    }

    @Override
    public Committee getById(Long id) {
        return committeeMapper.getById(id);
    }

    @Override
    public Committee isCenter(Long subordinateCenter) {
        return committeeMapper.isCenter(subordinateCenter);
    }
}
