package szitu.springboot.mapper;

import org.apache.ibatis.annotations.*;
import szitu.springboot.model.User;

import java.util.List;

@Mapper
public interface UserMapper {
    @Select("SELECT * FROM `user` WHERE deleteTime IS NULL AND userAccount = #{userAccount};")
    User selectByAccount(@Param("userAccount") String userAccount);

    @Insert("""
            INSERT INTO `user` (
            	schoolId, userAccount, userName, passWord, userRole, userHead, userGender, userPhone, userMail,
                createTime
            )
            VALUES(
            	 #{schoolId}, #{userAccount}, #{userName}, #{passWord}, #{userRole},#{userHead}, #{userGender},#{userPhone},#{userMail},
            	 NOW() 
            )
            """)
    void InsertUser(@Param("schoolId") Long schoolId,
                    @Param("userAccount") String userAccount,
                    @Param("userName") String userName,
                    @Param("passWord") String passWord,
                    @Param("userRole") String userRole,
                    @Param("userHead") String userHead,
                    @Param("userGender") String userGender,
                    @Param("userPhone") String userPhone,
                    @Param("userMail") String userMail);

    @Select("SELECT * FROM `user` WHERE deleteTime IS NULL")
    List<User> getAll();

    @Select("""
            SELECT
            	*
            FROM
            	`user`
            WHERE
            	deleteTime IS NULL
            	AND schoolId = #{schoolId}
            	AND userName like CONCAT('%',#{userName},'%')
            	AND userPhone like CONCAT('%',#{userPhone},'%')
            	AND userMail like CONCAT('%',#{userMail},'%')
            	LIMIT #{offset},#{size};
            """)
    List<User> searchIncludeSchoolId(Long schoolId, String userName, String userPhone, String userMail, Long offset, Long size);

    @Select("""
            SELECT
            	count(*)
            FROM
            	`user`
            WHERE
            	deleteTime IS NULL
            	AND schoolId = #{schoolId}
            	AND userName like CONCAT('%',#{userName},'%')
            	AND userPhone like CONCAT('%',#{userPhone},'%')
            	AND userMail like CONCAT('%',#{userMail},'%');
            """)
    Long searchIncludeSchoolIdCount(Long schoolId, String userName, String userPhone, String userMail, Long offset, Long size);


    @Select("""
            SELECT
            	*
            FROM
            	`user`
            WHERE
            	deleteTime IS NULL
            	AND userName like CONCAT('%',#{userName},'%')
            	AND userPhone like CONCAT('%',#{userPhone},'%')
            	AND userMail like CONCAT('%',#{userMail},'%')
            	LIMIT #{offset},#{size};
            """)
    List<User> searchNotIncludeSchoolId(String userName, String userPhone, String userMail, Long offset, Long size);

    @Select("""
            SELECT
            	count(*)
            FROM
            	`user`
            WHERE
            	deleteTime IS NULL
            	AND userName like CONCAT('%',#{userName},'%')
            	AND userPhone like CONCAT('%',#{userPhone},'%')
            	AND userMail like CONCAT('%',#{userMail},'%');
            """)
    Long searchNotIncludeSchoolIdCount(String userName, String userPhone, String userMail, Long offset, Long size);

    @Update("UPDATE `user` SET deleteTime = NOW() WHERE userId=#{userId};")
    void deleteUser(Long userId);

}