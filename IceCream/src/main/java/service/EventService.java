package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import event.dao.EventDAO;
import event.dto.EventDTO;

public class EventService {
	@Autowired
	EventDAO eventDAO;

	// select : 개별 조회
	public EventDTO selectOne(int num) {
		return eventDAO.selectOne(num);
	}

	// selectTotal : 게시물 전체 갯수
	public int selectTotal() {
		return eventDAO.selectTotal();
	}

	// selsectList : 리스트 조회
	public List<EventDTO> selectList(int startNum, int endNum) {
		return eventDAO.selectList(startNum, endNum);
	}

	// insert : 게시물 등록
	public int insert(EventDTO dto) {
		return eventDAO.insert(dto);
	}

	// update : 게시물 수정
	public int modify(EventDTO dto) {
		return eventDAO.modify(dto);
	}

	// update : 조회수 수정
	public int updateHit(int num) {
		return eventDAO.updateHit(num);
	}

	// delete : 게시물 삭제
	public int delete(int num) {
		return eventDAO.delete(num);
	}
}
