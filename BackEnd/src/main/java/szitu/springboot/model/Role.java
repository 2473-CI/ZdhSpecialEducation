package szitu.springboot.model;

import lombok.Data;

import java.util.Date;

// 管理员 admin
// 委员会 board
// 老师 teacher
// 学生 student

@Data
public class Role {
    private String role; // 角色
    private String account; // 账号
    private Integer regionCode; // 地区Id
    private Integer schoolId; // 学校id
    private Integer studentId;
    private Date date;
    private String authorization;
//    private boolean is;
    public Role() {

    }
    public Role(String role, String account, Integer regionCode, Integer schoolId) {
        this.role = role;
        this.account = account;
        this.regionCode = regionCode;
        this.schoolId = schoolId;
        this.date = new Date();
    }
}
