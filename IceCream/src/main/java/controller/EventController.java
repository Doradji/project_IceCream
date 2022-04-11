package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class EventController {
	// select : 개별 조회
	@RequestMapping("/event/selectOne.do")
	public ModelAndView selectOne() {
		ModelAndView modelAndView = new ModelAndView();
		
		System.out.println("/event/selectOne.do 들어옴");
		
		modelAndView.addObject("req", "event/sample.jsp");
		modelAndView.setViewName("/");

		return modelAndView;
	}
	
	// selectTotal : 게시물 전체 갯수
	@RequestMapping("/event/selectTotal.do")
	public ModelAndView selectTotal() {
		ModelAndView modelAndView = new ModelAndView();
		
		System.out.println("/event/selectTotal.do 들어옴");
		
		modelAndView.addObject("req", "event/sample.jsp");
		modelAndView.setViewName("/");

		return modelAndView;
	}
	
	// selsectList : 리스트 조회
	@RequestMapping("/event/selectList.do")
	public ModelAndView selectList() {
		ModelAndView modelAndView = new ModelAndView();
		
		System.out.println("/event/selectList.do 들어옴");
		
		modelAndView.addObject("req", "event/sample.jsp");
		modelAndView.setViewName("/");

		return modelAndView;
	}
	
	// insert : 게시물 등록
	@RequestMapping("/event/insert.do")
	public ModelAndView insert() {
		ModelAndView modelAndView = new ModelAndView();
		
		System.out.println("/event/insert.do 들어옴");
		
		modelAndView.addObject("req", "event/sample.jsp");
		modelAndView.setViewName("/");

		return modelAndView;
	}
	
	// modify : 게시물 수정
	@RequestMapping("/event/modify.do")
	public ModelAndView modify() {
		ModelAndView modelAndView = new ModelAndView();
		
		System.out.println("/event/modify.do 들어옴");
		
		modelAndView.addObject("req", "event/sample.jsp");
		modelAndView.setViewName("/");

		return modelAndView;
	}
	
	// updateHit : 조회수 수정
	@RequestMapping("/event/updateHit.do")
	public ModelAndView updateHit() {
		ModelAndView modelAndView = new ModelAndView();
		
		System.out.println("/event/updateHit.do 들어옴");
		
		modelAndView.addObject("req", "event/sample.jsp");
		modelAndView.setViewName("/");

		return modelAndView;
	}
	
	// delete : 게시물 삭제
	@RequestMapping("/event/delete.do")
	public ModelAndView delete() {
		ModelAndView modelAndView = new ModelAndView();
		
		System.out.println("/event/delete.do 들어옴");
		
		modelAndView.addObject("req", "event/sample.jsp");
		modelAndView.setViewName("/");

		return modelAndView;
	}
}
