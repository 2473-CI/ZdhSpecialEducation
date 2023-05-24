package szitu.springboot.service;

import szitu.springboot.model.Serve;

import java.util.List;

public interface ServeService {
    public void insert(Serve serve);

    public void delete(Serve serve);

    public List<Serve> selectByStudentId(Serve serve);

}
