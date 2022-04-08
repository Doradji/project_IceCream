package notice.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import event.dto.EventDTO;
import notice.dto.NoticeDTO;

@Repository
public class NoticeDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	// select : 개별 조회
	public NoticeDTO selectOne(int num) {
		NoticeDTO dto = new NoticeDTO();
		
		try {
			dto = sqlSessionTemplate.selectOne("mybatis.notice.selectOne", num);
		} catch (Throwable t) {
			System.out.println("NoticeDTO selectOne 실패");
			System.out.println(t);
		}
		return dto;
	}
	
	// selectTotal : 게시물 전체 갯수
	public int selectTotal() {
		int result = 0;
		
		try {
			result = sqlSessionTemplate.selectOne("mybatis.notice.selectTotal");
		} catch (Throwable t) {
			System.out.println("NoticeDTO selectTotal 실패");
			System.out.println(t);
		}
		return result;
	}
	
	// selsectList : 리스트 조회
    public List<NoticeDTO> selectList(int startNum, int endNum){
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("startNum", startNum);
        map.put("endNum", endNum);

        List<NoticeDTO> list = new ArrayList<NoticeDTO>();
        try {
            list = sqlSessionTemplate.selectList("mybatis.notice.selectList", map);
        } catch (Throwable t) {
            System.out.println("NoticeDTO selectList 실패");
            System.out.println(t);
        }
        return list;
    }
	
	// insert : 게시물 등록
	public int insert(NoticeDTO dto) {
		int result = 0;
		
		try {
			result = sqlSessionTemplate.insert("mybatis.notice.insert", dto);
		} catch (Throwable t) {
			System.out.println("NoticeDTO insert 실패");
			System.out.println(t);
		}
		return result;
	}
	
	// update : 게시물 수정
	public int modify(NoticeDTO dto) {
		int result = 0;
		
		try {
			result = sqlSessionTemplate.update("mybatis.notice.modify", dto);
		} catch (Throwable t) {
			System.out.println("NoticeDTO modify 실패");
			System.out.println(t);
		}
		return result;
	}
	
	// update : 조회수 수정
	public int updateHit(int num) {
		int result = 0;
		
		try {
			result = sqlSessionTemplate.update("mybatis.notice.updateHit", num);
		} catch (Throwable t) {
			System.out.println("NoticeDTO updateHit 실패");
			System.out.println(t);
		}
		return result;
	}
	
	// delete : 게시물 삭제
	public int delete(int num) {
		int result = 0;
		
		try {
			result = sqlSessionTemplate.delete("mybatis.notice.delete", num);
		} catch (Throwable t) {
			System.out.println("NoticeDTO delete 실패");
			System.out.println(t);
		}
		return result;
	}
	
}
