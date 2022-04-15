package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
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

	@RequestMapping(value = "/sample/sendMail.do")
	public ModelAndView sendMail() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/");
		modelAndView.addObject("req", "sample/sendMail.jsp");

		return modelAndView;
	}

	@RequestMapping(value = "/sample/sendMailOk.do")
	public ModelAndView sendMailOk(HttpServletRequest request) {
		// 데이터 처리
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String cp = request.getContextPath();// 웹애플리케이션에 속한 주소를 컨텍스패스로반환
		// sendMail페이지에서 보낸 5개의 데이터 받아야 함
		String senderName = request.getParameter("senderName");// 보낸사람이름
		String senderEmail = request.getParameter("senderEmail");// 보내는사람 E-Mail
		String receiverEmail = request.getParameter("receiverEmail");// 받는사람 E-Mai
		String subject = request.getParameter("subject"); // 제목
		String content = request.getParameter("content"); // 내용

		String host = "localhost"; // 192.168.16.16

		// 1.javax.mail.Session 클래스의 인스턴스를 구한다.
		Properties prop = System.getProperties(); // 시스템의 환경설정
		Session ssn = Session.getInstance(prop, null);// 환경설정 세션 생성 (시스템의 정보를 읽어와서 세션을 생성)
		try {
			// 2.javax.mail.Message 클래스를 사용하여 전송하고자 하는 메일 메시지를 작성
			MimeMessage message = new MimeMessage(ssn);// MimeMessage는 실제 메일내용을 담음
			// message객체에 메일속성 설정
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(receiverEmail));// 수신인 설정

			message.setFrom(new InternetAddress(senderEmail, senderName, "UTF-8"));// 발신인 설정

			message.setSubject(subject, "UTF-8");// 제목 설정
			message.setContent(content, "text/plain;charset=UTF-8");// 내용 설정
			// 메일 전송
			// 3.javax.mail.Transport 클래스를 사용하여 작성한 메일을 전송
			Transport tp = ssn.getTransport("smtp");// 보낼때 사용하는 프로토콜
			tp.connect(host, "", "");// ip, id, pw 가상으로 진행하므로 id, pw 생략
			tp.sendMessage(message, message.getAllRecipients());
			tp.close();
			// out.print("메일 전송 완료!!");
		} catch (Exception e) {

		}
		// 뷰처리 및 데이터 공유
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("cp", cp);
		modelAndView.addObject("senderName", senderName);
		modelAndView.addObject("senderEmail", senderEmail);
		modelAndView.addObject("receiverEmail", receiverEmail);
		modelAndView.addObject("subject", subject);
		modelAndView.addObject("content", content);
		modelAndView.addObject("host", host);

		modelAndView.addObject("req", "sample/sendMailOk.jsp");
		modelAndView.setViewName("/");

		return modelAndView;
	}

}
