package szitu.springboot.service;

import szitu.springboot.model.Clazz;

import java.util.List;

public interface ClazzService {
    public List<Clazz> getAll();

    public List<Clazz> searchBySchool(Long schoolId, Long gradeId, String clazzName, Long offset, Long size);
    public Long searchBySchoolCount(Long schoolId, Long gradeId, String clazzName);

    public boolean deleteClazz(Long clazzId);

    public void updateClazz(Long clazzId, Long gradeId, String clazzName, String description);

    public void add(Long schoolId, Long gradeId, String clazzName, String description);
}
