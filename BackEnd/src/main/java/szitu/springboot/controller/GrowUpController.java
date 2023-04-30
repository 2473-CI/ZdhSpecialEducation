package szitu.springboot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import szitu.springboot.model.GrowUp;
import szitu.springboot.model.Result;
import szitu.springboot.service.imp.GrowUpServiceImp;

@CrossOrigin(origins = "*")
@RequestMapping("/growUp")
@RestController
public class GrowUpController {
    @Autowired
    private GrowUpServiceImp growUpServiceImp;

    @GetMapping("/get")
    public Result<GrowUp> get(@RequestParam(name = "studentId", required = true) Long studentId){
        return Result.success(growUpServiceImp.get(studentId));
    }

    @PostMapping("/update")
    public Result<String> get(@RequestBody GrowUp growUp){
        if(growUp.getStudentId() == null){
            return Result.fail("学生Id不能为空！");
        }
        try {
            growUpServiceImp.update(growUp);
            return Result.success("更新成功！");
        }catch (Exception err){
            return Result.fail("更新失败！");
        }
    }
}
