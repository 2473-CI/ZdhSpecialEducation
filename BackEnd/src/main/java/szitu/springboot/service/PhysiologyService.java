package szitu.springboot.service;

import szitu.springboot.model.Physiology;

public interface PhysiologyService {
    public void init(Long studentId);

    public Physiology get(Long studentId);

    public void update(Physiology physiology);
}
