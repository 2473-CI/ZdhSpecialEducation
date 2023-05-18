package szitu.springboot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import szitu.springboot.model.Plan;
import szitu.springboot.model.Result;
import szitu.springboot.model.SchoolHome;
import szitu.springboot.service.imp.PlanServiceImp;

import java.util.List;

@CrossOrigin(origins = "*")
@RequestMapping("/plan")
@RestController
public class PlanController {
    @Autowired
    private PlanServiceImp planServiceImp;


    @PostMapping("/selectByStudentId")
    public Result<List<Plan>> selectByStudentId(@RequestBody Plan plan){
        if(plan.getStudentId() == null){
            return Result.fail("缺少关键信息");
        }
        try {
            List<Plan> specials = planServiceImp.selectByStudentId(plan);
            return Result.success(specials);
        }catch (Exception err){
            return Result.fail("查询失败！");
        }
    }


    @PostMapping("/deleteById")
    public Result<String> deleteById(@RequestBody Plan plan){
        if(plan.getId() == null){
            return Result.fail("缺少关键信息");
        }
        try {
            planServiceImp.deleteById(plan);
            return Result.success("删除成功！");
        }catch (Exception err){
            return Result.fail("删除失败！");
        }
    }
    @PostMapping("/insert")
    public Result<String> insert(@RequestBody Plan plan){
        try {
            planServiceImp.insert(plan);
            return Result.success("新增成功！");
        }catch (Exception err){
            return Result.fail("新增失败！");
        }
    }
}
