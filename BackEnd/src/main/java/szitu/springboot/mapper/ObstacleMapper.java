package szitu.springboot.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import szitu.springboot.model.Obstacle;

import java.util.List;

@Mapper
public interface ObstacleMapper {

    @Select("SELECT * FROM obstacle")
    public List<Obstacle> selectAll();

}
