package szitu.springboot.mapper;

import lombok.Data;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import szitu.springboot.model.Plan;

import java.util.List;

@Mapper
public interface PlanMapper {
    @Select("""
        SELECT * FROM `plan` WHERE studentId=#{studentId}
        """)
    public List<Plan> selectByStudentId(Plan plan);

    @Delete("""
        DELETE FROM `plan` WHERE id=#{id}
        """)
    public void deleteById(Plan plan);

    @Insert("""
        INSERT INTO `plan` (
            studentId, studentName, height, weight, leftEyes, rightEyes,
            radio, perception, action, language, cognition, socialize,
            life, emotion, advantage, defect, startYear, lastYear, semester
        )
        VALUES(
            #{studentId}, #{studentName}, #{height}, #{weight}, #{leftEyes}, #{rightEyes},
            #{radio}, #{perception}, #{action}, #{language}, #{cognition}, #{socialize},
            #{life}, #{emotion}, #{advantage}, #{defect}, #{startYear}, #{lastYear}, #{semester}
        )
        """)
    public void insert(Plan plan);

}
