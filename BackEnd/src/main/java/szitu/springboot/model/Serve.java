package szitu.springboot.model;

import lombok.Data;

@Data
public class Serve {
    private Integer id;
    private Integer studentId;
    private String studentName;
    private String content;
    private String description;
    private String head;
}
