package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import notice.dao.NoticeDAO;
import notice.dto.NoticeDTO;

@Service
public class NoticeService {
	@Autowired
	NoticeDAO noticeDAO;
	
	// select : 개별 조회
	public NoticeDTO selectOne(int num) {
		return noticeDAO.selectOne(num);
	}

	// selectTotal : 게시물 전체 갯수
	public int selectTotal() {
		return noticeDAO.selectTotal();
	}
	
	// selsectList : 리스트 조회
	public List<NoticeDTO> selectList(int startNum, int endNum) {
		return noticeDAO.selectList(startNum, endNum);
	}
	
	// insert : 게시물 등록
	public int insert(NoticeDTO dto) {
		return noticeDAO.insert(dto);
	}
	
	// update : 게시물 수정
	public int modify(NoticeDTO dto) {
		return noticeDAO.modify(dto);
	}
	
	// update : 조회수 수정
	public int updateHit(int num) {
		return noticeDAO.updateHit(num);
	}
	
	// delete : 게시물 삭제
	public int delete(int num) {
		return noticeDAO.delete(num);
	}
}
