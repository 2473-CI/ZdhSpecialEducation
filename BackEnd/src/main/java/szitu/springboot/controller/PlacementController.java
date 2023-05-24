package szitu.springboot.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import szitu.springboot.model.Placement;
import szitu.springboot.model.Result;
import szitu.springboot.model.Role;
import szitu.springboot.service.PlanService;
import szitu.springboot.service.imp.PlacementServiceImp;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@CrossOrigin(origins = "*")
@RequestMapping("/placement")
@RestController
public class PlacementController {

    @Autowired
    private PlacementServiceImp placementServiceImp;

    @PostMapping("/add")
    public Result<String> insert(@RequestBody Placement placement){
        if(placement.getStudentId() == null || placement.getToId() == null){
            return Result.fail("信息不全！");
        }
        try {
            placementServiceImp.insert(placement);
            return Result.success("插入成功！");
        }catch (Exception err){
            return Result.fail("插入失败！" + err);
        }
    }



    @PostMapping("/end")
    public Result<String> end(@RequestBody Placement placement) {
        if(placement.getId() == null || placement.getPass() == null){
            return Result.fail("信息不全!");
        }
        try {
            placementServiceImp.end(placement);
            return Result.success("审批完成！");
        }catch (Exception err){
            return Result.fail("状态更改失败");
        }
    }

    @PostMapping("/selectBuStudentId")
    public Result<List<Placement>> selectBuStudentId(@RequestBody Placement placement){
        if(placement.getStudentId() == null){
            return Result.fail("信息不全!");
        }
        try {
            List<Placement> placements = placementServiceImp.selectByStudentId(placement);
            return Result.success(placements);
        }catch (Exception err){
            return Result.fail("查询失败！");
        }
    }


    @PostMapping("/selectBySchoolId")
    public Result<List<Placement>> selectBySchoolId(@RequestParam(name = "page", required = false, defaultValue = "1") Integer page,
                                                    @RequestParam(name = "size", required = false, defaultValue = "20") Integer size,
                                                    HttpServletRequest request){
        Role role = (Role)request.getAttribute("role");
        if(role.getSchoolId() == null){
            return Result.fail("信息不全!");
        }
        try {
            List<Placement> placements = placementServiceImp.selectBySchoolId(role.getSchoolId(), (page-1)*size, size
                    );
            return Result.success(placements);
        }catch (Exception err){
            return Result.fail("查询失败！");
        }
    }
}
