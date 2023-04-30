package szitu.springboot.model;


import lombok.Data;

@Data
public class GrowUp {
    /**
     *  *   `id` int unsigned NOT NULL AUTO_INCREMENT,
     *  *   `studentId` int DEFAULT NULL COMMENT '学生ID',
     *  *   `trimesterWeight` double DEFAULT '0' COMMENT '妊娠初期体重',
     *  *   `isTakeMedicine` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '是否服用药物',
     *  *   `isSmokeOrDrink` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '是否抽烟酗酒',
     */
    private Long studentId;
    private Double trimesterWeight;
    private String isTakeMedicine;
    private String isSmokeOrDrink;
    /**
     *  *   `emotionalCharacteristics` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '情绪特征',
     *  *   `physiologicalReaction` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '异常生理反应',
     *  *   `sleepQuality` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '睡眠质量',
     *  *   `isTimeDifference` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '是否倒时差',
     *  *   `industrialChemicalFactor` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '工业化学因素',
     */
    private String emotionalCharacteristics;
    private String physiologicalReaction;
    private String sleepQuality;
    private String isTimeDifference;
    private String industrialChemicalFactor;

    /**
     *  *   `physicalFactor` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '物理因素',
     *  *   `biologicalFactor` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '生物因素',
     *  *   `nutritionalFactor` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '营养因素',
     *  *   `badHabit` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '不良习惯',
     *  *   `predelivery` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '分娩前',
     *  *
     */
    private String physicalFactor;
    private String biologicalFactor;
    private String nutritionalFactor;
    private String badHabit;
    private String predelivery;

    /**
     *  *   `atChildbirth` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '分娩后',
     *  *   `weight` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '体重',
     *  *   `length` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '体长',
     *  *   `headCircumference` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '头围',
     *  *   `suffocation` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '窒息',
     */
    private String atChildbirth;
    private String weight;
    private String length;
    private String headCircumference;
    private String suffocation;
    /**
     *  *   `feedingPattern` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '主要喂养方式',
     *  *   `firstWordAppears` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '首个词汇出现时间',
     *  *   `firstSentence` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '首个句子出现时间',
     *  *   `headUpTime` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '抬头时间',
     *  *   `independentSittingTime` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '独立坐时间',
     */

    private String feedingPattern;
    private String firstWordAppears;
    private String firstSentence;
    private String headUpTime;
    private String independentSittingTime;
    /**
     *  *   `independentStationTime` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '独立站时间',
     *  *   `independentTravelTime` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '独立走时间',
     *  *   `urinationTime` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '表达小便时间',
     *  *   `stoolTime` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '表达小便时间',
     *  *   `independentUrinationTime` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '独立小便时间',
     */

    private String independentStationTime;
    private String independentTravelTime;
    private String urinationTime;
    private String stoolTime;
    private String independentUrinationTime;

    /**
     *  *   `independentStoolTime` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '独立大便时间',
     *  *   `geneticHistory` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '遗传病史',
     *  *   `majorDiseases` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '重大疾病史',
     */
    private String independentStoolTime;
    private String geneticHistory;
    private String majorDiseases;
}
