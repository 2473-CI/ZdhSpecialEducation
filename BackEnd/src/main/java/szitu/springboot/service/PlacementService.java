package szitu.springboot.service;

import szitu.springboot.model.Placement;

import java.util.List;

public interface PlacementService {
    public List<Placement> selectByStudentId(Placement placement);

    public void insert(Placement placement);

    public void end(Placement placement);

    public List<Placement> selectBySchoolId(Integer schoolId, Integer offset, Integer size);
}
