package szitu.springboot.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import szitu.springboot.model.Scale;

import java.util.List;

@Mapper
public interface ScaleMapper {

    @Insert("INSERT INTO scale (studentBasicId, title, context, createTime,scoring) value(#{studentBasicId}, #{title}, #{context}, NOW(), #{scoring})")
    public void insert(Long studentBasicId, String title, String context, String scoring);

    @Select("""
            SELECT `scale`.`scaleId`, `scale`.`title`,`scale`.`context`, 
                   `scaleClassify`.`classify1`, `scaleClassify`.`classify2`, `scaleClassify`.`classify3`
            FROM `scale`
            LEFT JOIN `scaleClassify` ON `scale`.`studentBasicId` = `scaleClassify`.`id`
            WHERE `scale`.`deleteTime` IS NULL;
            """)
    public List<Scale> getAll();

    @Select("""
            UPDATE `scale` SET deleteTime=NOW() WHERE scaleId=#{scaleId};
            """)
    public void delete(Long scaleId);

    @Select("""
            <script>
            SELECT `scale`.`scaleId`, `scale`.`title`,`scale`.`context`,
                   `scaleClassify`.`classify1`, `scaleClassify`.`classify2`, `scaleClassify`.`classify3`
            FROM `scale`
            LEFT JOIN `scaleClassify` ON `scale`.`studentBasicId` = `scaleClassify`.`id`
            WHERE `scale`.`deleteTime` IS NULL
                <if test='classify1 != ""'> AND `scaleClassify`.`classify1`=#{classify1} </if>
                <if test='classify2 != ""'> AND `scaleClassify`.`classify2`=#{classify2} </if>
                <if test='classify3 != ""'> AND `scaleClassify`.`classify3`=#{classify3} </if>
                <if test='title != ""'> AND `scale`.`title` like CONCAT('%', #{title},'%')  </if>
                ;
            </script>
            """)
    public List<Scale> search(String classify1, String classify2, String classify3, String title);


    @Select("""
            SELECT `scale`.`scaleId`, `scale`.`title`,`scale`.`context`,
                   `scaleClassify`.`classify1`, `scaleClassify`.`classify2`, `scaleClassify`.`classify3`, `scoring`
            FROM `scale`
            LEFT JOIN `scaleClassify` ON `scale`.`studentBasicId` = `scaleClassify`.`id`
            WHERE `scale`.`deleteTime` IS NULL
                        AND `scale`.`scaleId` = #{id};
            """)
    public Scale getOneContext(Long id);

}
