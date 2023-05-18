package szitu.springboot.model;

import lombok.Data;

@Data
public class Reflect {
    private Integer id;
    private Integer studentId;
    private String studentName;
    private String startYear;
    private String lastYear;
    private String semester;
    private String teacherName;
    private String success;
    private String problem;
    private String improve;
}
