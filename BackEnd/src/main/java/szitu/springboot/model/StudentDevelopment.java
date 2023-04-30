package szitu.springboot.model;

import lombok.Data;

import java.util.Date;

@Data
public class StudentDevelopment {
    private Long id;
    private Long studentId;
    private String richText;
    private Date createTime;

}
