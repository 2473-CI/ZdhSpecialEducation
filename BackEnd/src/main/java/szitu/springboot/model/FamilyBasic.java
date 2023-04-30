package szitu.springboot.model;

import lombok.Data;

@Data
public class FamilyBasic {
    private Long familyId;
    private Long studentId;
    private String numberOfFamily;
    private String homeAddress;
    private String annualIncome;
    private String languageEnvironment;
    private String parentingStyle;
    private String familyResourceAdvantages;
    private String familyResourceAdvantagesMess;
    private String livingResources;
    private String otherLivingResources;
    private String leisureResources;
    private String otherLeisureResources;
    private String employmentResources;
    private String otherEmploymentResources;
}
