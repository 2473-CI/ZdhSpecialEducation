package szitu.springboot.controller;

import org.apache.ibatis.annotations.Delete;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import szitu.springboot.model.Exercise;
import szitu.springboot.model.Result;
import szitu.springboot.service.imp.ExerciseServiceImp;

import java.util.List;

@CrossOrigin(origins = "*")
@RequestMapping("/exercise")
@RestController
public class ExerciseController {
    @Autowired
    private ExerciseServiceImp exerciseServiceImp;

    @GetMapping("/getByStudentId")
    public Result<List<Exercise>> getByStudentId(@RequestParam("studentId") Long studentId){
        try {
            List<Exercise> exercises = exerciseServiceImp.selectByStudentId(studentId);
            return Result.success(exercises);
        }catch (Exception err){
            return Result.fail("查询失败！");
        }
    }

    @DeleteMapping("/deleteById")
    public Result<String> deleteById(@RequestParam("id") Long id){
        try {
            exerciseServiceImp.deleteById(id);
            return Result.success("删除成功！");
        }catch (Exception err){
            return Result.fail("删除失败！");
        }
    }


    @PostMapping("/add")
    public Result<Exercise> add(@RequestBody Exercise exercise){
        try {
            if(exercise.getId() == null){
                exerciseServiceImp.insert(exercise);
                exercise = exerciseServiceImp.getLast(exercise.getStudentId());
            }else {
                exerciseServiceImp.update(exercise);
            }

            return Result.success(exercise);
        }catch (Exception err){
            return Result.fail("新增失败！");
        }
    }
}
