package szitu.springboot.service.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import szitu.springboot.mapper.PlanMapper;
import szitu.springboot.model.Plan;
import szitu.springboot.service.PlanService;

import java.util.List;

@Service
public class PlanServiceImp implements PlanService {
    @Autowired
    private PlanMapper planMapper;

    @Override
    public List<Plan> selectByStudentId(Plan plan) {
        return planMapper.selectByStudentId(plan);
    }

    @Override
    public void deleteById(Plan plan) {
        planMapper.deleteById(plan);
    }

    @Override
    public void insert(Plan plan) {
        planMapper.insert(plan);
    }
}
