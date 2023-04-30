package szitu.springboot.service;


import szitu.springboot.model.File;

import java.util.List;

public interface FileService {
    public void insert(File file);

    public List<File> search(File file);

}
