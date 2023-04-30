package szitu.springboot.model;

import lombok.Data;

import java.util.Date;

@Data
public class Answer {
    private Long answerId; // 答题id
    private Long scaleId; // 题目Id
    private Long studentId; // 学生id
    private String title;  // 标题
    private String context; // 内容
    private Date answerTime; // 答题时间
    private String degree; // 完成度
    private String evaluation1; // 评价1
    private String evaluation2; // 评价2
}
