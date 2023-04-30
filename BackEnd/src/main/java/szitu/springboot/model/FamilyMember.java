package szitu.springboot.model;

import lombok.Data;

@Data
public class FamilyMember {

/**
 *   `id` int unsigned NOT NULL AUTO_INCREMENT,
 *   `studentId` int DEFAULT NULL COMMENT '学生Id',
 *   `familyName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '姓名',
 *   `familyRelation` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '关系',
 *   `birthDay` datetime DEFAULT NULL COMMENT '出生日期',
 *   `educationLevel` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '受教育程度',
 *   `occupation` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '职业',
 *   `phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '电话',
 *   `life` varchar(10) DEFAULT NULL COMMENT '是否共同生活',
 *   `care` varchar(10) DEFAULT NULL COMMENT '是否主要照料',
 *   `careTime` varchar(50) DEFAULT NULL COMMENT '共同生活时长',
 *   `createTime` datetime DEFAULT NULL COMMENT '创建时间',
 *   `updateTime` datetime DEFAULT NULL COMMENT '更新时间',
 *   `deleteTime` datetime DEFAULT NULL COMMENT '删除时间',
 */
    private Long studentId;
    private String a;
}
