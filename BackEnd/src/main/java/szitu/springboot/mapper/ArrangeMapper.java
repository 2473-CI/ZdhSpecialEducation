package szitu.springboot.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import szitu.springboot.model.Arrange;

import java.util.List;

@Mapper
public interface ArrangeMapper {

    @Select("SELECT * FROM arrange")
    public List<Arrange> selectAll();
}
