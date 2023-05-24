package szitu.springboot.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import szitu.springboot.model.Placement;

import java.util.List;

@Mapper
public interface PlacementMapper {

    @Select("""
        SELECT * FROM `placement` WHERE schoolId=#{schoolId} limit #{offset}, #{size}
    """)
    public List<Placement> selectBySchoolId(Integer schoolId, Integer offset, Integer size);


    @Select("""
        SELECT * FROM `placement` WHERE studentId=#{studentId};
        """)
    public List<Placement> selectByStudentId(Placement placement);

    @Insert("""
        INSERT INTO `placement`
        (studentId, studentName, schoolId, schoolName, 
            `from`, `to`, toId, pass, createTime) VALUES(
            #{studentId}, #{studentName}, #{schoolId}, #{schoolName}, 
            #{from}, #{to}, #{toId}, "待审批", now()
        )
    """)
    public void insert(Placement placement);

    @Update("""
        UPDATE `placement` set pass=#{pass}, other=#{other} WHERE id=#{id}
    """)
    public void end(Placement placement);

}
