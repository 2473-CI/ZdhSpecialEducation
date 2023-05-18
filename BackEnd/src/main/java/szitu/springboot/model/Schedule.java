package szitu.springboot.model;

import lombok.Data;

@Data
public class Schedule {
    private Integer id;
    private Integer studentId;
    private Integer classId;
    private String Schedule;
    private String time;
    private String title;
}
