package szitu.springboot.model;

import lombok.Data;

@Data
public class Board {
    private Long boardId;
    private Long committeeId;
    private String account;
    private String userName;
    private String passWord;
    private String userHead;
    private String userGender;
    private String userPhone;
    private String userMail;
    private String authorization;

    public Board(Long committeeId, String account, String userName, String passWord, String userHead, String userGender, String userPhone, String userMail) {
        this.committeeId = committeeId;
        this.account = account;
        this.userName = userName;
        this.passWord = passWord;
        this.userHead = userHead;
        this.userGender = userGender;
        this.userPhone = userPhone;
        this.userMail = userMail;
    }
}
