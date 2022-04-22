package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import voice.dao.VoiceDAO;
import voice.dto.VoiceDTO;

import java.util.List;

@Service
public class VoiceService {
    @Autowired
    VoiceDAO voiceDAO;

    // 게시물 추가(덧글 아님)
    public int insert(VoiceDTO dto) {
        return voiceDAO.insert(dto);
    }

    // 덧글 전에 작업
    public void increase(int num) {
        voiceDAO.increase(num);
    }

    // 덧글 추가
    public int insertComment(VoiceDTO dto) {
        return voiceDAO.insertComment(dto);
    }

    // 삭제
    public int delete(int num) {
        return voiceDAO.delete(num);
    }

    // 게시물 개수 조회
    public int selectTotal() {
        return voiceDAO.selectTotal();
    }

    // 수정
    public int modify(VoiceDTO dto) {
        return voiceDAO.modify(dto);
    }

    // 한개 조회
    public VoiceDTO selectOne(int num) {
        return voiceDAO.selectOne(num);
    }

    // 리스트 조회
    public List<VoiceDTO> selectList(int startNum, int endNum) {
        return voiceDAO.selectList(startNum, endNum);
    }

    // 검색후 갯수 조회
    public int selectTotalSearch(String search) {
        return voiceDAO.selectTotalSearch(search);
    }

    // 검색후 리스트 조회
    public List<VoiceDTO> selectListSearch(int startNum, int endNum, String search) {
        return voiceDAO.selectListSearch(startNum, endNum, search);
    }
}
