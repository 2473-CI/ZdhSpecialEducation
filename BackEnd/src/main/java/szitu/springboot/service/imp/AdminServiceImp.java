package szitu.springboot.service.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import szitu.springboot.mapper.AdminMapper;
import szitu.springboot.model.Admin;
import szitu.springboot.service.AdminService;


@Service
public class AdminServiceImp implements AdminService {
    @Autowired
    private AdminMapper adminMapper;

    @Override
    public Admin getByAccount(String account) {
        return adminMapper.getByAccount(account);
    }


}
