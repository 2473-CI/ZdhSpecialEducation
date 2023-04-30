package szitu.springboot.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import szitu.springboot.model.Admin;

@Mapper
public interface AdminMapper {
    /**
     * 增
     * @param admin
     */
    @Insert("INSERT INTO `admin` (account, userName, passWord, createTime) VALUE(#{account}, #{userName}, #{passWord}, NOW());")
    public void insert(Admin admin);

    /**
     * 删
     * @param account
     * @return
     */

    /**
     * 改
     * @param account
     * @return
     */

    /**
     * 查询
     * @param account
     * @return
     */
    @Select("SELECT * FROM `admin` WHERE account=#{account} AND deleteTime is NULL;")
    public Admin getByAccount(String account);


}
