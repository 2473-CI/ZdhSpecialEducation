package szitu.springboot.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import szitu.springboot.model.*;
import szitu.springboot.service.TeacherService;
import szitu.springboot.service.imp.*;
import szitu.springboot.utils.DesEncryption;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;
import java.util.Objects;


@CrossOrigin(origins = "*")
@RequestMapping("/user")
@RestController
public class UserController {

    @Autowired
    private UserServiceImpl userService;

    record LogInfo(String role, String account, String passWord){};

    @Autowired
    private AdminServiceImp adminServiceImp;

    @Autowired
    private BoardServiceImp boardServiceImp;

    @Autowired
    private StudentServiceImp studentServiceImp;

    @Autowired
    private TeacherService teacherService;

    @Autowired
    private CommitteeServiceImpl committeeService;

    /**
     * 登录
     * @param logInfo
     * @return
     * @throws Exception
     */
    @PostMapping("/login")
    public Result<String> login(@RequestBody LogInfo logInfo) throws Exception {
        // 如果 权限 账号 密码有一个为空
        if(logInfo.role() ==null && logInfo.account() == null && logInfo.passWord() == null){
            return Result.fail("登录信息不全！");
        }

        String password = "";
//        System.out.println(logInfo.role());
        Role role = new Role(logInfo.role(), logInfo.account(), null, null);

        try {
            switch (Objects.requireNonNull(logInfo.role())) {
                case "系统管理员" -> {
                    Admin admin = adminServiceImp.getByAccount(logInfo.account());
                    password = admin.getPassWord();
                }
                case "委员会" -> {
                    Board board = boardServiceImp.getByAccount(logInfo.account());
                    password = board.getPassWord();
                    role.setAuthorization(board.getAuthorization());
                    Committee committee = committeeService.getById(board.getCommitteeId());
                    role.setRegionCode(Math.toIntExact(committee.getRegionId()));
                }
                case "学校管理员", "教师" -> {
                    Teacher teacher = teacherService.getByAccount(logInfo.account());
                    if(logInfo.role().equals("学校管理员") && teacher.getSchoolAdmin().equals("否"))break;
                    password = teacher.getPassWord();
                    role.setSchoolId(Math.toIntExact(teacher.getSchoolId()));
                    role.setAuthorization(teacher.getAuthorization());
                }
                case "学生" -> {
                    Student student = studentServiceImp.getByAccount(logInfo.account());
                    password = student.getPassWord();
                    role.setStudentId(Math.toIntExact(student.getStudentId()));
                    System.out.println(role.toString());
                }
                default -> {
                }
                // 处理未知角色的情况
            }
        }catch (Exception err){
            return Result.fail("账号不存在！"+err.getMessage());
        }
        if(password == null){
            return Result.fail("你的密码为空！");
        }
        if(password.equals(logInfo.passWord())){
            ObjectMapper objectMapper = new ObjectMapper();
            String json = objectMapper.writeValueAsString(role);
            // OAB5w5D0vABd/Qt8ZRkw/GB4VYmQX9RGAFjTLRgEOqmZZRUmirn+LaLIVP79TnCoGHD5vmibcM+yDEiqF5nta8zz7wHKRlZE/9mAkXfQLFbMeTC2mTEKZi9OZ3DyYqanfZFIaO8ybFE=
            return Result.success(DesEncryption.encode(json));
        }
        return Result.fail("密码错误！");
    }


    /**
     * 注册
     * @param map
     * @return
     */
    @PostMapping("/register")
    public Result<String> register(@RequestBody Map map){
        if (map.get("role") == null){
            return Result.fail("不存在的角色！");
        }
        Object role = map.get("role");
        if (role.equals("系统管理员") || role.equals("学生")) {
            return Result.success("端口暂不开发！");
        } else if (role.equals("委员会")) {
            Board board = null;
            try {
                board = new Board(
                        ((Integer) map.get("committeeId")).longValue(),
                        (String) map.get("account"),
                        (String) map.get("userName"),
                        (String) map.get("passWord"),
                        (String) map.get("userHead"),
                        (String) map.get("userGender"),
                        (String) map.get("userPhone"),
                        (String) map.get("userMail")
                );
            } catch (Exception err) {
                return Result.fail("相关字段不能为空！");
            }
            boardServiceImp.insert(board);
            return Result.success("注册成功！");
        } else if (role.equals("学校管理员") || role.equals("教师")) {
            Teacher teacher = null;
            try {
                //   String userPhone, String userMail, String schoolAdmin

                teacher = new Teacher(
                        ((Integer) map.get("schoolId")).longValue(),
                        (String) map.get("account"),
                        (String) map.get("userName"),
                        (String) map.get("passWord"),
                        (String) map.get("userHead"),
                        (String) map.get("userGender"),
                        (String) map.get("userPhone"),
                        (String) map.get("userMail"),
                        (String) map.get("schoolAdmin")
                );
            } catch (Exception err) {
                return Result.fail("教师注册，相关字段不能为空！");
            }
            teacherService.insert(teacher);
            return Result.success("注册成功！");
        }

        return Result.success("成功");
    }

    /**
     * 获取相关权限
     * @param request
     * @return
     */
    @GetMapping("/getRole")
    public Result<String> getRole(HttpServletRequest request){
        Role role = (Role)request.getAttribute("role");
        return Result.success(role.getRole()) ;
    }

    /**
     * 获取所有用户
     * @param request
     * @return
     */
    @Deprecated
    @GetMapping("/getAll")
    public Result<List<User>> getAll(HttpServletRequest request){
        Role role = (Role)request.getAttribute("role");
        if(role.getRole().equals("管理员")){
            return Result.success(userService.getAll());
        }else if(role.getRole().equals("委员会")){

            return Result.success(userService.getAll());
        }
        return Result.fail("你没有相关权限");
    }

    @Deprecated
    @PostMapping("/search")
    public Result<List<User>> search(@RequestBody User user,
                                     @RequestParam(name = "page", required = false, defaultValue = "1") Long page,
                                     @RequestParam(name = "size", required = false, defaultValue = "20") Long size){

        if(user.getUserName() == null){user.setUserName("");}
        if(user.getUserPhone() == null){user.setUserPhone("");}
        if(user.getUserMail() == null){user.setUserMail("");}
        List<User> users = userService.search(user.getSchoolId(), user.getUserName(), user.getUserPhone(), user.getUserMail(), (page-1)*size, size);
        Long length = userService.searchCount(user.getSchoolId(), user.getUserName(), user.getUserPhone(), user.getUserMail(), (page - 1) * size, size);
        return Result.searchRes(users, length);
    }

    @Deprecated
    @DeleteMapping("/delete")
    public Result<String> delete(@RequestParam(name = "userId", required = true) Long userId){
        boolean flag = userService.deleteUser(userId);
        if(flag){
            return Result.success("删除成功！");
        }
        return Result.fail("删除失败！");
    }
}