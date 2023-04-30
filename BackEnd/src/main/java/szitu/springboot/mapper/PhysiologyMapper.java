package szitu.springboot.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import szitu.springboot.model.Physiology;

@Mapper
public interface PhysiologyMapper {

    @Insert("INSERT INTO `physiology`(studentId, irritability, healthProblem, otherHealthProblem, pharmacy, speakAssist, otherAssist)" +
            " VALUES(#{studentId}, '', '','','','','')")
    public void initPhysiologyMapper(Long studentId);

    @Select("SELECT * FROM `physiology` WHERE studentId=#{studentId}")
    public Physiology SelectByStudentId(Long studentId);

    @Update("""
            UPDATE `physiology` SET irritability=#{irritability}, healthProblem=#{healthProblem}, 
             otherHealthProblem=#{otherHealthProblem} ,
             pharmacy=#{pharmacy}, speakAssist=#{speakAssist}, speakAssist=#{speakAssist}, otherAssist=#{otherAssist}
             WHERE studentId=#{studentId};
            """)
    public void updatePhysiology(Physiology physiology);


}
