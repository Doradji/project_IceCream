package event.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import event.dto.EventDTO;

@Repository
public class EventDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	// select : 개별 조회
	public EventDTO selectOne(int num) {
		EventDTO dto = new EventDTO();

		try {
			dto = sqlSessionTemplate.selectOne("mybatis.event.selectOne", num);
		} catch (Throwable t) {
			System.out.println("EventDAO selectOne 실패");
			System.out.println(t);
		}
		return dto;
	}

	// selectTotal : 게시물 전체 갯수
	public int selectTotal() {
		int result = 0;

		try {
			result = sqlSessionTemplate.selectOne("mybatis.event.selectTotal");
		} catch (Throwable t) {
			System.out.println("EventDAO selectTotal 실패");
			System.out.println(t);
		}
		return result;
	}
	
	// selsectList : 리스트 조회
    public List<EventDTO> selectList(int startNum, int endNum){
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("startNum", startNum);
        map.put("endNum", endNum);

        List<EventDTO> list = new ArrayList<EventDTO>();
        try {
            list = sqlSessionTemplate.selectList("mybatis.event.selectList", map);
        } catch (Throwable t) {
            System.out.println("EventDAO selectList 실패");
            System.out.println(t);
        }
        return list;
    }

	// insert : 게시물 등록
	public int insert(EventDTO dto) {
		int result = 0;

		try {
			result = sqlSessionTemplate.insert("mybatis.event.insert", dto);
		} catch (Throwable t) {
			System.out.println("EventDAO insert 실패");
			System.out.println(t);
		}
		return result;
	}

	// update : 게시물 수정
	public int modify(EventDTO dto) {
		int result = 0;

		try {
			result = sqlSessionTemplate.update("mybatis.event.modify", dto);
		} catch (Throwable t) {
			System.out.println("EventDAO modify 실패");
			System.out.println(t);
		}
		return result;
	}

	// update : 조회수 수정
	public int updateHit(int num) {
		int result = 0;

		try {
			result = sqlSessionTemplate.update("mybatis.event.updateHit", num);
		} catch (Throwable t) {
			System.out.println("EventDAO updateHit 실패");
			System.out.println(t);
		}
		return result;
	}

	// delete : 게시물 삭제
	public int delete(int num) {
		int result = 0;

		try {
			result = sqlSessionTemplate.delete("mybatis.event.delete", num);
		} catch (Throwable t) {
			System.out.println("EventDAO delete 실패");
			System.out.println(t);
		}
		return result;
	}

}
