package szitu.springboot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import szitu.springboot.model.Committee;
import szitu.springboot.model.Result;
import szitu.springboot.model.Role;
import szitu.springboot.service.imp.CommitteeServiceImpl;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@CrossOrigin(origins = "*")
@RequestMapping("/committee")
@RestController
public class CommitteeController {
    @Autowired
    private CommitteeServiceImpl committeeService;

    @PostMapping("/add")
    public Result<String> create(@RequestBody Committee committee, HttpServletRequest request){
        Role role = (Role)request.getAttribute("role");
        if(role.getRole().equals("系统管理员")){
            try {
                committeeService.create(committee);
                return Result.success("新增成功！");
            }catch (Exception err){
                return Result.fail("新增失败！");
            }
        }
        return Result.fail("你没有相关权限！");
    }

    @PutMapping("/update")
    public Result<String> update(@RequestBody Committee committee, HttpServletRequest request){
        if (committee.getRegionId() == null){
            return Result.fail("核心字段不能为空！");
        }
        Role role = (Role)request.getAttribute("role");
        if(role.getRole().equals("系统管理员") || (role.getRole().equals("委员会") && role.getRegionCode().equals(committee.getRegionId().intValue()))){
            try {
                committeeService.update(committee);
                return Result.success("修改成功！");
            }catch (Exception err){
                return Result.fail("修改失败！");
            }
        }
        return Result.fail("你没有相关权限！");
    }

    @DeleteMapping("/delete")
    public Result<String> delete(@RequestBody Committee committee, HttpServletRequest request){
        if (committee.getRegionId() == null){
            return Result.fail("核心字段不能为空！");
        }
        Role role = (Role)request.getAttribute("role");
        if(role.getRole().equals("系统管理员") || (role.getRole().equals("委员会") && role.getRegionCode().equals(committee.getRegionId().intValue()))){
            try {
                committeeService.delete(committee.getRegionId());
                return Result.success("删除成功！");
            }catch (Exception err){
                return Result.fail("删除失败！");
            }
        }
        return Result.fail("你没有相关权限！");
    }

    @PostMapping("/isCommittee")
    public Result<Boolean> isCommittee(HttpServletRequest request){
        List<Committee> all = committeeService.getAll();
        Role role = (Role)request.getAttribute("role");
//        role.getRole() != ""
        if (role.getSchoolId() == null){
            return Result.success(false);
        }
        for(Committee committee : all){
            if (committee.getSubordinateCenter().equals(role.getSchoolId().longValue())){
                return Result.success(true);
            }
        }
        return Result.success(false);
    }


    /**
     * 获取所有委员会列表
     * 不需要相关权限 考虑到注册界面
     * @return
     */
    @GetMapping("/")
    public Result<List<Committee>> getAll(){
        List<Committee> all = committeeService.getAll();
        return Result.success(all);
    }
}
