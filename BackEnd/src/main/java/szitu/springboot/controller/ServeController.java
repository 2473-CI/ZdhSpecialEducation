package szitu.springboot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import szitu.springboot.model.Result;
import szitu.springboot.model.Serve;
import szitu.springboot.service.ServeService;
import szitu.springboot.service.imp.ServeServiceImp;

import java.util.List;

@CrossOrigin(origins = "*")
@RequestMapping("/serve")
@RestController
public class ServeController {
    @Autowired
    private ServeServiceImp serveServiceImp;

    @PostMapping("/add")
    public Result<String> insert(@RequestBody Serve serve){
        if (serve.getStudentId() == null){
            return Result.fail("缺少关键信息！");
        }
        try {
            serveServiceImp.insert(serve);
            return Result.success("新增成功！");
        }catch (Exception err){
            return Result.fail("新增失败！");
        }
    }


    @PostMapping("/delete")
    public Result<String> delete(@RequestBody Serve serve){
        if (serve.getId() == null){
            return Result.fail("缺少关键信息！");
        }
        try {
            serveServiceImp.delete(serve);
            return Result.success("删除成功！");
        }catch (Exception err){
            return Result.fail("删除失败！");
        }
    }


    @PostMapping("/selectByStudentId")
    public Result<List<Serve>> selectByStudentId(@RequestBody Serve serve){
        if (serve.getStudentId() == null){
            return Result.fail("缺少关键信息！");
        }
        try {
            List<Serve> serves = serveServiceImp.selectByStudentId(serve);
            return Result.success(serves);
        }catch (Exception err){
            return Result.fail("查询失败！");
        }
    }
}
