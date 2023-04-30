package szitu.springboot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import szitu.springboot.model.Result;
import szitu.springboot.model.StudentDevelopment;
import szitu.springboot.service.imp.StudentDevelopmentServiceImp;

import java.util.List;

@CrossOrigin(origins = "*")
@RequestMapping("/studentDevelopment")
@RestController
public class StudentDevelopmentController {
    @Autowired
    private StudentDevelopmentServiceImp serviceImp;

    @GetMapping("/getAll")
    public Result<List<StudentDevelopment>> getAll(@RequestParam("studentId") Long studentId){
        return Result.success(serviceImp.selectByStudentId(studentId));
    }

    @PostMapping("/add")
    public Result<String> getAll(@RequestBody StudentDevelopment studentDevelopment){
        try {
            System.out.println(studentDevelopment.getStudentId());
            serviceImp.insert(studentDevelopment);
            return Result.success("新增成功！");
        }catch (Exception err){
            return Result.fail("新增失败！"+err.getMessage());
        }
    }
}
