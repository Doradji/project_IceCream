package controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import event.dto.EventDTO;
import service.EventService;

@Controller
public class EventController {
	@Autowired
	private EventService eventService;

	// writeForm 이동
	@RequestMapping("/event/writeForm.do")
	public ModelAndView writeForm() {
		System.out.println("******** controller - /event/writeForm.do ******************");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("req", "event/writeForm.jsp");
		modelAndView.setViewName("/");
		return modelAndView;
	}

	// insert : 게시물 등록
	@RequestMapping("/event/insert.do")
	public ModelAndView insert(HttpServletRequest request, MultipartFile contentFile) {
		System.out.println("******** controller - /event/insert.do ******************");
		// 파일 가져오기
		String filePath = request.getSession().getServletContext().getRealPath("/storage");
		String fileName = contentFile.getOriginalFilename();

		System.out.println("파일경로(filePath) ===" + filePath);
		System.out.println("파일명(fileName) === " + fileName);

		// 저장할 폴더
		File file = new File(filePath, fileName);

		try {
			FileCopyUtils.copy(contentFile.getInputStream(), new FileOutputStream(file));
		} catch (FileNotFoundException e1) {
			e1.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		EventDTO dto = new EventDTO();
		dto.setTitle(request.getParameter("title"));
		dto.setContent(request.getParameter("content"));
		dto.setFileName(fileName);

		int result = eventService.insert(dto);
		System.out.println("service 결과:" + result);

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("result", result);
		modelAndView.addObject("req", "event/eventList.jsp");
		modelAndView.setViewName("/");
		return modelAndView;
	}

	// select : 개별 조회
	@RequestMapping("/event/selectOne.do")
	public ModelAndView selectOne(HttpServletRequest request) {
		System.out.println("****Controller******* = /event/selectOne.do 들어옴");
		int num = Integer.parseInt(request.getParameter("num"));
		int pg = Integer.parseInt(request.getParameter("pg"));

		eventService.updateHit(num);
		EventDTO dto = eventService.selectOne(num);

		System.out.println("*****************" + dto.getFileName());

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("dto", dto);
		modelAndView.addObject("num", num);
		modelAndView.addObject("pg", pg);
		modelAndView.addObject("req", "event/eventView.jsp");
		modelAndView.setViewName("/");

		return modelAndView;
	}

	// selsectList : 리스트 조회
	@RequestMapping("/event/selectList.do")
	public ModelAndView selectList(HttpServletRequest request) {
		System.out.println("****Controller******* = /event/selectList.do 들어옴");

		int pg = 1;
		if (request.getParameter("pg") != null) {
			pg = Integer.parseInt(request.getParameter("pg"));
		}

		/* 페이징 처리 */
		int totalA = eventService.selectTotal();

		System.out.println("totalA ====" + totalA);

		int totalP = (totalA + 4) / 5;
		if (pg > totalP) {
			pg = totalP;
		}

		/* 목록 보기 */
		int endNum = pg * 5;
		int startNum = endNum - 4;

		List<EventDTO> list = eventService.selectList(startNum, endNum);

		System.out.println(list);

		/* 블럭 처리 */
		int startPage = (pg - 1) / 3 * 3 + 1;
		int endPage = startPage + 2;
		if (endPage > totalP) {
			endPage = totalP;
		}

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("pg", pg);
		modelAndView.addObject("list", list);
		modelAndView.addObject("startPage", startPage);
		modelAndView.addObject("endPage", endPage);
		modelAndView.addObject("totalP", totalP);
		modelAndView.addObject("req", "event/eventList.jsp");
		modelAndView.setViewName("/");

		return modelAndView;
	}

	@RequestMapping("/event/modifyForm.do")
	public ModelAndView modifyForm(HttpServletRequest request) {
		System.out.println("****Controller******* = /event/modifyForm.do 들어옴");

		int num = Integer.parseInt(request.getParameter("num"));
		int pg = Integer.parseInt(request.getParameter("pg"));

		EventDTO dto = eventService.selectOne(num);

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("num", num);
		modelAndView.addObject("pg", pg);
		modelAndView.addObject("dto", dto);
		modelAndView.addObject("req", "event/modifyForm.jsp");
		modelAndView.setViewName("/");

		return modelAndView;
	}

	// modify : 게시물 수정
	@RequestMapping("/event/modify.do")
	public ModelAndView modify(HttpServletRequest request) throws IOException {
		System.out.println("****Controller******* = /event/modify.do 들어옴");

		int num = Integer.parseInt(request.getParameter("num"));
		int pg = Integer.parseInt(request.getParameter("pg"));

		EventDTO dto = new EventDTO();
		dto.setNum(num);
		dto.setTitle(request.getParameter("title"));
		dto.setContent(request.getParameter("content"));
		dto.setFileName(request.getParameter("fileName"));

		int result = eventService.modify(dto);

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("num", num);
		modelAndView.addObject("pg", pg);
		modelAndView.addObject("result", result);
		modelAndView.addObject("req", "event/eventList.jsp");
		modelAndView.setViewName("/");

		return modelAndView;
	}

	// delete : 게시물 삭제
	@RequestMapping("/event/delete.do")
	public ModelAndView delete(HttpServletRequest request) {
		System.out.println("****Controller******* = /event/delete.do 들어옴");
		
		int num = Integer.parseInt(request.getParameter("num"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		int result = eventService.delete(num);
		
		System.out.println("삭제 결과 :::" + result);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("result", result);
		modelAndView.addObject("pg", pg);
		modelAndView.addObject("req", "event/eventList.jsp");
		modelAndView.setViewName("/");

		return modelAndView;
	}
}
