package szitu.springboot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import szitu.springboot.model.Board;
import szitu.springboot.model.Result;
import szitu.springboot.model.Role;
import szitu.springboot.service.imp.BoardServiceImp;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@CrossOrigin(origins = "*")
@RequestMapping("/board")
@RestController
public class BoardController {
    @Autowired
    private BoardServiceImp boardServiceImp;

    @GetMapping("/")
    public Result<List<Board>> get(HttpServletRequest request){
        Role role = (Role)request.getAttribute("role");
        if(role.getRole().equals("系统管理员")){
            return Result.success(boardServiceImp.getAll());
        } else if (role.getRole().equals("委员会")) {
            return Result.success(boardServiceImp.filterRegion(Long.valueOf(role.getRegionCode())));
        }
        return Result.fail("你没有相关权限！");
    }

    @PostMapping("/add")
    public Result<String> add(@RequestBody Board board,  HttpServletRequest request){
        Role role = (Role)request.getAttribute("role");
        if(role.getRole().equals("系统管理员") || role.getRole().equals("委员会")){
            try {
                boardServiceImp.insert(board);
                return Result.success("新增成功！");
            }catch (Exception err){
                return Result.fail("新增失败！");
            }
        }
        return Result.fail("你没有相关权限");
    }
    @PutMapping("/update")
    public Result<String> update(@RequestBody Board board,  HttpServletRequest request){
        Role role = (Role)request.getAttribute("role");
        if(board.getBoardId() == null){
            return Result.fail("关键字段为空！");
        }
        if(role.getRole().equals("系统管理员") || role.getRole().equals("委员会")){
            try {
                boardServiceImp.update(board);
                return Result.success("修改成功！");
            }catch (Exception err){
                return Result.fail("修改失败！");
            }
        }
        return Result.fail("你没有相关权限");
    }

    @DeleteMapping("/delete")
    public Result<String> delete(@RequestBody Board board,  HttpServletRequest request){
        Role role = (Role)request.getAttribute("role");
        if(board.getBoardId() == null){
            return Result.fail("关键字段为空！");
        }
        if(role.getRole().equals("系统管理员") || role.getRole().equals("委员会")){
            try {
                boardServiceImp.delete(board.getBoardId());
                return Result.success("删除成功！");
            }catch (Exception err){
                return Result.fail("删除失败！");
            }
        }
        return Result.fail("你没有相关权限");
    }
}
