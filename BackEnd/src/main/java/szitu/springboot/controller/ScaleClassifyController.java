package szitu.springboot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import szitu.springboot.model.Result;
import szitu.springboot.model.ScaleClassify;
import szitu.springboot.service.imp.ScaleClassifyServiceImp;

import java.util.List;

@CrossOrigin(origins = "*")
@RequestMapping("/scaleClassify")
@RestController
public class ScaleClassifyController {
    @Autowired
    private ScaleClassifyServiceImp scaleClassifyServiceImp;

    @GetMapping("/getAll")
    public Result<List<ScaleClassify>> getAll(){
        return Result.success(scaleClassifyServiceImp.getAll());
    }
    record ScaleClassifyInfo(String classify1, String classify2, String classify3){};
    @PostMapping("/search")
    public Result<List<ScaleClassify>> search(@RequestBody ScaleClassifyInfo s){
        if(s.classify1() == null && s.classify2()==null&&s.classify3()==null){
            return Result.success(scaleClassifyServiceImp.getAll());
        }
        List<ScaleClassify> search = scaleClassifyServiceImp.search(s.classify1(), s.classify2(), s.classify3());
        return Result.success(search);
    }

    @PutMapping("/add")
    public Result<String> add(@RequestBody ScaleClassifyInfo s){
        if(s.classify1() == null || s.classify2()==null || s.classify3()==null){
            return Result.fail("相关字段不能为空！");
        }
        try {
            scaleClassifyServiceImp.add(s.classify1(), s.classify2(), s.classify3());
            return Result.success("新增成功！");
        }catch (Exception err){
            return Result.fail("新增失败！");
        }
    }

    @DeleteMapping("/delete")
    public Result<String> delete(@RequestParam(name = "id") Long id){
        try {
            scaleClassifyServiceImp.delete(id);
            return Result.success("删除成功！");
        }catch (Exception err){
            return Result.fail("删除失败！");
        }
    }

}
