package szitu.springboot.service;

import szitu.springboot.model.Board;

import java.util.List;

public interface BoardService {
    public void update(Board board);

    public Board getByAccount(String account);

    public void insert(Board board);

    public void delete(Long BoardId);

    public List<Board> getAll();

    public List<Board> filterRegion(Long region);
}
