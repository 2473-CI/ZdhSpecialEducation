package szitu.springboot.mapper;

import org.apache.ibatis.annotations.*;
import szitu.springboot.model.Schedule;

import java.util.List;

@Mapper
public interface ScheduleMapper {
    @Select("SELECT * FROM schedule WHERE studentId=#{studentId}")
    public List<Schedule> selectByStudentId(Integer studentId);

    @Insert("INSERT INTO schedule(studentId, schedule) values(#{studentId}, #{schedule})")
    public void insert(Schedule schedule);

    @Delete("DELETE FROM schedule WHERE id = #{id}")
    public void deleteById(Integer id);
}
