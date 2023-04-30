package szitu.springboot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import szitu.springboot.model.Result;
import szitu.springboot.model.Role;
import szitu.springboot.model.Student;
import szitu.springboot.service.imp.*;

import javax.servlet.http.HttpServletRequest;
import java.sql.Struct;
import java.util.List;

@CrossOrigin(origins = "*")
@RequestMapping("/student")
@RestController
public class StudentController {
    @Autowired
    private StudentServiceImp studentServiceImp;

    @GetMapping("/getAll")
    public Result<List<Student>> getAll(HttpServletRequest request){
        Role role = (Role)request.getAttribute("role");
        if(role.getRole().equals("系统管理员")){
            return Result.success(studentServiceImp.getAll());
        }
        return Result.fail("你没有相关权限！");
    }

    record StudentInfo(Long schoolId, Long studentId, Long clazzId, String studentName, String studentHead, String studentGender, Long obstacleId, Long arrangeId){
    }

    @PutMapping("/update")
    public Result<String> update(@RequestBody StudentInfo s, HttpServletRequest request){
        if(s.studentId() == null){
            return Result.fail("学生ID不能为空！");
        }
        Role role = (Role)request.getAttribute("role");
        try {
            studentServiceImp.update(s.studentId(), s.clazzId(), s.studentName(), s.studentHead(), s.studentGender(), s.obstacleId(), s.arrangeId());
            return Result.success("更新成功！");
        }catch (Exception err){
            return Result.fail("更新失败！"+err.getMessage());
        }
    }


    @PostMapping("/search")
    public Result<List<Student>> search(@RequestBody StudentInfo studentInfo,
                                     @RequestParam(name = "page", required = false, defaultValue = "1") Long page,
                                     @RequestParam(name = "size", required = false, defaultValue = "20") Long size){
        try {
            List<Student> search = studentServiceImp.search(studentInfo.schoolId(), studentInfo.clazzId(), studentInfo.studentName(), studentInfo.studentGender(),
                    studentInfo.obstacleId, studentInfo.arrangeId(), (page - 1) * size, size);
            Long length = studentServiceImp.searchCount(studentInfo.schoolId(), studentInfo.clazzId(), studentInfo.studentName(), studentInfo.studentGender(),
                    studentInfo.obstacleId, studentInfo.arrangeId());
            return Result.searchRes(search, length);
        }catch (Exception err){
            return Result.fail(err.getMessage());
        }
    }

    @DeleteMapping("/delete")
    public Result<String> delete(@RequestParam(name = "studentId", required = true) Long studentId){
        boolean flag = studentServiceImp.deleteStudent(studentId);
        if(flag){
            return Result.success("删除成功！");
        }
        return Result.fail("删除失败！");
    }

    @Autowired
    private LoveServiceImp loveServiceImp;
    @Autowired
    private PhysiologyServiceImp physiologyServiceImp;

    @Autowired
    private FamilyBasicServiceImp familyBasicServiceImp;

    @Autowired
    private StudentBasicServiceImp studentBasicServiceImp;

    @Autowired
    private GrowUpServiceImp growUpServiceImp;

    @PostMapping("/add")
    public Result<String> add(@RequestBody StudentInfo studentInfo){
        List<Student> stus = studentServiceImp.search(studentInfo.schoolId, studentInfo.clazzId(), studentInfo.studentName(), studentInfo.studentGender(), studentInfo.obstacleId(), studentInfo.arrangeId(), 0L, 10L);
        if(stus.size() != 0){
            return Result.fail("已存在相同学生");
        }

        try {
            studentServiceImp.add(studentInfo.schoolId(), studentInfo.clazzId(), studentInfo.studentName(), studentInfo.studentHead(),
                    studentInfo.studentGender(), studentInfo.obstacleId(), studentInfo.arrangeId());
            stus = studentServiceImp.search(studentInfo.schoolId, studentInfo.clazzId(), studentInfo.studentName(), studentInfo.studentGender(), studentInfo.obstacleId(), studentInfo.arrangeId(), 0L, 10L);
            Student student = stus.get(0);
            loveServiceImp.init(student.getStudentId());
            physiologyServiceImp.init(student.getStudentId());
            studentBasicServiceImp.init(student.getStudentId(), null);
            familyBasicServiceImp.init(student.getStudentId());
            growUpServiceImp.init(student.getStudentId());
            return Result.success("新增成功！");
        }catch (Exception err){
            return Result.fail("新增失败！"+err.getMessage());
        }
    }

    @GetMapping("/getStudent")
    public Result<Student> getStudent(HttpServletRequest request){
        Role role = (Role)request.getAttribute("role");
        Integer studentId = role.getStudentId();
        Student student = studentServiceImp.getById(Long.valueOf(studentId));
        return Result.success(student);
    }
}
