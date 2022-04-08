package voice.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import voice.dto.VoiceDTO;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class VoiceDAO {
    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    // 게시물 추가(덧글 아님)
    public int insert(VoiceDTO dto){
        int result = 0;
        try {
            result = sqlSessionTemplate.insert("mybatis.voice.insert", dto);
        } catch (Throwable t) {
            System.out.println("VoiceDAO insert 실패");
            System.out.println(t);
        }

        return result;
    }

    // 덧글 추가
    public int insertComment(VoiceDTO dto) {
        int result = 0;
        try {
            sqlSessionTemplate.update("mybatis.voice.increase", dto);
            dto.setVoice_re_lev(dto.getVoice_re_lev() + 1);
            dto.setVoice_re_seq(dto.getVoice_re_seq() + 1);
            result = sqlSessionTemplate.insert("mybatis.voice.insertComment", dto);
        } catch (Throwable t) {
            System.out.println("VoiceDAO insertComment 실패");
            System.out.println(t);
        }
        return result;
    }

    // 삭제
    public int delete(int num){
        int result = 0;
        try {
            result = sqlSessionTemplate.delete("mybatis.voice.delete", num);
        } catch (Throwable t) {
            System.out.println("VoiceDAO delete 실패");
            System.out.println(t);
        }
        return result;
    }

    // 게시물 개수 조회
    public int selectTotal() {
        int result = 0;
        try {
            result = sqlSessionTemplate.selectOne("mybatis.voice.selectTotal");
        } catch (Throwable t) {
            System.out.println("VoiceDAO selectTotal 실패");
            System.out.println(t);
        }

        return result;
    }

    // 수정
    public int modify(VoiceDTO dto) {
        int result = 0;
        try {
            result = sqlSessionTemplate.update("mybatis.voice.modify", dto);
        } catch (Throwable t) {
            System.out.println("VoiceDAO modify 실패");
            System.out.println(t);
        }
        return result;
    }

    // 한개 조회
    public VoiceDTO selectOne(int num) {
        VoiceDTO dto = null;
        try {
            dto = sqlSessionTemplate.selectOne("mybatis.voice.selectOne", num);
        } catch (Throwable t) {
            System.out.println("VoiceDAO selectOne 실패");
            System.out.println(t);
        }
        return dto;
    }

    // 리스트 조회
    public List<VoiceDTO> selectList(int startNum, int endNum){
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("startNum", startNum);
        map.put("endNum", endNum);

        List<VoiceDTO> list = new ArrayList<VoiceDTO>();
        try {
            list = sqlSessionTemplate.selectList("mybatis.voice.selectList", map);
        } catch (Throwable t) {
            System.out.println("VoiceDAO selectList 실패");
            System.out.println(t);
        }
        return list;
    }


}
