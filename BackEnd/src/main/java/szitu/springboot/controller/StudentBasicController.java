package szitu.springboot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import szitu.springboot.model.Result;
import szitu.springboot.model.Student;
import szitu.springboot.model.StudentBasic;
import szitu.springboot.service.imp.StudentBasicServiceImp;
import szitu.springboot.service.imp.StudentServiceImp;

import java.util.HashMap;
import java.util.Map;

@CrossOrigin(origins = "*")
@RequestMapping("/studentBasic")
@RestController
public class StudentBasicController {
    @Autowired
    private StudentServiceImp studentServiceImp;

    @Autowired
    private StudentBasicServiceImp studentBasicServiceImp;

    @GetMapping("/get")
    public Result<Map<String, Object>> get(@RequestParam(name = "studentId", required = true) Long studentId){
        Student stu = studentServiceImp.getByStudentId(studentId);
        StudentBasic stuBasic = studentBasicServiceImp.getByStudentId(studentId);
        Map<String, Object> map = new HashMap<>();
        map.put("student", stu);
        map.put("studentBasic", stuBasic);
        return Result.success(map);
    }



    @PutMapping("/update")
    public Result<String> get(@RequestBody StudentBasic studentBasic){
        if(studentBasic.getStudentId() == null){
            return Result.fail("学生Id不能为空！");
        }
        try {
            studentBasicServiceImp.update(studentBasic);
            return Result.success("更新成功！");
        }catch (Exception err){
            return Result.fail("更新失败！"+err.getMessage());
        }
    }

}
