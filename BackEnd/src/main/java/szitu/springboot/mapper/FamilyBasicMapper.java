package szitu.springboot.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import szitu.springboot.model.FamilyBasic;

@Mapper
public interface FamilyBasicMapper {
    @Insert("""
            INSERT INTO  `familyBasic`
            (studentId, numberOfFamily, homeAddress, annualIncome, languageEnvironment, parentingStyle, familyResourceAdvantages, familyResourceAdvantagesMess, livingResources, otherLivingResources, leisureResources, otherLeisureResources, employmentResources, otherEmploymentResources) 
            VALUES(#{studentId}, 0, "", "", "", "", "", "", "", "", "", "", "", "")
            """)
    public void initFamilyBasic(Long studentId);

    @Select("SELECT * FROM `familyBasic` WHERE studentId=#{studentId}")
    public FamilyBasic selectByStudentId(Long studentId);

    @Update("""
            <script>
            UPDATE `familyBasic` SET
            <if test='numberOfFamily != null'> numberOfFamily=#{numberOfFamily}, </if>
            <if test='homeAddress != null'> homeAddress=#{homeAddress}, </if>
            <if test='annualIncome != null'> annualIncome=#{annualIncome}, </if>
            <if test='languageEnvironment != null'> languageEnvironment=#{languageEnvironment}, </if>
            <if test='parentingStyle != null'> parentingStyle=#{parentingStyle}, </if>
            <if test='familyResourceAdvantages != null'> familyResourceAdvantages=#{familyResourceAdvantages}, </if>
            <if test='familyResourceAdvantagesMess != null'> familyResourceAdvantagesMess=#{familyResourceAdvantagesMess}, </if>
            <if test='livingResources != null'> livingResources=#{livingResources}, </if>
            <if test='otherLivingResources != null'> otherLivingResources=#{otherLivingResources}, </if>
            <if test='leisureResources != null'> leisureResources=#{leisureResources}, </if>
            <if test='otherLeisureResources != null'> otherLeisureResources=#{otherLeisureResources}, </if>
            <if test='employmentResources != null'> employmentResources=#{employmentResources}, </if>
            <if test='otherEmploymentResources != null'> otherEmploymentResources=#{otherEmploymentResources} </if>
            WHERE studentId=#{studentId}
            </script>
            """)
    public void updateFamilyBasic(FamilyBasic familyBasic);
}
