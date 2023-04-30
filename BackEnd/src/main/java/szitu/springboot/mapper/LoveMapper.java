package szitu.springboot.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import szitu.springboot.model.Love;

@Mapper
public interface LoveMapper {

    @Insert("""
            INSERT INTO `love` (studentId, loveArticle, loveActivity, loveFigure, characterAdvantage, shtick, other, unLoveArticle, unLoveActivity, unLoveFigure, otherFactors, explain_) 
            VALUES(#{studentId}, "", "", "", "", "", "", "", "", "", "", "");
            """)
    public void initLove(Long studentId);

    @Select("SELECT * FROM `love` WHERE studentId=#{studentId}")
    public Love SelectLove(Long studentId);

    @Update("UPDATE `love` SET loveArticle=#{loveArticle}, loveActivity=#{loveActivity}, loveFigure=#{loveFigure}, " +
            "characterAdvantage=#{characterAdvantage}, shtick=#{shtick}, other=#{other}, unLoveArticle=#{unLoveArticle}, " +
            "unLoveActivity=#{unLoveActivity}, unLoveFigure=#{unLoveFigure}, otherFactors=#{otherFactors}, " +
            "explain_=#{explain_} WHERE studentId=#{studentId}")
    public void UpdateLove(Love love);

}
