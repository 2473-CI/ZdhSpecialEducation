package szitu.springboot.service.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import szitu.springboot.mapper.TransferMapper;
import szitu.springboot.model.Transfer;
import szitu.springboot.service.TransferService;

import java.util.List;

@Service
public class TransferServiceImpl implements TransferService {
    @Autowired
    private TransferMapper transferMapper;

    @Override
    public List<Transfer> selectAllStartSchool(Transfer transfer, Integer offset, Integer size) {
        return transferMapper.selectAllStartSchool(transfer.getFromSchoolId(), offset, size);
    }

    @Override
    public Long selectAllStartSchoolLength(Transfer transfer) {
        return transferMapper.selectAllStartSchoolLength(transfer.getFromSchoolId());
    }

    @Override
    public List<Transfer> selectCenterPadding(Transfer transfer, Integer offset, Integer size) {
        return transferMapper.selectCenterPadding(transfer.getFromRegionCode(), offset, size);
    }

    @Override
    public Long selectCenterPaddingLength(Transfer transfer) {
        return transferMapper.selectCenterPaddingLength(transfer.getFromRegionCode());
    }

    @Override
    public List<Transfer> selectBoardPadding(Transfer transfer, Integer offset, Integer size) {
        return transferMapper.selectBoardPadding(transfer.getFromRegionCode(), offset, size);
    }

    @Override
    public Long selectBoardPaddingLength(Transfer transfer) {
        return transferMapper.selectBoardPaddingLength(transfer.getFromRegionCode());
    }

    @Override
    public void overrule(Transfer transfer) {
        transferMapper.overrule(transfer);
    }

    @Override
    public void start(Transfer transfer) {
        transferMapper.start(transfer);
    }

    @Override
    public void successCenter(Transfer transfer) {
        transferMapper.successCenter(transfer);
    }

    @Override
    public void successBoard(Transfer transfer) {
        transferMapper.successBoard(transfer);
    }

    @Override
    public void end(Transfer transfer) {
        transferMapper.end(transfer);
    }
}
