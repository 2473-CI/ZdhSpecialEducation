package szitu.springboot.service;

import szitu.springboot.model.Answer;

import java.util.Date;
import java.util.List;


public interface AnswerService {
    public void insert(Long scaleId, Long studentId, String title, String context, Date answerTime, String degree, String Evaluation1, String Evaluation2);

    public Answer getOne(Long answerId);

    public List<Answer> getAll();

    public void update(Long answerId,Long scaleId, Long studentId, String title, String context, Date answerTime, String degree, String Evaluation1, String Evaluation2);

    public List<Answer> getListByStudentId(Long studentId);

    public Answer lastInsert(Long studentId);
}
