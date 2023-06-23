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
}
