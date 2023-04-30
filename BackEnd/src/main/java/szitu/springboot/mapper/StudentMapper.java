package szitu.springboot.mapper;

import org.apache.ibatis.annotations.*;
import szitu.springboot.model.Board;
import szitu.springboot.model.Student;

import java.util.List;

@Mapper
public interface StudentMapper {

    @Select("""
            SELECT s.studentId, sc.schoolName, c.clazzName, s.studentName, s.studentHead, s.studentGender, o.obstacleName, a.arrangeName
            FROM student s
            INNER JOIN clazz c ON s.clazzId = c.clazzId
            INNER JOIN school sc ON s.schoolId = sc.schoolId
            LEFT JOIN obstacle o ON s.obstacleId = o.obstacleId
            LEFT JOIN arrange a ON s.arrangeId = a.arrangeId
            WHERE s.deleteTime IS NULL;
            """)
    public List<Student> selectAll();

    @Select("""
            <script>
            SELECT s.studentId, sc.schoolName, c.clazzName, s.studentName, s.studentHead, s.studentGender, o.obstacleName, a.arrangeName
            FROM student s
            INNER JOIN clazz c ON s.clazzId = c.clazzId
            INNER JOIN school sc ON s.schoolId = sc.schoolId
            LEFT JOIN obstacle o ON s.obstacleId = o.obstacleId
            LEFT JOIN arrange a ON s.arrangeId = a.arrangeId
            WHERE s.deleteTime IS NULL
            <if test='schoolId != null'>
                AND s.schoolId = #{schoolId} 
            </if>
            <if test='clazzId != null'>
                AND s.clazzId = #{clazzId} 
            </if>
            <if test='studentGender != null'>
                AND s.studentGender like CONCAT('%',#{studentGender},'%')
            </if>
            <if test='obstacleId != null'>
                AND s.obstacleId = #{obstacleId} 
            </if>
            <if test='arrangeId != null'>
                AND s.arrangeId = #{arrangeId} 
            </if>
            <if test='studentName != null'>
                AND s.studentName like CONCAT('%',#{studentName},'%')
            </if>
            LIMIT #{offset}, #{size};
            </script>
            """)
    public List<Student> search(Long schoolId, Long clazzId, String studentName,
                                String studentGender, Long obstacleId, Long arrangeId,
                                Long offset, Long size);

    @Select("""
            <script>
            SELECT count(1)
            FROM student s
            INNER JOIN clazz c ON s.clazzId = c.clazzId
            INNER JOIN school sc ON s.schoolId = sc.schoolId
            LEFT JOIN obstacle o ON s.obstacleId = o.obstacleId
            LEFT JOIN arrange a ON s.arrangeId = a.arrangeId
            WHERE s.deleteTime IS NULL
            <if test='schoolId != null'>
                AND s.schoolId = #{schoolId} 
            </if>
            <if test='clazzId != null'>
                AND s.clazzId = #{clazzId} 
            </if>
            <if test='studentGender != null'>
                AND s.studentGender like CONCAT('%',#{studentGender},'%')
            </if>
            <if test='obstacleId != null'>
                AND s.obstacleId = #{obstacleId} 
            </if>
            <if test='arrangeId != null'>
                AND s.arrangeId = #{arrangeId} 
            </if>
            <if test='studentName != null'>
                AND s.studentName like CONCAT('%',#{studentName},'%')
            </if>;
            </script>
            """)
    public Long searchCount(Long schoolId, Long clazzId, String studentName,
                                String studentGender, Long obstacleId, Long arrangeId);

    @Update("UPDATE `student` SET deleteTime = NOW() WHERE studentId=#{studentId};")
    public void deleteStudent(Long studentId);

    @Insert("INSERT INTO student(schoolId, clazzId, studentName, studentHead, studentGender, obstacleId, arrangeId, createTime) " +
            "values(#{schoolId}, #{clazzId}, #{studentName}, #{studentHead}, #{studentGender}, #{obstacleId}, #{arrangeId}, NOW())")
    public void insertStudent(Long schoolId, Long clazzId, String studentName,
                              String studentHead, String studentGender, Long obstacleId, Long arrangeId);


    @Select("""
            SELECT s.studentId, sc.schoolName, c.clazzName, s.studentName, s.studentHead, s.studentGender, o.obstacleName, a.arrangeName
            FROM student s
            INNER JOIN clazz c ON s.clazzId = c.clazzId
            INNER JOIN school sc ON s.schoolId = sc.schoolId
            LEFT JOIN obstacle o ON s.obstacleId = o.obstacleId
            LEFT JOIN arrange a ON s.arrangeId = a.arrangeId
            WHERE s.deleteTime IS NULL
            AND studentId=#{studentId};
            """)
    public Student selectByStudentId(Long studentId);

    @Update("""
            <script>
            UPDATE `student` SET 
            <if test='clazzId != null'> clazzId=#{clazzId}, </if>
            <if test='studentName != null'> studentName=#{studentName}, </if>
            <if test='studentHead != null'> studentHead=#{studentHead}, </if>
            <if test='studentGender != null'> studentGender=#{studentGender}, </if>
            <if test='obstacleId != null'> obstacleId=#{obstacleId}, </if>
            <if test='arrangeId != null'> arrangeId=#{arrangeId} </if>
            <if test='arrangeId == null'> arrangeId=1 </if>
            WHERE studentId=#{studentId};
            </script>
            """)
    public void update(Long studentId, Long clazzId, String studentName, String studentHead, String studentGender, Long obstacleId, Long arrangeId);

    @Select("SELECT * FROM `student` WHERE account=#{account} AND deleteTime is NULL;")
    public Student getByAccount(String account);

    @Select("SELECT * FROM `student` WHERE studentId=#{studentId} AND deleteTime is NULL;")
    public Student getById(Long studentId);

//    @Select("""
//            SELECT * FROM student WHERE deleteTime is NULL AND (authorization != "完成" OR  authorization IS NULL);
//            """)
//    public List<Student> needAuth();

    @Update("""
            UPDATE student SET authorization=#{authorization}  WHERE deleteTime is NULL AND studentId=#{studentId};
            """)
    public void auth(Long studentId, String authorization);

    @Select("""
           <script>
           SELECT s.*, sch.schoolName
           FROM student s
           JOIN school sch ON s.schoolId = sch.schoolId
           WHERE s.authorization IS NOT NULL AND s.authorization != '审批完成'
           <if test="schoolId != null">
             AND s.schoolId = #{schoolId}
           </if>
           <if test="regionId != null">
             AND sch.regionCode = #{regionId}
           </if>
           <if test="authorization != null">
             AND s.authorization = #{authorization}
           </if>
           ORDER BY s.createTime DESC
           LIMIT #{offset}, #{size};
           </script>
            """)
    public List<Student> needAuth(String authorization, Long schoolId, Long regionId, Long offset, Long size);

}
