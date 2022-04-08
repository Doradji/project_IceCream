package notice.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import notice.dto.NoticeDTO;

public class NoticeDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// select : 개별 조회
	public NoticeDTO selectOne(int num) {
		NoticeDTO dto = new NoticeDTO();
		
		try {
			dto = sqlSession.selectOne("mybatis.notice.getTotalA", num);
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
			result = sqlSession.selectOne("mybatis.notice.selectTotal");
		} catch (Throwable t) {
			System.out.println("NoticeDTO selectOne 실패");
			System.out.println(t);
		}
		return result;
	}
	
	// insert : 게시물 등록
	public int insert(NoticeDTO dto) {
		int result = 0;
		
		try {
			result = sqlSession.insert("mybatis.notice.insert", dto);
		} catch (Throwable t) {
			System.out.println("NoticeDTO selectOne 실패");
			System.out.println(t);
		}
		return result;
	}
	
	// update : 게시물 수정
	public int modify(NoticeDTO dto) {
		int result = 0;
		
		try {
			result = sqlSession.update("mybatis.notice.modify", dto);
		} catch (Throwable t) {
			System.out.println("NoticeDTO selectOne 실패");
			System.out.println(t);
		}
		return result;
	}
	
	// update : 조회수 수정
	public int updateHit(int num) {
		int result = 0;
		
		try {
			result = sqlSession.update("mybatis.notice.updateHit", num);
		} catch (Throwable t) {
			System.out.println("NoticeDTO selectOne 실패");
			System.out.println(t);
		}
		return result;
	}
	
	// delete : 게시물 삭제
	public int delete(int num) {
		int result = 0;
		
		try {
			result = sqlSession.delete("mybatis.notice.delete", num);
		} catch (Throwable t) {
			System.out.println("NoticeDTO selectOne 실패");
			System.out.println(t);
		}
		return result;
	}
	
}
