package szitu.springboot.model;

import lombok.Data;

import java.util.Date;

@Data
public class Exercise {
    private Long id;
    private Long studentId;
    private String title;
    private String subTitle;
    private String context;
    private String annex;
    private Date startTime;
    private Date endTime;
}
