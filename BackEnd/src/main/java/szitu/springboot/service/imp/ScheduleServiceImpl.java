package szitu.springboot.service.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import szitu.springboot.mapper.ScheduleMapper;
import szitu.springboot.model.Schedule;
import szitu.springboot.service.ScheduleService;

import java.util.List;

@Service
public class ScheduleServiceImpl implements ScheduleService {
    @Autowired
    private ScheduleMapper scheduleMapper;
    @Override
    public List<Schedule> selectByStudentId(Integer studentId) {
        return scheduleMapper.selectByStudentId(studentId);
    }

    @Override
    public void insert(Schedule schedule) {
        scheduleMapper.insert(schedule);
    }

    @Override
    public void deleteById(Integer id) {
        scheduleMapper.deleteById(id);
    }
}
