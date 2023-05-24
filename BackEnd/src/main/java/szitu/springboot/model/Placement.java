package szitu.springboot.model;

import lombok.Data;

@Data
public class Placement {
    private Integer id;
    private Integer studentId;
    private String studentName;
    private Integer schoolId;
    private String schoolName;
    private String from;
    private String to;
    private Integer toId;
    private String pass;
    private String createTime;
    private String other;
}
