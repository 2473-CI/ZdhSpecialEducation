package szitu.springboot.service.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import szitu.springboot.mapper.BoardMapper;
import szitu.springboot.model.Board;
import szitu.springboot.service.BoardService;

import java.util.List;

@Service
public class BoardServiceImp implements BoardService {
    @Autowired
    private BoardMapper boardMapper;

    @Override
    public Board getByAccount(String account) {
        return boardMapper.getByAccount(account);
    }

    @Override
    public void insert(Board board) {
        boardMapper.insert(board);
    }

    @Override
    public List<Board> getAll() {
        return boardMapper.select();
    }

    @Override
    public void update(Board board){
        boardMapper.update(board);
    }

    @Override
    public void delete(Long BoardId){
        boardMapper.delete(BoardId);
    }

    @Override
    public List<Board> filterRegion(Long region) {
        return filterRegion(region);
    }
}
