package szitu.springboot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import szitu.springboot.model.FamilyBasic;
import szitu.springboot.model.Result;
import szitu.springboot.service.imp.FamilyBasicServiceImp;

@CrossOrigin(origins = "*")
@RequestMapping("/familyBasic")
@RestController
public class FamilyBasicController {
    @Autowired
    private FamilyBasicServiceImp familyBasicServiceImp;

    @GetMapping("/get")
    public Result<FamilyBasic> get(@RequestParam(name = "studentId", required = true) Long studentId){
        return Result.success(familyBasicServiceImp.get(studentId));
    }

    @PostMapping("/update")
    public Result<String> get(@RequestBody FamilyBasic familyBasic){
        if(familyBasic.getStudentId() == null){
            return Result.fail("学生Id不能为空！");
        }
        try {
            familyBasicServiceImp.update(familyBasic);
            return Result.success("更新成功！");
        }catch (Exception err){
            return Result.fail("更新失败！"+err.getMessage());
        }
    }
}
