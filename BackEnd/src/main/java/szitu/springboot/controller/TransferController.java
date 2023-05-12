package szitu.springboot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import szitu.springboot.model.Result;
import szitu.springboot.model.Role;
import szitu.springboot.model.Transfer;
import szitu.springboot.model.User;
import szitu.springboot.service.imp.TransferServiceImpl;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@CrossOrigin(origins = "*")
@RequestMapping("/transfer")
@RestController
public class TransferController {
    @Autowired
    private TransferServiceImpl transferService;

    @PostMapping("/selectAllStartSchool")
    public Result<List<Transfer>> selectAllStartSchool(@RequestBody Transfer transfer,
                                                       @RequestParam(name = "page", required = false, defaultValue = "1") Integer page,
                                                       @RequestParam(name = "size", required = false, defaultValue = "20") Integer size
                                                        , HttpServletRequest request) throws Exception {
        Role role = (Role)request.getAttribute("role");
        transfer.setToSchoolId(role.getSchoolId());
        if(transfer.getFromSchoolId() == null){
            return Result.fail("缺少关键信息");
        }
        try{
            List<Transfer> ts = transferService.selectAllStartSchool(transfer, (page - 1) * size, size);
            Long length = transferService.selectAllStartSchoolLength(transfer);
            Result<List<Transfer>> result = Result.success(ts);
            result.setLength(length);
            return result;
        }catch (Exception err){
            return Result.fail("查询失败"+err);
        }
    }


    @PostMapping("/selectCenterPadding")
    public Result<List<Transfer>> selectCenterPadding(@RequestBody Transfer transfer,
                                                       @RequestParam(name = "page", required = false, defaultValue = "1") Integer page,
                                                       @RequestParam(name = "size", required = false, defaultValue = "20") Integer size,
                                                      HttpServletRequest request) throws Exception {
        Role role = (Role)request.getAttribute("role");
        transfer.setFromRegionCode(role.getRegionCode().toString());
        if(transfer.getFromRegionCode() == null){
            return Result.fail("缺少关键信息");
        }
        try{
            List<Transfer> ts = transferService.selectCenterPadding(transfer, (page - 1) * size, size);
            Long length = transferService.selectCenterPaddingLength(transfer);
            Result<List<Transfer>> result = Result.success(ts);
            result.setLength(length);
            return result;
        }catch (Exception err){
            return Result.fail("查询失败");
        }
    }

    @PostMapping("/selectBoardPadding")
    public Result<List<Transfer>> selectBoardPadding(@RequestBody Transfer transfer,
                                                      @RequestParam(name = "page", required = false, defaultValue = "1") Integer page,
                                                      @RequestParam(name = "size", required = false, defaultValue = "20") Integer size,
                                                     HttpServletRequest request) throws Exception {
        Role role = (Role)request.getAttribute("role");
        transfer.setFromRegionCode(role.getRegionCode().toString());
        if(transfer.getFromRegionCode() == null){
            return Result.fail("缺少关键信息");
        }
        try{
            List<Transfer> ts = transferService.selectBoardPadding(transfer, (page - 1) * size, size);
            Long length = transferService.selectBoardPaddingLength(transfer);
            Result<List<Transfer>> result = Result.success(ts);
            result.setLength(length);
            return result;
        }catch (Exception err){
            return Result.fail("查询失败");
        }
    }

    @PostMapping("/successCenter")
    public Result<String> successCenter(@RequestBody Transfer transfer){
        if(transfer.getId() == null){
            return Result.fail("缺少关键信息");
        }
        try {
            transferService.successCenter(transfer);
            return Result.success("特教中心成功通过审批！");
        }catch (Exception err){
            return Result.fail("状态修改失败");
        }
    }

    @PostMapping("/successBoard")
    public Result<String> successBoard(@RequestBody Transfer transfer){
        if(transfer.getId() == null){
            return Result.fail("缺少关键信息");
        }
        try {
            transferService.successBoard(transfer);
            return Result.success("委员会成功通过审批！");
        }catch (Exception err){
            return Result.fail("状态修改失败");
        }
    }

    @PostMapping("/overrule")
    public Result<String> overrule(@RequestBody Transfer transfer){
        if(transfer.getId() == null){
            return Result.fail("缺少关键信息");
        }
        try {
            transferService.overrule(transfer);
            return Result.success("驳回过审批！");
        }catch (Exception err){
            return Result.fail("状态修改失败");
        }
    }


    @PostMapping("/start")
    public Result<String> start(@RequestBody Transfer transfer){
        if(transfer.getStudentId() == null || transfer.getFromSchoolId() == null || transfer.getToSchoolId() == null){
            return Result.fail("缺少关键信息");
        }
        try {
            transferService.start(transfer);
            return Result.success("创建成功！");
        }catch (Exception err){
            return Result.fail("创建失败");
        }
    }
}
