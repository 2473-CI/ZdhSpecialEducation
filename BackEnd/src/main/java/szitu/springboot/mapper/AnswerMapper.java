package szitu.springboot.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import szitu.springboot.model.Answer;

import java.util.Date;
import java.util.List;

@Mapper
public interface AnswerMapper {
    @Insert("""
            INSERT INTO answer 
            (scaleId,studentId,title, context, answerTime,degree, Evaluation1, Evaluation2, createTime)
            VALUES(#{scaleId}, #{studentId}, #{title}, #{context}, #{answerTime},#{degree}, #{Evaluation1}, #{Evaluation2}, NOW())

            """)
    public void insert(Long scaleId, Long studentId, String title, String context, Date answerTime, String degree, String Evaluation1, String Evaluation2);

    @Update("""
            UPDATE  answer 
            SET 
            scaleId=#{scaleId},
            studentId=#{studentId},
            title=#{title},
            context=#{context},
            answerTime=#{answerTime},
            degree=#{degree},
            Evaluation1=#{Evaluation1},
            Evaluation2=#{Evaluation2}
            WHERE answerId=#{answerId};
            """)
    public void update(Long answerId,Long scaleId, Long studentId, String title, String context, Date answerTime, String degree, String Evaluation1, String Evaluation2);


    @Select("""
            SELECT * FROM answer WHERE deleteTime IS NULL AND answerId=#{answerId};
            """)
    public Answer getOne(Long answerId);

    @Select("""
            SELECT * FROM answer WHERE deleteTime IS NULL;
            """)
    public List<Answer> getAll();

    @Select("""
            SELECT * FROM answer WHERE deleteTime IS NULL AND studentId=#{studentId};
            """)
    public List<Answer> getListByStudentId(Long studentId);

    @Select("""
            SELECT * FROM answer WHERE deleteTime IS NULL AND studentId=#{studentId} ORDER BY createTime DESC limit 1;
            """)
    public Answer lastInsert(Long studentId);

}
