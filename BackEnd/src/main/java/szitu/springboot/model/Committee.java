package szitu.springboot.model;

import lombok.Data;

import java.util.Date;

@Data
public class Committee {
    private Long id;
    private Long regionId;
    private String provinceName;
    private String cityName;
    private String regionName;
    private String committeeName;
    private String committeeAddress;
    private String committeeResponsible;
    private String committeePhone;
    private Date committeeCreateTime;
    private String introduction;
    private Long subordinateCenter;
}
