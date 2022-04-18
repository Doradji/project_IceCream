<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLDecoder" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/sample.css">
</head>
<body>
	${id } (${name }) 로그인
	<br>
	<input type="button" value="로그아웃" onclick="location.href='logout.do'"><br>
	<input type="button" value="회원 정보 수정" onclick="location.href='modifyForm.do'"><br>
	<input type="button" value="메인으로" onclick="location.href='../index.do'">
</body>
</html>