package szitu.springboot.mapper;

import org.apache.ibatis.annotations.*;
import szitu.springboot.model.Schedule;

import java.util.List;

@Mapper
public interface ScheduleMapper {
    @Select("""
        <script> 
        SELECT * FROM schedule WHERE 
            <if test="studentId != null">
                studentId=#{studentId}
            </if>
            <if test="classId != null">
                classId=#{classId}
            </if>
        </script>
        """)
    public List<Schedule> selectByStudentId(Schedule schedule);

    @Insert("""
        <script>    
            INSERT INTO schedule(
                    <if test="studentId != null">
                        studentId, 
                    </if>
                    <if test="classId != null">
                        classId, 
                    </if>
                    schedule, 
                    `time`, 
                    title) 
                values(
                     <if test="studentId != null">
                        #{studentId}, 
                    </if>
                    <if test="classId != null">
                        #{classId}, 
                    </if>
                    #{schedule}, 
                    #{time}, 
                    #{title}
                )
        </script>
        """)
    public void insert(Schedule schedule);

    @Delete("DELETE FROM schedule WHERE id = #{id}")
    public void deleteById(Integer id);
}
