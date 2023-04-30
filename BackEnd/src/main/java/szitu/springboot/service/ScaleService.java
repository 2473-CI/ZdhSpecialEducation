package szitu.springboot.service;

import szitu.springboot.model.Scale;

import java.util.List;

public interface ScaleService {
    public void insert(Long studentBasicId, String title, String context, String scoring);

    public List<Scale> getAll();

    public List<Scale> search(String classify1, String classify2, String classify3, String title);

    public Scale getById(Long id);

    public void delete(Long scaleId);
}
