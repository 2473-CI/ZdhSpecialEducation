package szitu.springboot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import szitu.springboot.model.Obstacle;
import szitu.springboot.model.Result;
import szitu.springboot.service.imp.ObstacleServiceImp;

import java.util.List;

@CrossOrigin(origins = "*")
@RequestMapping("/obstacle")
@RestController
public class ObstacleController {

    @Autowired
    private ObstacleServiceImp obstacleServiceImp;

    @GetMapping("/getAll")
    public Result<List<Obstacle>> getALl(){
        return Result.success(obstacleServiceImp.getAll()) ;
    }
}
