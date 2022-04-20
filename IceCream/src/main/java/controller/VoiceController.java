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

import service.VoiceService;
import voice.dto.VoiceDTO;

@Controller
public class VoiceController {
    @Autowired
    VoiceService service;

    // 게시글 등록 폼
    @RequestMapping(value = "/voice/writeForm.do")
    public ModelAndView voiceWriteFormDefault(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("req", "voice/writeForm.jsp");
        modelAndView.setViewName("../main.jsp");

        return modelAndView;
    }

    // 답글 등록 폼
    @RequestMapping(value = "/voice/writeFormReply.do")
    public ModelAndView voiceReplyWriteForm() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("req", "voice/replyWriteForm.jsp");
        modelAndView.setViewName("../main.jsp");
        return modelAndView;
    }

    //글등록
    @RequestMapping(value = "/voice/write.do")
    // MultipartFile의 파라미터 명은 전달될 파라미터명과 동일
    public ModelAndView voiceWrite(HttpServletRequest request, MultipartFile contentFile) {
        VoiceDTO dto = new VoiceDTO();

        if(contentFile != null) {
            // 저장 폴더 지정
            String filePath = request.getSession().getServletContext().getRealPath("/upload");
            // 저장할 파일 이름
            String fileName = contentFile.getOriginalFilename();

            System.out.println("--------- 파일 업로드 테스트 ---------");
            System.out.println("filePath : " + filePath);
            System.out.println("fileName : " + fileName);

            File file = new File(filePath, fileName);
            try {
                FileCopyUtils.copy(contentFile.getInputStream(), new FileOutputStream(file));
                System.out.println("파일 저장 성공");
            } catch (FileNotFoundException e1) {
                e1.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
            dto.setFileName(fileName);
        }


        dto.setId(request.getParameter("id"));
        dto.setContent(request.getParameter("content"));
        dto.setTitle(request.getParameter("title"));

        int result = service.insert(dto);

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("result", result);
        modelAndView.addObject("req", "voice/write.jsp");
        modelAndView.setViewName("../main.jsp");
        return modelAndView;
    }

    // 답글 등록
    @RequestMapping(value = "/voice/replyWrite.do")
    // MultipartFile의 파라미터 명은 전달될 파라미터명과 동일
    public ModelAndView voiceWriteReply(HttpServletRequest request, MultipartFile contentFile) {
        VoiceDTO dto = new VoiceDTO();

        if(contentFile != null) {
            // 저장 폴더 지정
            String filePath = request.getSession().getServletContext().getRealPath("/upload");
            // 저장할 파일 이름
            String fileName = contentFile.getOriginalFilename();

            System.out.println("--------- 파일 업로드 테스트 ---------");
            System.out.println("filePath : " + filePath);
            System.out.println("fileName : " + fileName);

            File file = new File(filePath, fileName);
            try {
                FileCopyUtils.copy(contentFile.getInputStream(), new FileOutputStream(file));
                System.out.println("파일 저장 성공");
            } catch (FileNotFoundException e1) {
                e1.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
            dto.setFileName(fileName);
        }


        dto.setId(request.getParameter("id"));
        dto.setContent(request.getParameter("content"));
        dto.setTitle(request.getParameter("title"));

        int result = service.insertComment(dto);

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("result", result);
        modelAndView.addObject("req", "voice/write.jsp");
        modelAndView.setViewName("../main.jsp");
        return modelAndView;
    }

    @RequestMapping(value = "/voice/voiceList.do")
    public ModelAndView voiceList(HttpServletRequest request) {

        int pg = 1;
        if (request.getParameter("pg") != null) {
            pg = Integer.parseInt(request.getParameter("pg"));
        }

        int totalA = service.selectTotal();    //총 회원수
        int totalP = (totalA + 4) / 5;        //총 페이지수

        if (pg > totalP) {
            pg = totalP;
        }
        //목록 보기:1페이지당 5명씩 보이기
        int endNum = pg * 5;
        int startNum = endNum - 4;

        int startPage = (pg - 1) / 3 * 3 + 1;
        int endPage = startPage + 2;
        if (endPage > totalP) {
            endPage = totalP;
        }

        List<VoiceDTO> list = service.selectList(startNum, endNum);

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("pg", pg);
        modelAndView.addObject("list", list);
        modelAndView.addObject("startPage", startPage);
        modelAndView.addObject("totalP", totalP);
        modelAndView.addObject("req", "voice/voiceList.jsp");
        modelAndView.setViewName("/");
        return modelAndView;
    }

	@RequestMapping(value = "/voice/mailAsk.do")
	public ModelAndView mailAsk() {
		ModelAndView modelAndView =new ModelAndView();
		modelAndView.addObject("req","voice/mailAsk.jsp");
		modelAndView.setViewName("../main.jsp");
		
		return modelAndView;
		
	}
	
	
}

