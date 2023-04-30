package szitu.springboot.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import szitu.springboot.model.GrowUp;

@Mapper
public interface GrowUpMapper {

    @Insert("INSERT INTO growUp (studentId) values(#{studentId})")
    public void initGrowUp(Long studentId);

    @Select("SELECT * FROM `growUp` WHERE studentId=#{studentId}")
    public GrowUp selectByStudentId(Long studentId);

    @Update("""
            <script>
            UPDATE growUp SET 
            <if test='trimesterWeight != null'> trimesterWeight=#{trimesterWeight}, </if>
            <if test='isTakeMedicine != null'> isTakeMedicine=#{isTakeMedicine}, </if>
            <if test='isSmokeOrDrink != null'> isSmokeOrDrink=#{isSmokeOrDrink},  </if>
            <if test='emotionalCharacteristics != null'> emotionalCharacteristics=#{emotionalCharacteristics},  </if>
            <if test='physiologicalReaction != null'> physiologicalReaction=#{physiologicalReaction},  </if>
            <if test='sleepQuality != null'>  sleepQuality=#{sleepQuality},  </if>
            <if test='isTimeDifference != null'>  isTimeDifference=#{isTimeDifference},  </if>
            <if test='industrialChemicalFactor != null'>  industrialChemicalFactor=#{industrialChemicalFactor},  </if>
            <if test='physicalFactor != null'>  physicalFactor=#{physicalFactor},  </if>
            <if test='biologicalFactor != null'>  biologicalFactor=#{biologicalFactor},  </if>
            <if test='nutritionalFactor != null'>  nutritionalFactor=#{nutritionalFactor},  </if>
            <if test='badHabit != null'>  badHabit=#{badHabit},  </if>
            <if test='predelivery != null'>  predelivery=#{predelivery},  </if>
            <if test='atChildbirth != null'>  atChildbirth=#{atChildbirth},  </if>
            <if test='weight != null'>  weight=#{weight},  </if>
            <if test='length != null'>  length=#{length},  </if>
            <if test='headCircumference != null'>  headCircumference=#{headCircumference},  </if>
            <if test='suffocation != null'>  suffocation=#{suffocation},  </if>
            <if test='feedingPattern != null'>  feedingPattern=#{feedingPattern},  </if>
            <if test='firstWordAppears != null'>  firstWordAppears=#{firstWordAppears},  </if>
            <if test='firstSentence != null'>  firstSentence=#{firstSentence},  </if>
            <if test='headUpTime != null'>  headUpTime=#{headUpTime},  </if>
            <if test='independentSittingTime != null'>  independentSittingTime=#{independentSittingTime},  </if>
            <if test='independentStationTime != null'>  independentStationTime=#{independentStationTime},  </if>
            <if test='independentTravelTime != null'>  independentTravelTime=#{independentTravelTime},  </if>
            <if test='urinationTime != null'>  urinationTime=#{urinationTime},  </if>
            <if test='stoolTime != null'>  stoolTime=#{stoolTime},  </if>
            <if test='independentUrinationTime != null'>  independentUrinationTime=#{independentUrinationTime},  </if>
            <if test='independentStoolTime != null'>  independentStoolTime=#{independentStoolTime},  </if>
            <if test='geneticHistory != null'>  geneticHistory=#{geneticHistory},  </if>
            <if test='majorDiseases != null'>  majorDiseases=#{majorDiseases}  </if>
            WHERE studentId=#{studentId}
            </script>
            """)
    public void update(GrowUp growUp);
}
