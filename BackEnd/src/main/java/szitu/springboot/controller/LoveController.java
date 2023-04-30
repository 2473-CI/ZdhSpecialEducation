package szitu.springboot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import szitu.springboot.model.Love;
import szitu.springboot.model.Result;
import szitu.springboot.service.imp.LoveServiceImp;

@CrossOrigin(origins = "*")
@RequestMapping("/love")
@RestController
public class LoveController {

    @Autowired
    private LoveServiceImp loveServiceImp;

    @GetMapping("/get")
    public Result<Love> get(@RequestParam(name = "studentId", required = true) Long studentId){
        return Result.success(loveServiceImp.get(studentId));
    }

    @PostMapping("/update")
    public Result<String> get(@RequestBody Love love){
        if(love.getStudentId() == null){
            return Result.fail("学生Id不能为空！");
        }
        try {
            loveServiceImp.update(love);
            return Result.success("更新成功！");
        }catch (Exception err){
            return Result.fail("更新失败！");
        }
    }
}
