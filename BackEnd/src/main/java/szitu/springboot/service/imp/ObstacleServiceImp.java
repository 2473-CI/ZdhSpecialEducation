package szitu.springboot.service.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import szitu.springboot.mapper.ObstacleMapper;
import szitu.springboot.model.Obstacle;
import szitu.springboot.service.ObstacleService;

import java.util.List;

@Service
public class ObstacleServiceImp implements ObstacleService {
    @Autowired
    private ObstacleMapper obstacleMapper;

    @Override
    public List<Obstacle> getAll() {
        return obstacleMapper.selectAll();
    }
}
