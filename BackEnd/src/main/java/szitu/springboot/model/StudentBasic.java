package szitu.springboot.model;

import lombok.Data;

import java.util.Date;

@Data
public class StudentBasic {
    private Long basicId;
    private Long studentId;
//    private String studentName; // 姓名
    private String nickname; // 昵称
//    private String studentGender; // 性别
    private Date birthday; // 出生日期
//    private String obstacleName; // 障碍类型
    private String obstacleDegree; // 障碍程度
    private String otherObstacleName; // 其他障碍类型
    private String otherObstacleId; // 其他障碍类型
    private String cardId; // 身份证号
    private String obstacleCardId; // 残疾证号
//    private String clazzName;  // 班级名称
    private String nation; // 名族
    private String bloodGroup; // 血型
    private String nationality; // 国籍
    private String studentStatus; // 学籍状态
    private String studentNo; // 学籍号
    private String religiousBelief; // 宗教信仰
    private String registeredResidence; // 户籍地
    private String birthplace; // 身长地
}
