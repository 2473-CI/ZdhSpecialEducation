package szitu.springboot.model;

import lombok.Data;

import java.util.Date;

@Data
public class Transfer {
    private Integer id;
    private Integer studentId;
    private String studentName;
    private Integer fromSchoolId;
    private String fromSchollName;
    private String fromRegionCode;
    private Integer toSchoolId;
    private String toSchoolName;
    private String toRegionCode;
    private Date startTime;
    private Date schoolTime;
    private Date centerTime;
    private Date boardTime;
    private Date endTime;
    private String status;
    private String other;
}
