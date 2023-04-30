package szitu.springboot.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import szitu.springboot.model.Committee;

import java.util.List;

@Mapper
public interface CommitteeMapper {
    /**
     * 增
     * @param committee
     */
    @Insert("""
            INSERT INTO committee (regionId, committeeName, committeeAddress, committeeResponsible, committeePhone, committeeCreateTime, introduction, subordinateCenter)
            VALUES(#{regionId}, #{committeeName}, #{committeeAddress}, #{committeeResponsible}, #{committeePhone}, #{committeeCreateTime}, #{introduction}, #{subordinateCenter})
            """)
    public void insert(Committee committee);

    /**
     * 删
     * @param regionId
     */
    @Update("""
            UPDATE committee SET 
            deleteTime=NOW()
            WHERE regionId=#{regionId} AND deleteTime IS NULL ;
            """)
    public void delete(Long regionId);

    /**
     * 改
     * @param committee
     */
    @Update("""
            UPDATE committee SET
            committeeName=#{committeeName},
            committeeAddress=#{committeeAddress},
            committeeResponsible=#{committeeResponsible},
            committeePhone=#{committeePhone},
            committeeCreateTime=#{committeeCreateTime},
            introduction=#{introduction},
            subordinateCenter=#{subordinateCenter}
            WHERE regionId=#{regionId} AND deleteTime IS NULL ;
            """)
    public void update(Committee committee);

    /**
     * 查
     * @return
     */
    @Select("SELECT * FROM committee WHERE deleteTime IS NULL;")
    public List<Committee> getAll();

    @Select("SELECT * FROM committee WHERE deleteTime IS NULL AND id=#{id};")
    public Committee getById(Long id);

    @Select("SELECT * FROM committee WHERE deleteTime IS NULL AND subordinateCenter=#{subordinateCenter};")
    public Committee isCenter(Long subordinateCenter);
}
