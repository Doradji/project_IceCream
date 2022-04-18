package controller;

import jakarta.mail.*;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.util.Properties;

@Controller
public class SampleController {
	@RequestMapping("/sample/sample.do")
	public ModelAndView sampleWriteForm() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("req", "sample/sample.jsp");
		modelAndView.setViewName("/");

		return modelAndView;
	}

	@RequestMapping(value = "/sample/sampleMapDefault.do")
	public ModelAndView sampleMapDefault() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("req", "sample/mapDefault.jsp");
		modelAndView.setViewName("/");

		return modelAndView;
	}

	@RequestMapping(value = "/sample/sampleMapMarker.do")
	public ModelAndView sampleMapMarker() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("req", "sample/mapMarker.jsp");
		modelAndView.setViewName("/");

		return modelAndView;
	}

	@RequestMapping(value = "/sample/sampleAddress.do")
	public ModelAndView sampleAddress() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("req", "sample/address.jsp");
		modelAndView.setViewName("/");

		return modelAndView;
	}

	@RequestMapping(value = "/sample/sampleSmartEditor.do")
	public ModelAndView sampleSmartEditor() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("req", "sample/sampleWriteForm.jsp");
		modelAndView.setViewName("/");

		return modelAndView;
	}

	@RequestMapping(value = "/sample/writeResultDefault.do")
	public ModelAndView sampleSmartEditorDefault(HttpServletRequest request) {
		// 데이터 처리
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String ir1 = request.getParameter("ir1");

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("req", "sample/writeResult.jsp");
		modelAndView.addObject("ir1", ir1);
		modelAndView.setViewName("/");

		return modelAndView;
	}
	

	@RequestMapping(value = "/sample/sendMailOk.do")
	public ModelAndView sendMail(HttpServletRequest request) {

	    
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
		modelAndView.addObject("req","sample/sendMailOk.jsp");
		modelAndView.setViewName("/");
		return modelAndView;
	}
	

	@RequestMapping(value = "/sample/sendMail.do")
	public ModelAndView sendMail() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/");
		modelAndView.addObject("req", "sample/sendMail.jsp");

		return modelAndView;
	}

	

}
