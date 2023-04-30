package szitu.springboot.mapper;

import org.apache.ibatis.annotations.*;
import szitu.springboot.model.Exercise;
import szitu.springboot.model.User;

import java.util.List;

@Mapper
public interface ExerciseMapper {
    @Select("SELECT * FROM exercise WHERE studentId=#{studentId} AND deleteTime IS NULL")
    public List<Exercise> selectByStudentId(Long studentId);

    @Insert("""
        INSERT INTO `exercise`(studentId, title, subTitle, context, annex, startTime, endTime)
        VALUES(#{studentId}, #{title}, #{subTitle}, #{context}, #{annex}, #{startTime}, #{endTime})
        """)
    public void insert(Exercise exercise);


    @Update("""
        UPDATE `exercise` SET 
            title=#{title},
            subTitle=#{subTitle},
            context=#{context},
            annex=#{annex},
            startTime=#{startTime},
            endTime=#{endTime}
         WHERE id=#{id};
    """)
    public void update(Exercise exercise);

    @Select("""
        SELECT * FROM exercise WHERE studentId=#{studentId} AND deleteTime IS NULL order by createTime ASC LIMIT 1;
        """)
    public Exercise getLast(Long studentId);

    @Update("""
         UPDATE `exercise` SET deleteTime=NOW() WHERE id=#{id};
        """)
    public void deleteById(Long id);
}
