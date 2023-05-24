package szitu.springboot.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import szitu.springboot.model.Serve;

import java.util.List;

public interface ServeMapper {

    @Insert("""
        INSERT INTO 'serve'(studentId, studentName, content, description, head)
         values(#{studentId}, #{studentName}, #{content}, #{description}, #{head})
    """)
    public void insert(Serve serve);

    @Delete("""
        DELETE FROM 'serve' WHERE id=#{id}
        """)
    public void delete(Serve serve);

    @Select("""
        SELECT * FROM 'serve' WHERE studentId=#{studentId}
    """)
    public List<Serve> selectByStudentId(Serve serve);
}
