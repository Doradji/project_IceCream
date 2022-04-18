package controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import account.dto.AccountDTO;
import service.AccountService;

@Controller
public class AccountController {
	@Autowired
	AccountService service;
	
	// index
		@RequestMapping(value="../index.do")
		public ModelAndView index() {
			
			ModelAndView modelAndView = new ModelAndView();
			
			modelAndView.setViewName("/");
			return modelAndView;
		}
		
	// loginForm
	@RequestMapping(value = "/account/loginForm.do")
	public ModelAndView loginForm() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("req", "account/loginForm.jsp");
		modelAndView.setViewName("/");
		
		return modelAndView;
	}
	
	// login
	@RequestMapping(value = "/account/login.do")
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 데이터 처리
		request.setCharacterEncoding("UTF-8");	// 인코딩 설정
		
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		
		String name = service.login(id, pass);
		
		// 뷰처리
		ModelAndView modelAndView = new ModelAndView();
		// 페이지 이동
		if(name != null) { // 로그인 성공
			HttpSession session = request.getSession();
			// 세션을 이용한 페이지 이동
			session.setAttribute("memName", name);
			session.setAttribute("memId", id);
			
			modelAndView.setViewName("redirect:loginOk.do");
		} else {			// 로그인 실패
			modelAndView.setViewName("redirect:loginFail.do");
		}		
		return modelAndView;
	}
	
	// loginOk
	@RequestMapping(value="/account/loginOk.do")
	public ModelAndView loginOk(HttpServletRequest request, HttpServletResponse response) {
		/* 데이터 처리 */
		// 세션을 통한 아이디와 이름 얻어오기
		HttpSession session = request.getSession();
		
		String name = (String)session.getAttribute("memName");
		String id = (String)session.getAttribute("memId");
		
		// 뷰처리
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("id", id);
		modelAndView.addObject("name", name);
		modelAndView.addObject("req", "account/loginOk.jsp");
		modelAndView.setViewName("/");
		
		return modelAndView;
	}
	
	// loginFail
	@RequestMapping(value="/account/loginFail.do")
	public ModelAndView loginFail() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("req", "account/loginFail.jsp");
		modelAndView.setViewName("/");
		
		return modelAndView;
	}
	
	// logout
	@RequestMapping(value="/account/logout.do")
	public ModelAndView logout(HttpServletRequest request) {
		// 데이터 처리
		HttpSession session = request.getSession();
		// 로그아웃 시 세션 삭제
		session.removeAttribute("memName");
		session.removeAttribute("memId");
		
		// view처리
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("req", "account/logout.jsp");
		modelAndView.setViewName("/");
		
		return modelAndView;
	}
	

	
	// checkId
	@RequestMapping(value="/account/checkId.do")
	public ModelAndView checkId(HttpServletRequest request) {
		// 데이터 처리
		String id = request.getParameter("id");
		
		// DB : id가 있는지 검사
		boolean exist = service.isExistId(id);
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("id", id);
		modelAndView.addObject("exist", exist);
		modelAndView.setViewName("checkId.jsp");
		
		return modelAndView;
	
	}
	
	// 회원가입 입력폼
	@RequestMapping(value="/account/writeForm.do")
	public ModelAndView writeForm() {
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("req", "account/writeForm.jsp");
		modelAndView.setViewName("/");
		
		return modelAndView;
	}
	
	
	// 회원가입
	@RequestMapping(value="/account/write.do")
	public ModelAndView write(HttpServletRequest request) throws IOException{
		// 데이터 처리
		request.setCharacterEncoding("utf-8"); // 한글 인코딩 설정
		
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String tel1 = request.getParameter("tel1");
		String tel2 = request.getParameter("tel2");
		String tel3 = request.getParameter("tel3");
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		String addr3 = request.getParameter("addr3");
		String addr4 = request.getParameter("addr4");
		String email = request.getParameter("email");
		String birth = request.getParameter("birth");
		// DB 처리
		AccountDTO dto = new AccountDTO();
		dto.setId(id);
		dto.setPass(pass);
		dto.setName(name);
		dto.setGender(gender);
		dto.setTel1(tel1);
		dto.setTel2(tel2);
		dto.setTel3(tel3);		
		dto.setAddr1(addr1);
		dto.setAddr2(addr2);
		dto.setAddr3(addr3);
		dto.setAddr4(addr4);
		dto.setEmail(email);
		dto.setBirth(birth);
		
		int result = service.insert(dto);
		
		// 뷰 처리
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("req", "account/write.jsp");
		modelAndView.addObject("result", result);
		modelAndView.setViewName("/");
		
		return modelAndView;
	}
	
	// select : 회원 개별 조회
	@RequestMapping("/account/selectOne.do")
	public ModelAndView selectOne() {
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("req", "account/login.jsp");
		modelAndView.setViewName("/");

		return modelAndView;
	}
	
	
	// selsectList : 회원 리스트 조회
	@RequestMapping(value="/account/selectList.do")
	public ModelAndView memberList() {

		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("req", "account/login.jsp");
		modelAndView.setViewName("/");

		return modelAndView;
	}
	
	// 정보수정 입력폼
	@RequestMapping(value="/account/modifyForm.do")
	public ModelAndView modifyForm(HttpServletRequest request) {
		// 데이터 처리
		// 회원 1명에 대한 데이터 읽어오기
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("memId");
		
		AccountDTO dto = service.selectOne(id);
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("dto", dto);
		modelAndView.addObject("req", "account/modifyForm.jsp");
		modelAndView.setViewName("/");

		
		return modelAndView;
	}
	
	// 회원 정보수정
	@RequestMapping(value="/account/modify.do")
	public ModelAndView modify(HttpServletRequest request) throws IOException{
		// 데이터 처리
		request.setCharacterEncoding("UTF-8"); 	// 한글 인코딩 설정
		// 브라우저로부터 전달된 데이터 읽기
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("memId");
		String pass = request.getParameter("pass");
		String tel1 = request.getParameter("tel1");
		String tel2 = request.getParameter("tel2");
		String tel3 = request.getParameter("tel3");
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		String addr3 = request.getParameter("addr3");
		String addr4 = request.getParameter("addr4");
		String email = request.getParameter("email");
		String birth = request.getParameter("birth");
		
		// DB처리
		AccountDTO dto = new AccountDTO();
		dto.setId(id);
		dto.setPass(pass);
		dto.setTel1(tel1);
		dto.setTel2(tel2);
		dto.setTel3(tel3);
		dto.setAddr1(addr1);
		dto.setAddr2(addr2);
		dto.setAddr3(addr3);
		dto.setAddr4(addr4);
		dto.setEmail(email);
		dto.setBirth(birth);
		
		int result = service.modify(dto);
		
		// view 처리
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("req", "modify.jsp");
		modelAndView.addObject("result", result);
		modelAndView.setViewName("/");
		
		return modelAndView;
	}
	
	
	// 회원 탈퇴 확인폼
	@RequestMapping(value="/account/deleteForm.do")
	public ModelAndView deleteForm() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("req", "account/deleteForm.jsp");
		modelAndView.setViewName("/");

		
		return modelAndView;
	}
	
	
	// 회원 탈퇴
	@RequestMapping(value="/account/delete.do")
	public ModelAndView delete(HttpServletRequest request) {
		// 데이터 처리
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("memId");
		
		// DB에서 데이터 삭제
		int result = service.delete(id);
		
		// 세션 삭제
		if(result > 0) {
			session.removeAttribute("memName");
			session.removeAttribute("memId");
		}
		
		// view 처리
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("req", "account/delete.jsp");
		modelAndView.addObject("result", result);
		modelAndView.setViewName("/");
		
		return modelAndView;
	}
}
