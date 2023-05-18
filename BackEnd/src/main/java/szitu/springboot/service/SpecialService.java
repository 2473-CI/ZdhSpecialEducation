package szitu.springboot.service;

import szitu.springboot.model.Special;

import java.util.List;

public interface SpecialService {
    public List<Special> selectByStudentId(Special special);
    public void deleteById(Special special);
    public void insert(Special special);
}
