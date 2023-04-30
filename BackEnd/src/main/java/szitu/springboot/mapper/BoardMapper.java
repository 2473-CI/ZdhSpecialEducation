package szitu.springboot.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import szitu.springboot.model.Board;

import java.util.List;

@Mapper
public interface BoardMapper {
    /**
     * 增
     * @param board
     */
    @Insert("""
            INSERT INTO `board` (committeeId, account, userName, passWord, userHead, userGender, userPhone, userMail, createTime) 
            VALUE(#{committeeId}, #{account}, #{userName},#{passWord},#{userHead},#{userGender},#{userPhone},#{userMail}, NOW())
            """)
    public void insert(Board board);

    /**
     * 删
     */
    @Update("UPDATE `board` SET deleteTime = NOW() WHERE deleteTime is NULL AND boardId=#{boardId};")
    public void delete(Long boardId);

    /**
     * 改
     * @return
     */
    @Update("""
            UPDATE `board` SET
            account = #{account},
            userName = #{userName},
            userHead = #{userHead},
            userGender = #{userGender},
            userPhone = #{userPhone},
            userMail = #{userMail}
            WHERE deleteTime is NULL AND boardId=#{boardId};
            """)
    public void update(Board board);

    @Update("""
            UPDATE `board` SET
            authorization = "授权"
            WHERE deleteTime is NULL AND boardId=#{boardId};
            """)
    public void updateAuth(Long boardId);

    /**
     * 查询
     * @param account
     * @return
     */

    @Select("SELECT * FROM `board` WHERE account=#{account} AND deleteTime is NULL;")
    public Board getByAccount(String account);

    @Select("SELECT * FROM `board` WHERE deleteTime is NULL;")
    public List<Board> select();

    @Select("""
            SELECT b.* FROM board b
            INNER JOIN committee c ON b.committeeId = c.id
            WHERE c.regionId = #{region};
            """)
    public List<Board> filterRegion(Long region);


}
