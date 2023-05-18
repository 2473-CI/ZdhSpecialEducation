package szitu.springboot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import szitu.springboot.model.Result;
import szitu.springboot.model.Schedule;
import szitu.springboot.model.Special;
import szitu.springboot.service.imp.SpecialServiceImp;

import java.util.List;

@CrossOrigin(origins = "*")
@RequestMapping("/special")
@RestController
public class SpecialController {
    @Autowired
    private SpecialServiceImp specialServiceImp;

    @PostMapping("/selectByStudentId")
    public Result<List<Special>> selectByStudentId(@RequestBody Special special){
        if(special.getStudentId() == null){
            return Result.fail("缺少关键信息");
        }
        try {
            List<Special> specials = specialServiceImp.selectByStudentId(special);
            return Result.success(specials);
        }catch (Exception err){
            return Result.fail("查询失败！");
        }
    }
    @PostMapping("/deleteById")
    public Result<String> deleteById(@RequestBody Special special){
        if(special.getId() == null){
            return Result.fail("缺少关键信息");
        }
        try {
            specialServiceImp.deleteById(special);
            return Result.success("删除成功！");
        }catch (Exception err){
            return Result.fail("删除失败！");
        }
    }

    @PostMapping("/insert")
    public Result<String> insert(@RequestBody Special special){
        try {
            specialServiceImp.insert(special);
            return Result.success("新增成功！");
        }catch (Exception err){
            return Result.fail("新增失败！");
        }
    }


}
