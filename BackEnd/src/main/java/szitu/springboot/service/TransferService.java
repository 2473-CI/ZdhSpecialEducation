package szitu.springboot.service;

import szitu.springboot.model.Transfer;

import java.util.List;

public interface TransferService {
    public List<Transfer> selectAllStartSchool(Transfer transfer, Integer offset, Integer size);
    public Long selectAllStartSchoolLength(Transfer transfer);
    public List<Transfer> selectCenterPadding(Transfer transfer, Integer offset, Integer size);
    public Long selectCenterPaddingLength(Transfer transfer);
    public List<Transfer> selectBoardPadding(Transfer transfer, Integer offset, Integer size);
    public Long selectBoardPaddingLength(Transfer transfer);
    public void overrule(Transfer transfer);
    public void start(Transfer transfer);
    public void successCenter(Transfer transfer);
    public void successBoard(Transfer transfer);
    public void end(Transfer transfer);
    public List<Transfer> selectEndPadding(Integer toSchoolId, Integer offset, Integer size);
    public Long selectEndPaddingLength(Integer toSchoolId);
}
