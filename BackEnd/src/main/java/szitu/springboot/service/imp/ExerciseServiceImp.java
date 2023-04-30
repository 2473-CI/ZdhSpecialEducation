package szitu.springboot.service.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import szitu.springboot.mapper.ExerciseMapper;
import szitu.springboot.model.Exercise;
import szitu.springboot.service.ExerciseService;

import java.util.List;

@Service
public class ExerciseServiceImp implements ExerciseService {
    @Autowired
    private ExerciseMapper exerciseMapper;

    @Override
    public List<Exercise> selectByStudentId(Long studentId) {
        return exerciseMapper.selectByStudentId(studentId);
    }

    @Override
    public void insert(Exercise exercise) {
        exerciseMapper.insert(exercise);
    }

    @Override
    public void deleteById(Long id) {
        exerciseMapper.deleteById(id);
    }

    @Override
    public Exercise getLast(Long studentId) {
        return exerciseMapper.getLast(studentId);
    }

    @Override
    public void update(Exercise exercise) {
        exerciseMapper.update(exercise);
    }
}
