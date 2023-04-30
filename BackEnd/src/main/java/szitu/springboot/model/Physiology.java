package szitu.springboot.model;

import lombok.Data;

@Data
public class Physiology {
    private Long studentId;
    private String irritability;
    private String healthProblem;
    private String otherHealthProblem;
    private String pharmacy;
    private String speakAssist;
    private String otherAssist;

}
