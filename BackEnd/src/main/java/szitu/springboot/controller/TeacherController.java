package szitu.springboot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import szitu.springboot.model.Result;
import szitu.springboot.model.Role;
import szitu.springboot.model.Teacher;
import szitu.springboot.service.imp.TeacherServiceImp;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@CrossOrigin(origins = "*")
@RequestMapping("/teacher")
@RestController
public class TeacherController {
    @Autowired
    private TeacherServiceImp teacherServiceImp;

    @PostMapping("/add")
    public Result<String> add(@RequestBody Teacher teacher, HttpServletRequest request){
        Role role = (Role)request.getAttribute("role");
        if(role.getRole().equals("系统管理员") || role.getRole().equals("委员会") || role.getRole().equals("学校管理员")){
            try {
                teacherServiceImp.insert(teacher);
                return Result.success("新增成功！");
            }catch (Exception err){
                return Result.fail("新增失败！");
            }
        }
        return Result.fail("你不具有相关权限！");
    }

    @PutMapping("/update")
    public Result<String> update(@RequestBody Teacher teacher, HttpServletRequest request){
        if(teacher.getTeacherId() == null){
            return Result.fail("相关字段为空！");
        }
        Role role = (Role)request.getAttribute("role");
        if(role.getRole().equals("系统管理员") || role.getRole().equals("委员会") || role.getRole().equals("学校管理员")){
            try {
                teacherServiceImp.update(teacher);
                return Result.success("更新成功！");
            }catch (Exception err){
                return Result.fail("更新失败！");
            }
        }
        return Result.fail("你不具有相关权限！");
    }

    @DeleteMapping("/delete")
    public Result<String> delete(@RequestBody Teacher teacher, HttpServletRequest request){
        if(teacher.getTeacherId() == null){
            return Result.fail("相关字段为空！");
        }
        Role role = (Role)request.getAttribute("role");
        if(role.getRole().equals("系统管理员") || role.getRole().equals("委员会") || role.getRole().equals("学校管理员")){
            try {
                teacherServiceImp.delete(teacher.getTeacherId());
                return Result.success("删除成功！");
            }catch (Exception err){
                return Result.fail("删除失败！");
            }
        }
        return Result.fail("你不具有相关权限！");
    }

    @PostMapping("/search")
    public Result<List<Teacher>> get(@RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
                                     @RequestParam(value = "size", required = false, defaultValue = "20") Integer size,
                                     @RequestBody Teacher teacher){
        // Integer schoolId, String userName, String userPhone, String userMail, Integer page, Integer size
        Integer sid = null;
        if(teacher.getSchoolId() != null){
            sid = Math.toIntExact(teacher.getSchoolId());
        }
        List<Teacher> search = teacherServiceImp.search(sid, teacher.getUserName(), teacher.getUserPhone(), teacher.getUserMail(), page, size);
        return Result.success(search);
    }

}
