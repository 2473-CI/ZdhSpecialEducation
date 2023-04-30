package szitu.springboot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import szitu.springboot.mapper.StudentMapper;
import szitu.springboot.model.Committee;
import szitu.springboot.model.Result;
import szitu.springboot.model.Role;
import szitu.springboot.model.Student;
import szitu.springboot.service.imp.CommitteeServiceImpl;
import szitu.springboot.service.imp.StudentServiceImp;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

@CrossOrigin(origins = "*")
@RequestMapping("/examine")
@RestController
public class ExamineController {
    @Autowired
    private StudentServiceImp serviceImp;
    @Autowired
    private CommitteeServiceImpl committeeService;

    @GetMapping("/needAuth")
    public Result<List<Student>> needAuth(HttpServletRequest request,
                               @RequestParam(name = "page", required = false, defaultValue = "1") Long page,
                               @RequestParam(name = "size", required = false, defaultValue = "20") Long size){
        List<Student> students = null;
        Role role = (Role)request.getAttribute("role");
        System.out.println(role);
        if(role.getRole().equals("系统管理员")){
            students = serviceImp.needAuth(null, null, null, (page - 1) * size, size);
        }else if(role.getRole().equals("委员会")){
            System.out.println(">>>");
            System.out.println(Long.valueOf(role.getRegionCode()));
            students = serviceImp.needAuth("需委员会审批", null, Long.valueOf(role.getRegionCode()), (page-1)*size, size);
        }else if(role.getRole().equals("学校管理员")){
            Committee center = committeeService.isCenter(Long.valueOf(role.getSchoolId()));
            if(center != null && center.getRegionId()!=null){
                students = serviceImp.needAuth("需特教中心审批", null, Long.valueOf(role.getRegionCode()), (page-1)*size, size);
            }else {
                students = serviceImp.needAuth("需学校审批", Long.valueOf(role.getSchoolId()), null, (page-1)*size, size);
            }
        }else {
            System.out.println("<<<");
            students = new ArrayList<>();
        }
        return Result.success(students) ;
    }

    @GetMapping("/auth")
    public Result<String> auth(HttpServletRequest request,  @RequestParam(name = "studentId") Long studentId){
        if(studentId == null){
            return Result.fail("信息有误！");
        }
        Role role = (Role)request.getAttribute("role");
        LinkedList<String> list = new LinkedList<>();
        list.add(null);
        list.add("需学校审批");
        list.add("需特教中心审批");
        list.add("需委员会审批");
        list.add("审批完成");

        Student student = serviceImp.getById(studentId);
        if(student == null){
            return Result.fail("信息有误！");
        }
        if ("审批被驳回".equals(student.getAuthorization())){
            serviceImp.auth(studentId, "需学校审批");
            return Result.success("本次审批成功！");
        }
        int index = list.indexOf(student.getAuthorization());
        if("审批完成".equals(student.getAuthorization())){
            return Result.fail("审批已完成，无需重复提交！");
        }
        serviceImp.auth(studentId, list.get(index+1));
        return Result.success("本次审批成功！");
    }

    @GetMapping("/unAuth")
    public Result<String> unAuth(HttpServletRequest request,  @RequestParam(name = "studentId") Long studentId){
        if(studentId == null){
            return Result.fail("信息有误！");
        }
        serviceImp.auth(studentId, "审批被驳回");
        return Result.success("驳回审批成功！");
    }
}
