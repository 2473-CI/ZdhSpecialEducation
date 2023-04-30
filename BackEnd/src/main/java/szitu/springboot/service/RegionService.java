package szitu.springboot.service;

import szitu.springboot.model.Region;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface RegionService {
    List<Region> getAll();

    List<Region> selectProvince();

    List<Region> selectCity( Long provinceCode);

    List<Region> selectRegion( Long cityCode);
    public Region selectOneMess(Long regionCode);
}
