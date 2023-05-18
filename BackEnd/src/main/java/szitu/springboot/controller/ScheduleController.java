package szitu.springboot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import szitu.springboot.model.Result;
import szitu.springboot.model.Schedule;
import szitu.springboot.service.imp.ScheduleServiceImpl;

import java.util.List;

@CrossOrigin(origins = "*")
@RequestMapping("/schedule")
@RestController
public class ScheduleController {
    @Autowired
    private ScheduleServiceImpl scheduleService;

    @PostMapping("/add")
    public Result<String> add(@RequestBody Schedule schedule){
        if(schedule.getSchedule() == null){
            return Result.fail("缺少关键信息");
        }
        if(schedule.getStudentId() == null && schedule.getClassId() == null){
            return Result.fail("缺少关键信息");
        }
        try {
            scheduleService.insert(schedule);
            return Result.success("新增成功！");
        }catch (Exception err){
            return Result.fail("新增失败！");
        }
    }

    @PostMapping("/deleteById")
    public Result<String> deleteById(@RequestBody Schedule schedule){
        if(schedule.getId() == null){
            return Result.fail("缺少关键信息！");
        }
        try {
            scheduleService.deleteById(schedule.getId());
            return Result.success("删除成功！");
        }catch (Exception err){
            return Result.fail("删除失败！");
        }
    }

    @PostMapping("/selectById")
    public Result<List<Schedule>> selectById(@RequestBody Schedule schedule){
        if(schedule.getStudentId() == null && schedule.getClassId() == null){
            return Result.fail("缺少关键信息！");
        }
        try {
            List<Schedule> schedules = scheduleService.selectByStudentId(schedule);
            return Result.success(schedules);
        }catch (Exception err){
            return Result.fail("查询失败！" + err);
        }
    }
}
