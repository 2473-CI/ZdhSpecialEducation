package szitu.springboot.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import szitu.springboot.model.Clazz;

import java.util.List;

@Mapper
public interface ClazzMapper {
    @Select("""
            SELECT s.schoolName, g.gradeName, c.clazzName, c.createTime, c.description, c.clazzId
            FROM clazz c
            JOIN school s ON c.schoolId = s.schoolId
            JOIN grade g ON c.gradeId = g.gradeId
            WHERE c.deleteTime IS NULL;
            """)
    public List<Clazz> getAll();

    @Select("""
            <script>
                SELECT s.schoolName, g.gradeName, c.clazzName, c.createTime, c.description, c.clazzId
                FROM clazz c
                JOIN school s ON c.schoolId = s.schoolId
                JOIN grade g ON c.gradeId = g.gradeId
                WHERE c.deleteTime IS NULL 
                    <if test='schoolId != null'>
                    AND c.schoolId = #{schoolId} 
                    </if>
                    <if test='gradeId != null'>
                    AND g.gradeId = #{gradeId} 
                    </if>
                    <if test='clazzName != null'>
                    AND c.clazzName like CONCAT('%',#{clazzName},'%')
                    </if>
                LIMIT #{offset}, #{size};
            </script>
            """)
    public List<Clazz> selectBySchoolAndGrade(Long schoolId, Long gradeId, String clazzName, Long offset, Long size);

    @Select("""
            <script>
                SELECT count(*)
                FROM clazz c
                JOIN school s ON c.schoolId = s.schoolId
                JOIN grade g ON c.gradeId = g.gradeId
                WHERE c.deleteTime IS NULL 
                    <if test='schoolId != null'>
                    AND c.schoolId = #{schoolId} 
                    </if>
                    <if test='gradeId != null'>
                    AND g.gradeId = #{gradeId} 
                    </if>
                    <if test='clazzName != null'>
                    AND c.clazzName like CONCAT('%',#{clazzName},'%')
                    </if>;
            </script>
            """)
    public Long selectBySchoolAndGradeCount(Long schoolId, Long gradeId, String clazzName);

    @Update("UPDATE `clazz` SET gradeId = #{gradeId} ,clazzName = #{clazzName} ,description = #{description} WHERE clazzId=#{clazzId};")
    public void updateClazz(Long clazzId, Long gradeId, String clazzName, String description);

    @Update("UPDATE `clazz` SET deleteTime = NOW() WHERE clazzId=#{clazzId};")
    public void deleteClazz(Long clazzId);

    @Insert("INSERT INTO `clazz`(schoolId, gradeId, clazzName, description, createTime) values(#{schoolId}, #{gradeId}, #{clazzName}, #{description}, NOW());")
    public void insertClazz(Long schoolId, Long gradeId, String clazzName, String description);

}
