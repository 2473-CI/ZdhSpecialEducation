package szitu.springboot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import szitu.springboot.model.Answer;
import szitu.springboot.model.Result;
import szitu.springboot.service.imp.AnswerServiceImpl;

import java.util.ArrayList;
import java.util.List;

@CrossOrigin(origins = "*")
@RequestMapping("/answer")
@RestController
public class AnswerController {



    @Autowired
    public AnswerServiceImpl answerService;


    /**
     {
     "answerId": 33,
     "scaleId": 16,
     "studentId": 52,
     "title": "期中测试",
     "context": "{\"__v_isShallow\":false,\"dep\":{\"w\":0,\"n\":0},\"__v_isRef\":true,\"_rawValue\":[{\"qyestionType\":\"单选\",\"qyestionScore\":5,\"qyestionContent\":\"1+2=？\",\"select\":[{\"value\":\"1\",\"name\":\"A\"},{\"value\":\"3\",\"name\":\"B\"},{\"value\":\"2\",\"name\":\"C\"},{\"value\":\"5\",\"name\":\"D\"}],\"isTrue\":\"B\",\"isFalse\":\"B\",\"remarks\":\"\"},{\"qyestionType\":\"单选\",\"qyestionScore\":5,\"qyestionContent\":\"10-1=？\",\"select\":[{\"value\":\"9\",\"name\":\"A\"},{\"value\":\"11\",\"name\":\"B\"},{\"value\":\"8\",\"name\":\"C\"},{\"value\":\"7\",\"name\":\"D\"}],\"isTrue\":\"A\",\"isFalse\":\"B\",\"remarks\":\"\"}],\"_value\":[{\"qyestionType\":\"单选\",\"qyestionScore\":5,\"qyestionContent\":\"1+2=？\",\"select\":[{\"value\":\"1\",\"name\":\"A\"},{\"value\":\"3\",\"name\":\"B\"},{\"value\":\"2\",\"name\":\"C\"},{\"value\":\"5\",\"name\":\"D\"}],\"isTrue\":\"B\",\"isFalse\":\"B\",\"remarks\":\"\"},{\"qyestionType\":\"单选\",\"qyestionScore\":5,\"qyestionContent\":\"10-1=？\",\"select\":[{\"value\":\"9\",\"name\":\"A\"},{\"value\":\"11\",\"name\":\"B\"},{\"value\":\"8\",\"name\":\"C\"},{\"value\":\"7\",\"name\":\"D\"}],\"isTrue\":\"A\",\"isFalse\":\"B\",\"remarks\":\"\"}]}",
     "answerTime": null,
     "degree": "已完成",
     "evaluation1": "",
     "evaluation2": ""
     },
     * @param answer
     * @return
     */
    @PostMapping("/add")
    // Long scaleId, Long studentId, String title, String context, Date answerTime, String degree, String Evaluation1, String Evaluation2
    public Result<String> add(@RequestBody Answer answer){
        if(answer.getAnswerId() == null){
            try {
                answerService.insert(answer.getScaleId(), answer.getStudentId(), answer.getTitle(), answer.getContext(), answer.getAnswerTime(), answer.getDegree(), answer.getEvaluation1(), answer.getEvaluation2());
//                System.out.println(id);
                Answer answer1 = answerService.lastInsert(answer.getStudentId());
                return Result.success(answer1.getAnswerId().toString());
            }catch (Exception err){
                return Result.fail("新增失败！"+err.getMessage());
            }
        }else {
            try {
                answerService.update(answer.getAnswerId(), answer.getScaleId(), answer.getStudentId(), answer.getTitle(), answer.getContext(), answer.getAnswerTime(), answer.getDegree(), answer.getEvaluation1(), answer.getEvaluation2());
                return Result.success("修改成功！");
            }catch (Exception err){
                return Result.fail("修改失败！"+err.getMessage());
            }
        }

    }

    @GetMapping("/getAll")
    public Result<List<Answer>> getAll(@RequestParam(name = "studentId", required = false, defaultValue = "-1") Long studentId){
        if(studentId == -1){
            return Result.success(answerService.getAll());
        }else {
            System.out.println(answerService.getListByStudentId(studentId));
            return Result.success(answerService.getListByStudentId(studentId));
        }

    }


    @GetMapping("/get")
    public Result<Answer> getOne(@RequestParam(name = "answerId") Long answerId){
        return Result.success(answerService.getOne(answerId));
    }
}
