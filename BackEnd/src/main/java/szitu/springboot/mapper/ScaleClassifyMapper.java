package szitu.springboot.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import szitu.springboot.model.ScaleClassify;

import java.util.List;

@Mapper
public interface ScaleClassifyMapper {
    @Select("SELECT * FROM `scaleClassify`")
    public List<ScaleClassify> getAll();

    @Select("""
            <script>
            SELECT * FROM `scaleClassify` 
            WHERE 
            <if test='classify1 != ""'> classify1=#{classify1} <if test='classify2 != ""|| classify3 != ""'> AND </if> </if> 
            <if test='classify2 != ""'> classify2=#{classify2} <if test='classify3 != ""'> AND </if> </if> 
            <if test='classify3 != ""'> classify3=#{classify3} </if>
            </script>
            """)
    public List<ScaleClassify> search(String classify1, String classify2, String classify3);

    @Insert("INSERT INTO `scaleClassify`(classify1, classify2, classify3) values(#{classify1}, #{classify2}, #{classify3})")
    public void insert(String classify1, String classify2, String classify3);


    @Delete("""
            DELETE FROM `scaleClassify` WHERE id=#{id}
            """)
    public void delete(Long id);
}
