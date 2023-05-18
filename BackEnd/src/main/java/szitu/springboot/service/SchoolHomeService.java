package szitu.springboot.service;

import szitu.springboot.model.SchoolHome;

import java.util.List;

public interface SchoolHomeService {
    public List<SchoolHome> selectByStudentId(SchoolHome schoolHome);

    public void deleteById(SchoolHome schoolHome);

    public void insert(SchoolHome schoolHome);
}
