package szitu.springboot.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import szitu.springboot.model.Transfer;

import java.util.List;

@Mapper
public interface TransferMapper {
    // 查看本校的发起情况
    @Select("SELECT * FROM transfer WHERE fromSchoolId = #{fromSchoolId} AND status!='接受完成' limit #{offset},#{size}")
    public List<Transfer> selectAllStartSchool(Integer fromSchoolId, Integer offset, Integer size);

    @Select("SELECT count(1) FROM transfer WHERE fromSchoolId = #{transfer.fromSchoolId} AND status!='接受完成'")
    public Long selectAllStartSchoolLength(Integer fromSchoolId);

    // 查看特教中心 待审批列表
    @Select("SELECT * FROM transfer WHERE schoolTime IS NOT NULL AND centerTime IS NULL AND fromRegionCode=#{fromRegionCode} AND status!='驳回' limit #{offset},#{size}")
    public List<Transfer> selectCenterPadding(String fromRegionCode, Integer offset, Integer size);

    @Select("SELECT count(1) FROM transfer WHERE schoolTime IS NOT NULL AND centerTime IS NULL AND fromRegionCode=#{fromRegionCode} AND status!='驳回'")
    public Long selectCenterPaddingLength(String fromRegionCode);

    // 查看委员会待审批的列表
    @Select("SELECT * FROM transfer WHERE centerTime IS NOT NULL AND boardTime IS NULL AND fromRegionCode=#{fromRegionCode} AND status!='驳回' limit #{offset},#{size}")
    public List<Transfer> selectBoardPadding(String fromRegionCode, Integer offset, Integer size);

    @Select("SELECT count(1) FROM transfer WHERE centerTime IS NOT NULL AND boardTime IS NULL AND fromRegionCode=#{fromRegionCode} AND status!='驳回'")
    public Long selectBoardPaddingLength(String fromRegionCode);

    @Select("SELECT * FROM transfer WHERE boardTime IS NOT NULL AND endTime IS NULL AND toSchoolId=#{toSchoolId} AND status!='驳回' limit #{offset},#{size}")
    public List<Transfer> selectEndPadding(Integer toSchoolId, Integer offset, Integer size);

    @Select("SELECT count(1) FROM transfer WHERE boardTime IS NOT NULL AND endTime IS NULL AND toSchoolId=#{toSchoolId} AND status!='驳回'")
    public Long selectEndPaddingLength(Integer toSchoolId);

    // 驳回
    @Update("UPDATE transfer SET status = '驳回',other=#{other}  WHERE id = #{id}")
    public void overrule(Transfer transfer);

    @Update("""
    INSERT INTO transfer(studentId,studentName, fromSchoolId, fromSchollName, fromRegionCode, toSchoolId, toSchoolName, toRegionCode, startTime, schoolTime)
    values(#{studentId}, #{studentName}, #{fromSchoolId}, #{fromSchollName}, #{fromRegionCode}, #{toSchoolId}, #{toSchoolName}, #{toRegionCode}, NOW(), NOW())
    """)
    public void start(Transfer transfer);

    @Update("UPDATE transfer SET centerTime=NOW()  WHERE id = #{id}")
    public void successCenter(Transfer transfer);

    @Update("UPDATE transfer SET boardTime=NOW()  WHERE id = #{id}")
    public void successBoard(Transfer transfer);

    @Update("UPDATE transfer SET endTime=NOW() AND status='接受完成'  WHERE id = #{id}")
    public void end(Transfer transfer);

    @Select("SELECT * FROM transfer WHERE studentId=#{studentId}")
    public List<Transfer> selectByStudentId(Long studentId);
}
