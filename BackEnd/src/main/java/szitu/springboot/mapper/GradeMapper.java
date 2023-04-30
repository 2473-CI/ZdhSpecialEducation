package szitu.springboot.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import szitu.springboot.model.Grade;

import java.util.List;

@Mapper
public interface GradeMapper {
    @Select("SELECT * FROM `grade`")
    public List<Grade> getAll();
}
