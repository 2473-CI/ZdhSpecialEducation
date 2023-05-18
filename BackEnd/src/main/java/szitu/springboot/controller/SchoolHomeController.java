package szitu.springboot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import szitu.springboot.model.Result;
import szitu.springboot.model.SchoolHome;
import szitu.springboot.model.Special;
import szitu.springboot.service.imp.SchoolHomeServiceImp;

import java.util.List;

@CrossOrigin(origins = "*")
@RequestMapping("/schoolHome")
@RestController
public class SchoolHomeController {

    @Autowired
    private SchoolHomeServiceImp schoolHomeServiceImp;


    @PostMapping("/selectByStudentId")
    public Result<List<SchoolHome>> selectByStudentId(@RequestBody SchoolHome schoolHome){
        if(schoolHome.getStudentId() == null){
            return Result.fail("缺少关键信息");
        }
        try {
            List<SchoolHome> specials = schoolHomeServiceImp.selectByStudentId(schoolHome);
            return Result.success(specials);
        }catch (Exception err){
            return Result.fail("查询失败！");
        }
    }


    @PostMapping("/deleteById")
    public Result<String> deleteById(@RequestBody SchoolHome schoolHome){
        if(schoolHome.getId() == null){
            return Result.fail("缺少关键信息");
        }
        try {
            schoolHomeServiceImp.deleteById(schoolHome);
            return Result.success("删除成功！");
        }catch (Exception err){
            return Result.fail("删除失败！");
        }
    }
    @PostMapping("/insert")
    public Result<String> insert(@RequestBody SchoolHome schoolHome){
        try {
            schoolHomeServiceImp.insert(schoolHome);
            return Result.success("新增成功！");
        }catch (Exception err){
            return Result.fail("新增失败！");
        }
    }

}
