package szitu.springboot.service;

import szitu.springboot.model.GrowUp;

public interface GrowUpService {
    public void init(Long studentId);

    public GrowUp get(Long studentId);

    public void update(GrowUp growUp);
}
