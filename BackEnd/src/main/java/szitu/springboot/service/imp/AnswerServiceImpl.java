package szitu.springboot.service.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import szitu.springboot.mapper.AnswerMapper;
import szitu.springboot.model.Answer;
import szitu.springboot.service.AnswerService;

import java.util.Date;
import java.util.List;

@Service
public class AnswerServiceImpl implements AnswerService {
    @Autowired
    private AnswerMapper answerMapper;

    @Override
    public void insert(Long scaleId, Long studentId, String title, String context, Date answerTime, String degree, String Evaluation1, String Evaluation2) {
        answerMapper.insert(scaleId, studentId, title, context, answerTime, degree, Evaluation1, Evaluation2);
    }

    @Override
    public void update(Long answerId,Long scaleId, Long studentId, String title, String context, Date answerTime, String degree, String Evaluation1, String Evaluation2){
        answerMapper.update(answerId, scaleId, studentId, title, context, answerTime, degree, Evaluation1, Evaluation2);
    }

    @Override
    public Answer getOne(Long answerId) {
        return answerMapper.getOne(answerId);
    }

    @Override
    public List<Answer> getAll() {
        return answerMapper.getAll();
    }

    @Override
    public List<Answer> getListByStudentId(Long studentId){
        return answerMapper.getListByStudentId(studentId);
    }

    @Override
    public Answer lastInsert(Long studentId) {
        return answerMapper.lastInsert(studentId);
    }
}
