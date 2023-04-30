package szitu.springboot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import szitu.springboot.model.Result;
import szitu.springboot.model.Scale;
import szitu.springboot.model.ScaleClassify;
import szitu.springboot.service.imp.ScaleServiceImpl;

import java.util.List;

@CrossOrigin(origins = "*")
@RequestMapping("/scale")
@RestController
public class ScaleController {
    @Autowired
    private ScaleServiceImpl scaleService;

    record ScaleInfo(Long scaleId, Long studentBasicId, String title,  String context, String scoring){};

    @GetMapping("/getAll")
    public Result<List<Scale>> getAll(){
        return Result.success(scaleService.getAll());
    }

    @GetMapping("/getById")
    public Result<Scale> getById(@RequestParam(name = "scaleId", required = true) Long scaleId){
        return Result.success(scaleService.getById(scaleId));
    }

    record ScaleSearchInfo(String classify1, String classify2, String classify3, String title){};
    @PostMapping("/search")
    public Result<List<Scale>> search(@RequestBody ScaleSearchInfo s){
        return Result.success(scaleService.search(s.classify1(), s.classify2(), s.classify3(), s.title()));
    }

    @DeleteMapping("/delete")
    public Result<String> delete(@RequestParam(name = "scaleId", required = true) Long scaleId){
        try {
            scaleService.delete(scaleId);
            return Result.success("删除成功！");
        }catch (Exception err){
            return Result.fail("删除失败！");
        }
    };

    @PostMapping("/add")
    public Result<String> add(@RequestBody ScaleInfo s){
        if(s.studentBasicId() == null || s.context()==null){
            return Result.fail("相关字段不能为空！");
        }
        try {
            scaleService.insert(s.studentBasicId(),s.title(), s.context(), s.scoring);
            return Result.success("新增成功！");
        }catch (Exception err){
            return Result.fail("新增失败！");
        }
    }
}
