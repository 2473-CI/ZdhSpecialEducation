package szitu.springboot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import szitu.springboot.model.Reflect;
import szitu.springboot.model.Result;
import szitu.springboot.model.Schedule;
import szitu.springboot.service.imp.ReflectServiceImp;

import java.util.List;

@CrossOrigin(origins = "*")
@RequestMapping("/reflect")
@RestController
public class ReflectController {

    @Autowired
    private ReflectServiceImp reflectServiceImp;

    @PostMapping("/selectByStudentId")
    public Result<List<Reflect>> selectByStudentId(@RequestBody Reflect reflect) {

        if (reflect.getStudentId() == null) {
            return Result.fail("缺少关键信息！");
        }
        try {
            List<Reflect> reflects = reflectServiceImp.selectByStudentId(reflect);
            return Result.success(reflects);
        } catch (Exception err) {
            return Result.fail("查询失败！");
        }
    }

    @PostMapping("/deleteById")
    public Result<String> deleteById(@RequestBody Reflect reflect) {

        if (reflect.getId() == null) {
            return Result.fail("缺少关键信息！");
        }
        try {
            reflectServiceImp.deleteById(reflect);
            return Result.success("删除成功！");
        } catch (Exception err) {
            return Result.fail("删除失败！");
        }
    }


    @PostMapping("/insert")
    public Result<String> insert(@RequestBody Reflect reflect) {
        try {
            reflectServiceImp.insert(reflect);
            return Result.success("创建成功！");
        } catch (Exception err) {
            return Result.fail("创建失败！");
        }
    }

}