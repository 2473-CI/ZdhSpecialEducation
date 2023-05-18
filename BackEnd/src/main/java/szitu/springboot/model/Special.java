package szitu.springboot.model;

import lombok.Data;

@Data
public class Special {
    private Integer id;
    private Integer studentId;
    private String studentName;
    private String startYear;
    private String lastYear;
    private String semester;
    private String teacherName;
    private String basicArea;
    private String gbArea;
    private String targetArea;
    private String psychologyArea;
    private String advantageArea;
    private String defectArea;
}
