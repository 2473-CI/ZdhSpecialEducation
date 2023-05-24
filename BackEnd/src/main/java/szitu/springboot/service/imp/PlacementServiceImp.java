package szitu.springboot.service.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import szitu.springboot.mapper.PlacementMapper;
import szitu.springboot.model.Placement;
import szitu.springboot.service.PlacementService;

import java.util.List;

@Service
public class PlacementServiceImp implements PlacementService {
    @Autowired
    private PlacementMapper placementMapper;

    @Override
    public List<Placement> selectByStudentId(Placement placement) {
        return placementMapper.selectByStudentId(placement);
    }

    @Override
    public void insert(Placement placement) {
        placementMapper.insert(placement);
    }

    @Override
    public void end(Placement placement) {
        placementMapper.end(placement);
    }

    @Override
    public List<Placement> selectBySchoolId(Integer schoolId, Integer offset, Integer size) {
        return placementMapper.selectBySchoolId(schoolId, offset, size);
    }
}
