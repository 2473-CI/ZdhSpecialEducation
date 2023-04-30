package szitu.springboot.service;

import szitu.springboot.model.Love;

public interface LoveService {
    public void init(Long studentId);

    public Love get(Long studentId);

    public void update(Love love);


}
