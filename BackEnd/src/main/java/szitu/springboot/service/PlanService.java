package szitu.springboot.service;

import szitu.springboot.model.Plan;

import java.util.List;

public interface PlanService {
    public List<Plan> selectByStudentId(Plan plan);

    public void deleteById(Plan plan);

    public void insert(Plan plan);


}
