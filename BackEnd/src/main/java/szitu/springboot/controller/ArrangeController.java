package szitu.springboot.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import szitu.springboot.model.Arrange;
import szitu.springboot.model.Result;
import szitu.springboot.service.imp.ArrangeServiceImp;

import java.util.List;

@CrossOrigin(origins = "*")
@RequestMapping("/arrange")
@RestController
public class ArrangeController {
    @Autowired
    private ArrangeServiceImp arrangeServiceImp;

    @GetMapping("/getAll")
    public Result<List<Arrange>> getAll(){
        return Result.success(arrangeServiceImp.getAll());
    }
}
