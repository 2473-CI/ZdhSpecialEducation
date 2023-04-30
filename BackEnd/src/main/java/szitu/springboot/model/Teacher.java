package szitu.springboot.model;

import lombok.Data;

@Data
public class Teacher {
    private Long teacherId;
    private Long schoolId;
    private String account;
    private String userName;
    private String passWord;
    private String userHead;
    private String userGender;
    private String userPhone;
    private String userMail;
    private String schoolAdmin;
    private String authorization;

    public Teacher(Long schoolId, String account, String userName, String passWord, String userHead, String userGender, String userPhone, String userMail, String schoolAdmin) {
        this.schoolId = schoolId;
        this.account = account;
        this.userName = userName;
        this.passWord = passWord;
        this.userHead = userHead;
        this.userGender = userGender;
        this.userPhone = userPhone;
        this.userMail = userMail;
        this.schoolAdmin = schoolAdmin;
    }
}
