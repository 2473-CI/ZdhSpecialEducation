package szitu.springboot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import szitu.springboot.model.Result;
import szitu.springboot.model.Role;
import szitu.springboot.model.School;
import szitu.springboot.model.User;
import szitu.springboot.service.imp.SchoolServiceImpl;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@CrossOrigin(origins = "*")
@RequestMapping("/school")
@RestController
public class SchoolController {
    @Autowired
    private SchoolServiceImpl schoolService;

    @GetMapping("/getAll")
    public Result<List<School>> getAll(HttpServletRequest request){
        Role role = (Role)request.getAttribute("role");
        if(role == null || role.getRole().equals("管理员")){
            return Result.success(schoolService.selectAllSchool());
        }else if(role.getRole().equals("委员会") && role.getAuthorization() != null){
            return Result.success(schoolService.selectAllFilterRegion(Long.valueOf(role.getRegionCode())));
        }
        return Result.success(new ArrayList<>());
    }

    @PostMapping("/add")
    public Result<String> addSchool(@RequestBody School school, HttpServletRequest request) {
        Role role = (Role)request.getAttribute("role");
        if(role.getRole().equals("系统管理员") || role.getRole().equals("委员会")){
            boolean flag = schoolService.addSchool(school.getSchoolName(), school.getProvinceCode(), school.getCityCode(), school.getRegionCode());
            if(flag){
                return Result.success("数据插入成功！");
            }
            return Result.fail("插入失败，可是原因为学校名称为空!");
        }
        return Result.fail("你不具有相关权限！");
    }

    @DeleteMapping("/delete")
    public Result<String> delete(@RequestParam(name = "schoolId", required = true) Long schoolId, HttpServletRequest request){
        Role role = (Role)request.getAttribute("role");
        if(role.getRole().equals("系统管理员") || role.getRole().equals("委员会")){
            try {
                schoolService.delete(schoolId);
                return Result.success("删除成功！");
            }catch (Exception err){
                return Result.fail("删除失败！");
            }
        }
        return Result.fail("你不具有相关权限！");
    }
}
