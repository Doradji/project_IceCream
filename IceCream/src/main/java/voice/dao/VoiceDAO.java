package voice.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import voice.dto.VoiceDTO;

@Repository
public class VoiceDAO {
    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    public int insert(VoiceDTO dto){
        int result = 0;

        return result;
    }

}
