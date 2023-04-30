package szitu.springboot.model;

import lombok.Data;

@Data
public class Scale {
    private Long scaleId;
    private String classify1;
    private String classify2;
    private String classify3;
    private String title;
    private String context;
    private String scoring;
}
