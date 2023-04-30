package szitu.springboot.service.imp;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import szitu.springboot.mapper.UserMapper;
import szitu.springboot.model.User;
import szitu.springboot.service.UserService;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public User login(String userAccount, String passWord) {
        User user = userMapper.selectByAccount(userAccount);
        if (user != null && passWord.equals(user.getPassWord())) {
            return user;
        }
        return null;
    }

    @Override
    public Boolean register(Long schoolId, String userAccount, String userName, String passWord, String userRole,
                            String userHead, String userGender, String userPhone, String userMail) {
        // 账号 用户名 密码不能为空
        if (userAccount == null || userName == null || passWord == null) {
            return false;
        }
        // 账号长度1-12 密码长度 6-18
        if (userAccount.length() < 1 || userAccount.length() > 12 || passWord.length() < 6 || passWord.length() > 18) {
            return false;
        }
        // 账号不能已存在
        User user = userMapper.selectByAccount(userAccount);
        if (user != null) {
            return false;
        }
        try {
            userMapper.InsertUser(schoolId, userAccount, userName, passWord, userRole, userHead, userGender, userPhone, userMail);
            return true;
        } catch (Exception err) {
            return false;
        }
    }

    @Override
    public List<User> getAll() {
        return userMapper.getAll();
    }

    @Override
    public List<User> search(Long schoolId, String userName, String userPhone, String userMail, Long offset, Long size) {
        if (schoolId != null) {
            return userMapper.searchIncludeSchoolId(schoolId, userName, userPhone, userMail, offset, size);
        }
        return userMapper.searchNotIncludeSchoolId(userName, userPhone, userMail, offset, size);
    }

    @Override
    public Long searchCount(Long schoolId, String userName, String userPhone, String userMail, Long offset, Long size) {
        if (schoolId != null) {
            return userMapper.searchIncludeSchoolIdCount(schoolId, userName, userPhone, userMail, offset, size);
        }
        return userMapper.searchNotIncludeSchoolIdCount(userName, userPhone, userMail, offset, size);
    }

    @Override
    public boolean deleteUser(Long userId) {
        try {
            userMapper.deleteUser(userId);
            return true;
        }catch (Exception err){
            return false;
        }

    }

}