package szitu.springboot.service;

import szitu.springboot.model.Admin;

public interface AdminService {
    public Admin getByAccount(String account);
}
