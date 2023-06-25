package szitu.springboot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import szitu.springboot.model.Grade;
import szitu.springboot.model.Result;
import szitu.springboot.service.EchartsService;
import szitu.springboot.service.imp.GradeServiceImp;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@CrossOrigin(origins = "*")
@RequestMapping("/echarts")
@RestController
public class EchartsController {
    @Autowired
    private EchartsService echartsService;

    @Autowired
    private GradeServiceImp gradeServiceImp;

    @GetMapping("/obsProportion")
    public Result<List<Map>> obsProportion (@RequestParam(name="id") Integer id){
        Map<Object, Object> map = new HashMap<>();
        map.put("schoolId", id);
        List<Map> maps = echartsService.obsProportion(map);
        return Result.success(maps);
    }
    @GetMapping("/classStatistics")
    public Result<List<Map>> classStatistics (@RequestParam(name="id") Integer id){
        HashMap<Object, Object> map = new HashMap<>();
        map.put("schoolId",id);

        List<Map> maps = echartsService.classStatistics(map);

        List<Grade> all = gradeServiceImp.getAll();
        List<Map> add = new ArrayList<>();
        for (Grade grade: all) {
            String gradeName = grade.getGradeName();
            boolean flag = false;
            for (Map m: maps){
                String s = (String) m.get("gradeName");
                if(s.equals(gradeName)){
                    flag = true;
                }
            }
            if(flag) continue;
            HashMap<Object, Object> m = new HashMap<>();
            m.put("gradeName", gradeName);
            m.put("sum", 0);
            add.add(m);
        }

        maps.addAll(add);

        return Result.success(maps);
    }
    @GetMapping("/countTeacherByStudentId")
    public Result<Integer> countTeacherByStudentId(@RequestParam(name="id") Integer id){
        HashMap<Object, Object> map = new HashMap<>();
        map.put("schoolId",id);
        return Result.success(echartsService.countTeacherByStudentId(map));
    }

    @GetMapping("/countFileBySchoolId")
    public Result<Integer> countFileBySchoolId(@RequestParam(name="schoolId") Integer schoolId){
        return Result.success(echartsService.countFileBySchoolId(schoolId));
    }

    @GetMapping("/countNewStudentBySchoolId")
    public Result<Integer> countNewStudentBySchoolId(@RequestParam(name="schoolId") Integer schoolId){
        return Result.success(echartsService.countNewStudentBySchoolId(schoolId));
    }
}

