package szitu.springboot.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import szitu.springboot.model.Reflect;

import java.util.List;

public interface ReflectMapper {
    @Select("""
        SELECT * FROM `reflect` WHERE studentId=#{studentId}
    """)
    public List<Reflect> selectByStudentId(Reflect reflect);

    @Delete("""
        DELETE * FROM `reflect` WHERE id=#{id}
        """)
    public void deleteById(Reflect reflect);

    @Insert("""
        INSERT INTO `reflect`(
            studentId, studentName, startYear, lastYear, semester, teacherName,
            success, problem, improve
        )VALUES(
            #{studentId}, #{studentName}, #{startYear}, #{lastYear}, #{semester},#{teacherName},
            #{success},#{problem},#{improve}
        )
        """)
    public void insert(Reflect reflect);
}
