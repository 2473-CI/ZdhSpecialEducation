package szitu.springboot.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import szitu.springboot.model.File;

import java.util.List;

@Mapper
public interface FileMapper {

    @Insert("""
            INSERT INTO file (fileType,contextType, fileTitle, fileSubtitle, fileOnwerId, OnwerType, `publiced`, createTime, filePath)
            VALUES (#{fileType}, #{contextType}, #{fileTitle}, #{fileSubtitle}, #{fileOnwerId}, #{OnwerType}, #{publiced}, NOW(), #{filePath});
            """)
    public void insert(File file);

    @Select("""
        <script>
            SELECT * FROM file WHERE 1=1
            <if test='fileType != null and fileType.trim() != ""'>
                AND fileType = #{fileType}
            </if>
            <if test='fileTitle != null and fileTitle.trim() != ""'>
                AND fileTitle LIKE CONCAT('%',#{fileTitle},'%')
            </if>
            <if test='fileSubtitle != null and fileSubtitle.trim() != ""'>
                AND fileSubtitle LIKE CONCAT('%',#{fileSubtitle},'%')
            </if>
            <if test='contextType != null and contextType.trim() != ""'>
                AND contextType LIKE CONCAT('%',#{contextType},'%')
            </if>
            <if test='publiced != "publiced"'>
                AND fileOnwerId=#{fileOnwerId} AND OnwerType=#{OnwerType} 
            </if>
            <if test='publiced == "publiced"'>
                AND publiced=#{publiced}
            </if>
        </script>
        """)
    public List<File> search(File file);


}
