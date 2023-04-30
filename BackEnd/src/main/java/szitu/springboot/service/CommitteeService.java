package szitu.springboot.service;

import szitu.springboot.model.Committee;

import java.util.List;

public interface CommitteeService {
    public void create(Committee committee);

    public void update(Committee committee);

    public void delete(Long regionId);

    public List<Committee> getAll();

    public Committee getById(Long id);

    public Committee isCenter(Long subordinateCenter);
}
