package szitu.springboot.service;

import szitu.springboot.model.FamilyBasic;

public interface FamilyBasicService {
    public void init(Long studentId);

    public FamilyBasic get(Long studentId);

    public void update(FamilyBasic familyBasic);
}
