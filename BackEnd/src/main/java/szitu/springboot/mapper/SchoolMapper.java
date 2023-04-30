package szitu.springboot.mapper;

import org.apache.ibatis.annotations.*;
import szitu.springboot.model.School;

import java.util.List;

@Mapper
public interface SchoolMapper {
    @Select("SELECT * FROM `school` WHERE deleteTime IS NULL;")
    List<School> selectAllSchool();

    @Insert("""
                INSERT INTO `school` ( schoolName, provinceCode, cityCode, regionCode, createTime )
                VALUES (#{schoolName}, #{provinceCode}, #{cityCode}, #{regionCode}, NOW())
            """)
    void InsertSchool(@Param("schoolName") String schoolName,
                      @Param("provinceCode") String provinceCode,
                      @Param("cityCode") String cityCode,
                      @Param("regionCode") String regionCode);

    @Update("UPDATE `school` set deleteTime=NOW() where schoolId=#{schoolId}")
    void delete(Long schoolId);

    @Select("SELECT * FROM `school` WHERE deleteTime IS NULL AND regionCode=#{regionCode};")
    List<School> selectAllFilterRegion(Long regionCode);
}
