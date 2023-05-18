package szitu.springboot.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import szitu.springboot.model.Special;
import szitu.springboot.model.Student;

import java.util.List;

@Mapper
public interface SpecialMapper {

    @Select("""
        SELECT * FROM `special` WHERE studentId=#{studentId}
    """)
    public List<Special> selectByStudentId(Special special);

    @Delete("""
        DELETE FROM `special` WHERE id=#{id}
    """)
    public void deleteById(Special special);

    @Select("""
        INSERT INTO `special`(
            studentId, studentName, startYear, lastYear, semester, teacherName, basicArea, gbArea, targetArea, psychologyArea, advantageArea, defectArea
        )
        VALUES(
            #{studentId}, #{studentName}, #{startYear}, #{lastYear}, #{semester}, #{teacherName}, #{basicArea}, #{gbArea}, #{targetArea}, #{psychologyArea}, #{advantageArea}, #{defectArea}
        )
    """)
    public void insert(Special special);


}
