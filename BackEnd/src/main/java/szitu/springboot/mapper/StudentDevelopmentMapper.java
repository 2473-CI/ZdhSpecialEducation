package szitu.springboot.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import szitu.springboot.model.StudentDevelopment;

import java.util.List;

@Mapper
public interface StudentDevelopmentMapper {

    @Select("""
            SELECT * FROM `studentDevelopment` WHERE deleteTime IS NULL AND studentId=#{studentId}
            """)
     public List<StudentDevelopment> selectByStudentId(Long studentId);

    @Insert("""
            INSERT INTO `studentDevelopment`(studentId, richText, createTime) values(#{studentId}, #{richText}, NOW())
            """)
    public void insert(StudentDevelopment studentDevelopment);
}
