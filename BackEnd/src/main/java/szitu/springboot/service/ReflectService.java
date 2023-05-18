package szitu.springboot.service;

import szitu.springboot.model.Reflect;

import java.util.List;

public interface ReflectService {
    public List<Reflect> selectByStudentId(Reflect reflect);

    public void deleteById(Reflect reflect);

    public void insert(Reflect reflect);
}
