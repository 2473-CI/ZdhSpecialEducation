package szitu.springboot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import szitu.springboot.model.Grade;
import szitu.springboot.model.Region;
import szitu.springboot.model.Result;
import szitu.springboot.service.imp.GradeServiceImp;

import java.util.List;

@CrossOrigin(origins = "*")
@RequestMapping("/grade")
@RestController
public class GradeController {
    @Autowired
    private GradeServiceImp gradeServiceImp;

    @GetMapping("/getAll")
    public Result<List<Grade>> getAll(){
        return Result.success(gradeServiceImp.getAll());
    }
}
