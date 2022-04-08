package notice.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import notice.dto.NoticeDTO;

public class NoticeDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	// select : 개별조회
	public NoticeDTO selectOne(int num) {
		NoticeDTO dto = new NoticeDTO();
		
		try {
			dto = sqlSession.selectOne("mybatis.notice.selectOne", num);
		} catch (Throwable t) {
			System.out.println("NoticeDAO selectOne 실패");
			System.out.println(t);
		}
		return dto;
	}
	
	// select : 게시물 전체 갯수
	public int selectTotal() {
		int result = 0;
		try {
			result = sqlSession.selectOne("mybatis.notice.selectTotal");
		} catch (Throwable t) {
			System.out.println("NoticeDAO selectTotal 실패");
			System.out.println(t);
		}
		return result;
	}
	
	// insert
	public int insert(NoticeDTO dto) {
		int result = 0;
		try {
			result = sqlSession.insert("mybatis.notice.insert", dto);
		} catch (Throwable t) {
			System.out.println("NoticeDAO insert 실패");
			System.out.println(t);
		}
		return result;
	}
	
	// update
	public int update(NoticeDTO dto) {
		int result = 0;
		try {
			result = sqlSession.update("mybatis.notice.update", dto);
		} catch (Throwable t) {
			System.out.println("NoticeDAO update 실패");
			System.out.println(t);
		}
		return result;
	}
	
	// update : 조회수 증가
	public int updateHit(int num) {
		int result = 0;
		try {
			result = sqlSession.update("mybatis.notice.updateHit", num);
		} catch (Throwable t) {
			System.out.println("NoticeDAO updateHit 실패");
			System.out.println(t);
		}
		return result;
	}
	
	// delete : 삭제
	public int delete(int num) {
		int result = 0;
		try {
			result = sqlSession.update("mybatis.notice.delete", num);
		} catch (Throwable t) {
			System.out.println("NoticeDAO delete 실패");
			System.out.println(t);
		}
		return result;
	}

}
