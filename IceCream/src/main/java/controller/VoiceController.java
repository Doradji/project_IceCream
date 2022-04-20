package controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
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
	@RequestMapping(value = "/voice/mailAskResult.do")
	public ModelAndView mailAskResult(HttpServletRequest request) {
		 // 발신자의 메일 주소
	    final String username = request.getParameter("username");
	    
	    // 발신자의 PASSWORD
	    final String password =  request.getParameter("password"); 
	   
	    // 수신자의 메일 주소
	    String recipient = request.getParameter("recipient"); 
	    
	    // 수신자에게 보낼 메일 제목
	    String subject = request.getParameter("subject");
	   
	    // 수신자에게 보낼 메일 내용
	    String contents = request.getParameter("contents");

		// 호스트
		String host = "smtp.naver.com";

		// naver smtp port
		int port=465;

	    // SMTP 서버 설정 정보 세팅
	    Properties props = System.getProperties();

		// 프로토콜 설정
		props.put("mail.transport.protocol", "smtp");
	    // smtp 서버
	    props.put("mail.smtp.host", host);
	    // smtp 포트
		props.put("mail.smtp.port", port);
	    props.put("mail.smtp.auth", "true");

		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", host);



		// 확인용
		System.out.println("userName : " + username);
		System.out.println("password : " + password);
		System.out.println("recipient : " + recipient);
		System.out.println("subject : " + subject);
		System.out.println("contents : " + contents);
	    
	    //Session 생성 & 발신자 smtp 서버 로그인 인증 
	    Session session = Session.getDefaultInstance(props,  new Authenticator() {
	    	protected PasswordAuthentication getPasswordAuthentication() {
	    	return new PasswordAuthentication(username, password);
	    	}
	    });
	    
	    session.setDebug(true); // 디버그 모드 
	    
	    //MimeMessage 생성 & 메일 세팅
	    Message mimeMessage = new MimeMessage(session);

		try {
			mimeMessage.setFrom(new InternetAddress(username)); // 발신자
			mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); // 수신자

			mimeMessage.setSubject(subject); // 제목
			// 단순 텍스트 내용
			//mimeMessage.setText(contents);
			// HTML 내용 전달
			mimeMessage.setContent(contents, "text/html; charset=UTF-8");

			System.out.println(mimeMessage.toString());

			Transport.send(mimeMessage); // 전송
			System.out.println("message sent successfully...");

		} catch (MessagingException e) {
			e.printStackTrace();
		}
		// 뷰처리 및 이동

		ModelAndView modelAndView=new ModelAndView();
		modelAndView.addObject("req","voice/mailAskResult.jsp");
		modelAndView.setViewName("../main.jsp");
		return modelAndView;
	}
	
	
}

