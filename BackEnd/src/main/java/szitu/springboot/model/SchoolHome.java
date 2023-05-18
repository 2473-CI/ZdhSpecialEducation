package szitu.springboot.model;

import lombok.Data;

@Data
public class SchoolHome {
    private Integer id;
    private Integer studentId;
    private String studentName;
    private String startYear;
    private String lastYear;
    private String semester;
    private String teacherName;
    private String situation;
    private String assist;
    private String feedback;
}
