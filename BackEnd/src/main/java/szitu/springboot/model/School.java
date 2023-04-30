package szitu.springboot.model;

import lombok.Data;

import java.util.Date;

@Data
public class School {
    private Long schoolId;
    private String schoolName;
    private String provinceCode;
    private String cityCode;
    private String regionCode;
    private Date createTime;
    private Date updateTime;
    private Date deleteTime;
}
