package controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import service.VoiceService;
import voice.dto.VoiceDTO;
@Controller
public class VoiceController {
	@Autowired 
	VoiceService service;
	
	//게시판글등록폼
	@RequestMapping(value="/voice/voiceWriteForm.do")
	public ModelAndView voiceWriteForm() {
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.addObject("req", "voice/voiceWriteForm.jsp");
		modelAndView.setViewName("/");
		return modelAndView;
	}
	//글등록
	@RequestMapping(value="/voice/voiceWrite.do")
	public ModelAndView voiceWrite(HttpServletRequest request,MultipartFile contentFile) {
		System.out.println("tt");
		String filePath= request.getSession().getServletContext().getRealPath("/storage");
		String fileName= contentFile.getOriginalFilename();
		
		System.out.println("filePath");
		System.out.println("fileName");
		File file= new File(filePath, fileName);
	
			try {
				FileCopyUtils.copy(contentFile.getInputStream(), new FileOutputStream(file));
			} catch (FileNotFoundException e1) {
			
				e1.printStackTrace();
			} catch (IOException e) {
			
				e.printStackTrace();
			}
			
		VoiceDTO dto=new VoiceDTO();
		dto.setId(request.getParameter("id"));
		dto.setContent(request.getParameter("content"));
		dto.setTitle(request.getParameter("title"));
		dto.setNum(Integer.parseInt(request.getParameter("num")));
		dto.setFileName(request.getParameter("fileName"));
		
		int result= service.insert(dto);
		
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.addObject("result", result);
		modelAndView.addObject("req","voice/voiceWrite.jsp");
		modelAndView.setViewName("/");
		return modelAndView;
	}
	@RequestMapping("/voice/voiceList.do")
	public ModelAndView voiceList() {
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.addObject("req","voice/voiceList");
		modelAndView.setViewName("/");
		return modelAndView;
	}
}
