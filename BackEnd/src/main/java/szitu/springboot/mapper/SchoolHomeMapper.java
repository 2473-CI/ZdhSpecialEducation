package szitu.springboot.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import szitu.springboot.model.SchoolHome;

import java.util.List;

@Mapper
public interface SchoolHomeMapper {

    @Select("""
        SELECT * FROM `schoolHome` WHERE studentId=#{studentId};
        """)
    public List<SchoolHome> selectByStudentId(SchoolHome schoolHome);

    @Delete("""
        DELETE FROM `schoolHome` WHERE id=#{id}
        """)
    public void deleteById(SchoolHome schoolHome);

    @Insert("""
        INSERT INTO `schoolHome`(
        studentId, studentName, startYear, lastYear, semester,
        teacherName, situation, assist, feedback
        )VALUES(
        #{studentId}, #{studentName}, #{startYear}, #{lastYear}, #{semester},
        #{teacherName}, #{situation}, #{assist}, #{feedback}
        )
        """)
    public void insert(SchoolHome schoolHome);
}
