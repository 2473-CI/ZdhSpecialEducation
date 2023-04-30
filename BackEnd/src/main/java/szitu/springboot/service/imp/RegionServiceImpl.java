package szitu.springboot.service.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import szitu.springboot.mapper.RegionMapper;
import szitu.springboot.model.Region;
import szitu.springboot.service.RegionService;

import java.util.List;

@Service
public class RegionServiceImpl implements RegionService {

    @Autowired
    private RegionMapper regionMapper;

    @Override
    public List<Region> getAll() {
        return regionMapper.getAll();
    }

    @Override
    public List<Region> selectProvince() {
        return regionMapper.selectProvince();
    }

    @Override
    public List<Region> selectCity(Long provinceCode) {
        return regionMapper.selectCity(provinceCode);
    }

    @Override
    public List<Region> selectRegion(Long cityCode) {
        return regionMapper.selectRegion(cityCode);
    }

    @Override
    public Region selectOneMess(Long regionCode) {
        return regionMapper.selectOneMess(regionCode);
    }
}
