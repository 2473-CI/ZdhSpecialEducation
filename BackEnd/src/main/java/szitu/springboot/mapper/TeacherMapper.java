package szitu.springboot.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import szitu.springboot.model.Teacher;

import java.util.List;

@Mapper
public interface TeacherMapper {
    /**
     * 增
     * @param teacher
     */
    @Insert("""
            INSERT INTO `teacher` (schoolId, account, userName, passWord, userHead, userGender, userPhone, userMail, schoolAdmin, createTime) 
            VALUE(#{schoolId}, #{account}, #{userName},#{passWord},#{userHead},#{userGender},#{userPhone},#{userMail},#{schoolAdmin}, NOW())
            """)
    public void insert(Teacher teacher);

    /**
     * 删
     */
    @Update("UPDATE `teacher` set deleteTime = NOW() WHERE teacherId=#{teacherId} AND deleteTime is NULL;")
    public void delete(Long teacherId);


    /**
     * 改
     */
    @Update("""
            UPDATE `teacher` set 
            userName = #{userName},
            passWord = #{passWord},
            userHead = #{userHead},
            userGender = #{userGender},
            userPhone = #{userPhone},
            userMail = #{userMail},
            schoolAdmin = #{schoolAdmin}
            WHERE teacherId=#{teacherId} AND deleteTime is NULL;
            """)
    public void update(Teacher teacher);

    @Update("""
            UPDATE `teacher` SET
            authorization = "授权"
            WHERE teacherId=#{teacherId} AND deleteTime is NULL;
            """)
    public void updateAuth(Long teacherId);

    /**
     * 查
     * @param account
     * @return
     */
    @Select("SELECT * FROM `teacher` WHERE account=#{account} AND deleteTime is NULL;")
    public Teacher getByAccount(String account);

    @Select("SELECT * FROM `teacher` WHERE deleteTime is NULL;")
    public List<Teacher> select();


    @Select("""
        <script>
            SELECT * FROM `teacher` WHERE deleteTime is NULL 
            <if test='schoolId != null'>
                AND schoolId = #{schoolId}
            </if>
            <if test='userName != null'>
                AND userName LIKE CONCAT('%',#{userName},'%')
            </if>
            <if test='userPhone != null'>
                AND userPhone LIKE CONCAT('%',#{userPhone},'%')
            </if>
            <if test='userMail != null'>
                AND userMail LIKE CONCAT('%',#{userMail},'%')
            </if>
            LIMIT #{offset}, #{size} 
            ;
        </script>
    """)
    public List<Teacher> search(Integer schoolId, String userName, String userPhone, String userMail, Integer offset, Integer size);
//
//    @Select("SELECT * FROM `teacher` WHERE deleteTime is NULL;")
//    public List<Teacher> select();
}
