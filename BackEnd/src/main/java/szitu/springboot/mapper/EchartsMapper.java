package szitu.springboot.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

@Mapper
public interface EchartsMapper {
    @Select("""
        SELECT
            obstacle.obstacleName, sumRes.sum
        FROM
            (SELECT obstacleId, COUNT(1) as sum FROM `student` WHERE deleteTime IS NULL AND schoolId=#{schoolId} GROUP BY obstacleId) as sumRes
        JOIN obstacle ON obstacle.obstacleid = sumRes.obstacleid;
        """)
    public List<Map> obsProportion(Map map);

    @Select("""
        SELECT
            gradeName,
            COUNT( * ) AS sum\s
        FROM
            student
            JOIN clazz ON student.clazzId = clazz.clazzId
            JOIN grade ON clazz.gradeId = grade.gradeId\s
        WHERE
            student.schoolId = 7\s
            AND student.deleteTime IS NULL\s
        GROUP BY
            gradeName
        """)
    public List<Map> classStatistics(Map map);

    @Select("""
        SELECT COUNT(*) AS sum FROM teacher WHERE schoolId=#{schoolId} AND deleteTime IS NULL
    """)
    public Integer countTeacherByStudentId(Map map);

    @Select("""
        SELECT COUNT(1) as sum FROM teacher JOIN file ON file.fileOnwerId = teacher.account WHERE teacher.schoolId=#{schoolId}
    """)
    public Integer countFileBySchoolId(Integer schoolId);

    @Select("""
        SELECT count(1) as sum
        FROM student
        WHERE schoolId = #{schoolId} AND createTime >= DATE_SUB(NOW(), INTERVAL 1 YEAR);
        """)
    public Integer countNewStudentBySchoolId(Integer schoolId);

    @Select("""
    SELECT count(1) as sum FROM `student`
     JOIN exercise on student.studentId = exercise.studentId 
     WHERE student.schoolId = #{schoolId}
    """)
    public Integer countExerciseBySchoolId(Integer schoolId);

    @Select("""
        SELECT count(1) as sum FROM student JOIN
         answer on student.studentId = answer.studentId
          WHERE student.schoolId=#{schoolId}
    """)
    public Integer countAnswerBySchoolId(Integer schoolId);

    @Select("""
        SELECT count(1) as sum FROM student JOIN answer 
        on student.studentId = answer.studentId 
        AND answer.degree="已完成" WHERE student.schoolId=#{schoolId}
    """)
    public Integer countAnswerBySchoolIdEnd(Integer schoolId);

    @Select("""
        SELECT count(1) as sum FROM student JOIN 
        answer on student.studentId = answer.studentId 
        AND answer.degree="未完成" WHERE student.schoolId=#{schoolId}
    """)
    public Integer countAnswerBySchoolIdPadding(Integer schoolId);

    @Select("""
        SELECT count(1) FROM `clazz` WHERE schoolId=#{schoolId}
    """)
    public Integer countClassBySchoolId(Integer schoolId);

    @Select("""
        SELECT
            count(1)
        FROM
            student
            LEFT JOIN ( SELECT DISTINCT studentId FROM `plan` ) AS t1 ON student.studentId = t1.studentId
            LEFT JOIN ( SELECT DISTINCT studentId FROM `schedule` ) AS t2 ON student.studentId = t2.studentId
            LEFT JOIN ( SELECT DISTINCT studentId FROM `special` ) AS t3 ON student.studentId = t3.studentId
        WHERE t1.studentId is not NULL and t2.studentId is not null and t3.studentId is not null and student.schoolId = #{studentId};
            """)
    public Integer countIepEnd(Integer studentId);

    @Select("""
SELECT
	sum(
	IF
		( num1 IS NULL, 0, num1 ) +
	IF
		( num2 IS NULL, 0, num1 ) +
	IF
		( num3 IS NULL, 0, num1 )\s
	)\s
FROM
	student
	LEFT JOIN ( SELECT DISTINCT studentId, 1 AS num1 FROM `plan` ) AS t1 ON student.studentId = t1.studentId
	LEFT JOIN ( SELECT DISTINCT studentId, 1 AS num2 FROM `schedule` ) AS t2 ON student.studentId = t2.studentId
	LEFT JOIN ( SELECT DISTINCT studentId, 1 AS num3 FROM `special` ) AS t3 ON student.studentId = t3.studentId\s
	AND student.schoolId = #{studentId};
            """)
    public Integer countIep(Integer studentId);
}
