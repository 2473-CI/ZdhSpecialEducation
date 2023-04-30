package szitu.springboot.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import szitu.springboot.model.Region;

import java.util.List;

@Mapper
public interface RegionMapper {
    @Select("SELECT * FROM `region`;")
    List<Region> getAll();

    @Select("SELECT provinceName, provinceCode FROM `region` GROUP BY provinceName, provinceCode;")
    List<Region> selectProvince();

    @Select("SELECT cityName, cityCode FROM `region` WHERE  provinceCode=#{provinceCode} GROUP BY cityName, cityCode;")
    List<Region> selectCity( Long provinceCode);

    @Select("SELECT regionName, regionCode FROM `region` WHERE  cityCode=#{cityCode} GROUP BY regionName, regionCode;")
    List<Region> selectRegion( Long cityCode);

    @Select("SELECT * FROM `region` WHERE regionCode=#{regionCode};")
    Region selectOneMess(Long regionCode);

}
