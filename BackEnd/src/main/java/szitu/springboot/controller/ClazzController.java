package szitu.springboot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import szitu.springboot.model.Clazz;
import szitu.springboot.model.Result;
import szitu.springboot.service.imp.ClazzServiceImp;

import java.util.List;

@CrossOrigin(origins = "*")
@RequestMapping("/clazz")
@RestController
public class ClazzController {
    @Autowired
    private ClazzServiceImp clazzServiceImp;

    @GetMapping("/getAll")
    public Result<List<Clazz>> getAll(){
        List<Clazz> all = clazzServiceImp.getAll();
        return Result.success(all);
    }

    record ClazzSearchInfo(Long clazzId, Long schoolId, Long gradeId, String clazzName, String description){};

    @PostMapping("/search")
    public Result<List<Clazz>> search(@RequestBody ClazzSearchInfo csi,
                                     @RequestParam(name = "page", required = false, defaultValue = "1") Long page,
                                     @RequestParam(name = "size", required = false, defaultValue = "20") Long size){
        try {
            List<Clazz> clazzes = clazzServiceImp.searchBySchool(csi.schoolId, csi.gradeId, csi.clazzName, (page - 1) * size, size);
            Long length = clazzServiceImp.searchBySchoolCount(csi.schoolId, csi.gradeId, csi.clazzName);
            return Result.searchRes(clazzes, length);
        }catch (Exception err){
            return Result.fail(err.getMessage());
        }
    }


    @DeleteMapping("/delete")
    public Result<String> delete(@RequestParam(name = "clazzId", required = true) Long clazzId){
        boolean flag = clazzServiceImp.deleteClazz(clazzId);
        if(flag){
            return Result.success("删除成功！");
        }
        return Result.fail("删除失败！");
    }

    @PutMapping("/update")
    public Result<String> update(@RequestBody ClazzSearchInfo csi){
        if(csi.clazzId() == null){
            return Result.fail("班级Id不能为空！");
        }
        if(csi.gradeId() == null){
            return Result.fail("年级Id不能为空！");
        }
        try {
            clazzServiceImp.updateClazz(csi.clazzId(), csi.gradeId(), csi.clazzName(), csi.description());
            return Result.success("更新成功！");
        }catch (Exception err){
            return Result.fail("更新失败");
        }
    }

    @PostMapping("/add")
    public Result<String> add(@RequestBody ClazzSearchInfo csi){
        if (csi.schoolId()==null || csi.gradeId() == null){
            return Result.fail("新增失败！学校或班级为空！");
        }

        try {
            clazzServiceImp.add(csi.schoolId(), csi.gradeId(), csi.clazzName(), csi.description());
            return Result.success("新增成功！");
        }catch (Exception err){
            return Result.fail("新增失败！"+err.getMessage());
        }
    }
}
