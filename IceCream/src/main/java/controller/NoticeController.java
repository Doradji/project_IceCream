package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class NoticeController {
	// select : 개별 조회
	@RequestMapping("/notice/selectOne.do")
	public ModelAndView selectOne() {
		ModelAndView modelAndView = new ModelAndView();
		
		System.out.println("/notice/selectOne.do 들어옴");
		
		modelAndView.addObject("req", "notice/sample.jsp");
		modelAndView.setViewName("/");

		return modelAndView;
	}

	// selectTotal : 게시물 전체 갯수
	@RequestMapping("/notice/selectTotal.do")
	public ModelAndView selectTotal() {
		ModelAndView modelAndView = new ModelAndView();
		
		System.out.println("/notice/selectTotal.do 들어옴");
		
		modelAndView.addObject("req", "notice/sample.jsp");
		modelAndView.setViewName("/");

		return modelAndView;
	}

	// selsectList : 리스트 조회
	@RequestMapping("/notice/selectList.do")
	public ModelAndView selectList() {
		ModelAndView modelAndView = new ModelAndView();
		
		System.out.println("/notice/selsectList.do 들어옴");
		
		modelAndView.addObject("req", "notice/sample.jsp");
		modelAndView.setViewName("/");

		return modelAndView;
	}

	// insert : 게시물 등록
	@RequestMapping("/notice/insert.do")
	public ModelAndView insert() {
		ModelAndView modelAndView = new ModelAndView();
		
		System.out.println("/notice/insert.do 들어옴");
		
		modelAndView.addObject("req", "notice/sample.jsp");
		modelAndView.setViewName("/");

		return modelAndView;
	}

	// modify : 게시물 수정
	@RequestMapping("/notice/modify.do")
	public ModelAndView modify() {
		ModelAndView modelAndView = new ModelAndView();
		
		System.out.println("/notice/modify.do 들어옴");
		
		modelAndView.addObject("req", "notice/sample.jsp");
		modelAndView.setViewName("/");

		return modelAndView;
	}

	// updateHit : 조회수 수정
	@RequestMapping("/notice/updateHit.do")
	public ModelAndView updateHit() {
		ModelAndView modelAndView = new ModelAndView();
		
		System.out.println("/notice/updateHit.do 들어옴");
		
		modelAndView.addObject("req", "notice/sample.jsp");
		modelAndView.setViewName("/");

		return modelAndView;
	}

	// delete : 게시물 삭제
	@RequestMapping("/notice/delete.do")
	public ModelAndView delete() {
		ModelAndView modelAndView = new ModelAndView();
		
		System.out.println("/notice/delete.do 들어옴");
		
		modelAndView.addObject("req", "notice/sample.jsp");
		modelAndView.setViewName("/");

		return modelAndView;
	}
}
