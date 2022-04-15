package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import account.dao.AccountDAO;
import account.dto.AccountDTO;

@Service
public class AccountService {
	@Autowired
	AccountDAO accountDAO;
	
	// 회원 가입(저장)
	public int insert(AccountDTO dto) {
		return accountDAO.insert(dto);
	}
	
	// 로그인
	public String login(String id, String pass) {
		return accountDAO.login(id, pass);
	}
	
	// 아이디 중복체크
	public boolean isExistId(String id) {
		boolean result = false;
		if(accountDAO.selectOne(id) != null) {	// 값이 존재하면 ture
			result = true;
		}
		return result;
	}
	
	// 고객 개별 조회
	public AccountDTO selectOne(String id) {
		return accountDAO.selectOne(id);
	}
	
	// 고객 전체 조회
	public List<AccountDTO> selectList(int startNum, int endNum) {
		return accountDAO.selectList(startNum, endNum);
	}
	
	// 총 인원 수 구하기
	public int selectTotal() {
		return accountDAO.selectTotal();
	}
	
	// 회원 정보 수정(수정)
	public int modify(AccountDTO dto) {
		return accountDAO.modify(dto);
	}
	
	// 회원 탈퇴(삭제)
	public int delete(String id) {
		return accountDAO.delete(id);
	}
	
}
