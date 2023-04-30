package szitu.springboot.service;

import szitu.springboot.model.User;

import java.util.List;

public interface UserService {
    public User login(String userAccount, String passWord);

    public Boolean register(Long schoolId, String userAccount, String userName, String passWord,
                            String userRole, String userHead, String userGender, String userPhone,
                            String userMail);

    public List<User> getAll();

    public List<User> search(Long schoolId, String userName, String userPhone, String userMail, Long offset, Long size);
    public Long searchCount(Long schoolId, String userName, String userPhone, String userMail, Long offset, Long size);

    public boolean deleteUser(Long userId);
}
