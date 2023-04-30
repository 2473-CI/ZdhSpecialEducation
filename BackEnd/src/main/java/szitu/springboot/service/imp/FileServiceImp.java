package szitu.springboot.service.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import szitu.springboot.mapper.FileMapper;
import szitu.springboot.model.File;
import szitu.springboot.service.FileService;

import java.util.List;

@Service
public class FileServiceImp implements FileService {
    @Autowired
    private FileMapper fileMapper;

    @Override
    public void insert(File file) {
        fileMapper.insert(file);
    }

    @Override
    public List<File> search(File file) {
        return fileMapper.search(file);
    }
}
