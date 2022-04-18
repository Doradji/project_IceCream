<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/sample.css">
<script type="text/javascript" src="../script/sendMailScript.js?v=2"></script>
</head>
<body>
<form action="sendMailOk.do" method="post" name="sendMail"
	onsubmit="check(); return false;">
	<table border="1" align="center" style="font-size: 10pt;"
		cellpadding="0" cellspacing="0">
		<tr>
			<td>보내는사람 E-Mail</td>
			<td><input type="text" name="username" size="50" /></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="password" size="50" /></td>
		</tr>
		<tr>
			<td>받는사람 E-Mail</td>
			<td><input type="text" name="recipient" size="50" /></td>
		</tr>
		<tr>
			<td>제목</td>
			<td><input type="text" name="subject" size="50" /></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><input type="text" name="contents" size="50" /></td>
		</tr>
	
	
		
		
	
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="메일 보내기">
				<input type="reset" value="취소">
			</td>
		</tr>
	</table>
</form>
</body>
</html>