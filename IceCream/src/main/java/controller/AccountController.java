package controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

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
	public ModelAndView login() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("req", "account/login.jsp");
		modelAndView.setViewName("/");
		
		return modelAndView;
	}
	// loginOk
	@RequestMapping(value="/account/loginOk.do")
	public ModelAndView loginOk() {

		ModelAndView modelAndView = new ModelAndView();

		modelAndView.addObject("req", "account/login.jsp");
		modelAndView.setViewName("/");
		
		return modelAndView;
	}
	
	// loginFail
	@RequestMapping(value="/account/loginFail.do")
	public ModelAndView loginFail() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("req", "account/login.jsp");
		modelAndView.setViewName("/");
		
		return modelAndView;
	}
	
	// logout
	@RequestMapping(value="/account/logout.do")
	public ModelAndView logout() {
	
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("req", "account/login.jsp");
		modelAndView.setViewName("/");
		
		return modelAndView;
	}
	

	
	// checkId
	@RequestMapping(value="/account/checkId.do")
	public ModelAndView checkId(HttpServletRequest request) {
		// 데이터 처리
		String id = request.getParameter("id");
		
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
		String tel = tel1 + "-" + tel2 + "-" + tel3;
		// DB 처리
		AccountDTO dto = new AccountDTO();
		dto.setId(id);
		dto.setPass(pass);
		dto.setName(name);
		dto.setGender(gender);
		dto.setTel(tel);
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
	public ModelAndView modifyForm() {

		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("req", "account/login.jsp");
		modelAndView.setViewName("/");

		
		return modelAndView;
	}
	
	// 회원 정보수정
	@RequestMapping(value="/account/modify.do")
	public ModelAndView modify() {

		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("req", "account/login.jsp");
		modelAndView.setViewName("/");

		
		return modelAndView;
	}
	
	
	// 회원 탈퇴 입력폼
	@RequestMapping(value="/account/deleteForm.do")
	public ModelAndView deleteForm() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("req", "account/login.jsp");
		modelAndView.setViewName("/");

		
		return modelAndView;
	}
	
	
	// 회원 탈퇴
	@RequestMapping(value="/account/delete.do")
	public ModelAndView delete() {

		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("req", "account/login.jsp");
		modelAndView.setViewName("/");

		
		return modelAndView;
	}
}
