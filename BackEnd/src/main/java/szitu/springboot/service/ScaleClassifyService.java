package szitu.springboot.service;

import szitu.springboot.model.ScaleClassify;

import java.util.List;

public interface ScaleClassifyService {
    public List<ScaleClassify> getAll();
    public List<ScaleClassify> search(String classify1, String classify2, String classify3);

    public void add(String classify1, String classify2, String classify3);

    public void delete(Long id);
}
