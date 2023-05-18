package szitu.springboot.service;

import szitu.springboot.model.Schedule;

import java.util.List;

public interface ScheduleService {
    public List<Schedule> selectByStudentId(Schedule schedule);

    public void insert(Schedule schedule);

    public void deleteById(Integer id);
}
