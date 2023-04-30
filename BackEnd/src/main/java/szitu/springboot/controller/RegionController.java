package szitu.springboot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import szitu.springboot.mapper.RegionMapper;
import szitu.springboot.model.Region;
import szitu.springboot.model.Result;
import szitu.springboot.service.imp.RegionServiceImpl;

import java.util.List;
@CrossOrigin(origins = "*")
@RequestMapping("/region")
@RestController
public class RegionController {
    @Autowired
    private RegionServiceImpl regionService;

    @GetMapping("/getAll")
    public Result<List<Region>> getAll(){
        return Result.success(regionService.getAll());
    }

    @GetMapping("/select")
    public Result<List<Region>> select(
            @RequestParam(name = "cityCode", required = false, defaultValue = "-1") Long cityCode,
            @RequestParam(name = "provinceCode", required = false, defaultValue = "-1") Long provinceCode
    ){
        if(cityCode != -1){
            return Result.success(regionService.selectRegion(cityCode)) ;
        }else if(provinceCode != -1){
            return Result.success(regionService.selectCity(provinceCode)) ;
        }
        return Result.success(regionService.selectProvince());
    }


    @GetMapping("/getOneMess")
    public Result<Region> getOneMess(
            @RequestParam(name = "regionCode", required = false, defaultValue = "-1") Long regionCode
    ){
        return Result.success(regionService.selectOneMess(regionCode));
    }

}
