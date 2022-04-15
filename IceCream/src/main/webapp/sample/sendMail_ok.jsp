<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.util.Properties"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();
//sendMail페이지에서 보낸 5개의 데이터 받아야 함
String senderName = request.getParameter("senderName");//	보낸사람이름
String senderEmail = request.getParameter("senderEmail");// 보내는사람 E-Mail
String receiverEmail = request.getParameter("receiverEmail");//받는사람 E-Mai
String subject = request.getParameter("subject"); //제목
String content = request.getParameter("content"); //내용

String host = "localhost"; //192.168.16.16  

//1.javax.mail.Session 클래스의 인스턴스를 구한다. 	
Properties prop = System.getProperties(); //시스템의 환경설정 	
Session ssn = Session.getInstance(prop, null);//환경설정 세션 생성 (시스템의 정보를 읽어와서 세션을 생성) 	 	
try {
	//2.javax.mail.Message 클래스를 사용하여 전송하고자 하는 메일 메시지를 작성 		
	MimeMessage message = new MimeMessage(ssn);//MimeMessage는 실제 메일내용을 담음 		 		
	//message객체에 메일속성 설정 		
	message.addRecipient(Message.RecipientType.TO, new 
			InternetAddress(receiverEmail));//수신인 설정 
			
	message.setFrom(new InternetAddress(senderEmail, senderName, "UTF-8"));//발신인 설정
	 		
	message.setSubject(subject, "UTF-8");//제목 설정 		
	message.setContent(content, "text/plain;charset=UTF-8");//내용 설정 		 		
	//메일 전송 		
	//3.javax.mail.Transport 클래스를 사용하여 작성한 메일을 전송 		
	Transport tp = ssn.getTransport("smtp");//보낼때 사용하는 프로토콜 		
	tp.connect(host, "", "");//ip, id, pw 가상으로 진행하므로 id, pw 생략 		
	tp.sendMessage(message, message.getAllRecipients());
	tp.close();
	out.print("메일 전송 완료!!");
} catch (Exception e) {

}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta charset="UTF-8">
<title>확인페이지</title>
</head>
<body>

</body>
</html>