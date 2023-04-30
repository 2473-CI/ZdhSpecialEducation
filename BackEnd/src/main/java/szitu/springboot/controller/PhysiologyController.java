package szitu.springboot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import szitu.springboot.model.Physiology;
import szitu.springboot.model.Result;
import szitu.springboot.service.imp.PhysiologyServiceImp;

@CrossOrigin(origins = "*")
@RequestMapping("/physiology")
@RestController
public class PhysiologyController {
    @Autowired
    private PhysiologyServiceImp physiologyServiceImp;

    @GetMapping("/get")
    public Result<Physiology> get(@RequestParam(name = "studentId", required = true) Long studentId){
        return Result.success(physiologyServiceImp.get(studentId));
    }


    @PostMapping("/update")
    public Result<String> get(@RequestBody Physiology physiology){
        if(physiology.getStudentId() == null){
            return Result.fail("学生Id不能为空！");
        }
        try {
            physiologyServiceImp.update(physiology);
            return Result.success("更新成功！");
        }catch (Exception err){
            return Result.fail("更新失败！");
        }
    }
}
