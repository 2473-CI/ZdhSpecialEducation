package szitu.springboot.service;

import szitu.springboot.model.Exercise;

import java.util.List;

public interface ExerciseService {
    public List<Exercise> selectByStudentId(Long studentId);

    public void insert(Exercise exercise);

    public void deleteById(Long id);

    public Exercise getLast(Long studentId);

    public void update(Exercise exercise);
}
