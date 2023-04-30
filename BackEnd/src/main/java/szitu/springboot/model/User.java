package szitu.springboot.model;

import lombok.Data;

import java.util.Date;

@Data
public class User {
    private Long userId;
    private Long schoolId;
    private String userAccount;
    private String userName;
    private String passWord;
    private String userRole;
    private String userHead;
    private String userGender;
    private String userPhone;
    private String userMail;
    private Date loginTime;
    private Long userExperience;
    private Date createTime;
    private Date updateTime;
    private Date deleteTime;
}