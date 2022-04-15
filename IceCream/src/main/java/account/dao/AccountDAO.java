package account.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import account.dto.AccountDTO;

@Repository
public class AccountDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	// 회원 가입(저장)
	public int insert(AccountDTO dto) {
		int result = 0;
		
		try {
			result = sqlSessionTemplate.insert("mybatis.account.insert", dto);
		} catch (Throwable t) {
			System.out.println("AccountDAO insert 실패");
			System.out.println(t);
		}
		return result;
	}
	
	// 로그인
	public String login(String id, String pass) {		
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pass", pass);
		
		String result = null;
		
		try {
			result = sqlSessionTemplate.selectOne("mybatis.account.login", map);
		} catch (Throwable t) {
			System.out.println("AccountDAO login 실패");
			System.out.println(t);
		}
		return result;
	}
		
	// 고객 개별 조회
	public AccountDTO selectOne(String id) {
		AccountDTO dto = null;
		
		try {
			dto = sqlSessionTemplate.selectOne("mybatis.account.selectOne", id);
		} catch (Throwable t) {
			System.out.println("AccountDAO selectOne 실패");
			System.out.println(t);
		}
		return dto;
	}
	
	// 고객 전체 조회
	public List<AccountDTO> selectList(int startNum, int endNum) {
		Map<String,Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		List<AccountDTO> list = new ArrayList<AccountDTO>();
		
		try {
			list = sqlSessionTemplate.selectList("mybatis.account.selectList", map);
		} catch (Throwable t) {
			System.out.println("AccountDAO selectList 실패");
			System.out.println(t);
		}
		return list;
	}
	
	// 총 인원 수 구하기
	public int selectTotal() {
		int result = 0;
		
		try {
			result = sqlSessionTemplate.selectOne("mybatis.account.selectTotal");
		} catch (Throwable t) {
			System.out.println("AccountDAO selectTotal 실패");
			System.out.println(t);
		}
		return result;
	}
	
	// 회원 정보 수정(수정)
	public int modify(AccountDTO dto) {
		int result = 0;
		
		try {
			result = sqlSessionTemplate.delete("mybatis.account.modify", dto);
		} catch (Throwable t) {
			System.out.println("AccountDAO modify 실패");
			System.out.println(t);
		}
		return result;
	}
	
	// 회원 탈퇴(삭제)
	public int delete(String id) {
		int result = 0;
		
		try {
			result = sqlSessionTemplate.delete("mybatis.account.delete", id);
		} catch (Throwable t) {
			System.out.println("AccountDAO delete 실패");
			System.out.println(t);
		}
		return result;
	}

}
