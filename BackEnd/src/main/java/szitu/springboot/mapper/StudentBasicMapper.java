package szitu.springboot.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import szitu.springboot.model.StudentBasic;

import java.util.Date;

@Mapper
public interface StudentBasicMapper {
    @Insert("""
            <script>
            INSERT INTO studentBasic(studentId, nickname, birthday, obstacleDegree, otherObstacleId, cardId, obstacleCardId, nation, bloodGroup, nationality, studentStatus, studentNo, religiousBelief, registeredResidence, birthplace)
            VALUES(#{studentId}, "", #{birthday}, "", null, "", "", "", "", "", "", "", "", "", "")
            </script>
            """)
    public void init(Long studentId, Date birthday);

    @Select("""
            SELECT * FROM studentBasic s LEFT JOIN obstacle o ON s.otherObstacleId=o.obstacleId WHERE s.studentId=#{studentId}
            """)
    public StudentBasic selectByStudentId(Long studentId);

    @Update("""
            <script>
            UPDATE studentBasic SET
            <if test='nickname != null'> nickname=#{nickname}, </if>
            <if test='birthday != null'> birthday=#{birthday}, </if>
            <if test='obstacleDegree != null'> obstacleDegree=#{obstacleDegree}, </if>
            <if test='otherObstacleName != null'> otherObstacleId=CONVERT(#{otherObstacleName}, SIGNED),</if>
            <if test='cardId != null'> cardId=#{cardId}, </if>
            <if test='obstacleCardId != null'> obstacleCardId=#{obstacleCardId}, </if>
            <if test='nation != null'> nation=#{nation}, </if>
            <if test='bloodGroup != null'> bloodGroup=#{bloodGroup}, </if>
            <if test='nationality != null'> nationality=#{nationality}, </if>
            <if test='studentStatus != null'> studentStatus=#{studentStatus}, </if>
            <if test='studentNo != null'> studentNo=#{studentNo}, </if>
            <if test='religiousBelief != null'> religiousBelief=#{religiousBelief}, </if>
            <if test='registeredResidence != null'> registeredResidence=#{registeredResidence}, </if>
            birthplace=#{birthplace}
            WHERE studentId=#{studentId};
            </script>
            """)
    public void update(StudentBasic studentBasic);

}
