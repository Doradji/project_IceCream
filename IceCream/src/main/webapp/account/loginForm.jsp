<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../script/accountCheck.js"></script>
<link rel="stylesheet" href="../css/sample.css">
</head>
<body>
	<form action="../account/login.do" name="form" method="post" id="form1">
		<div id="container">
			<table>
				<tr>
					<th>아이디</th>
					<td><input style="width: 80%" type="text" name="id"></td>
				</tr>
				
				<tr>
					<th>비밀번호</th>
					<td><input style="width: 80%" type="password" name="pass"></td>
				</tr>
				
				<tr>
					<td colspan="2">
						<input type="button" value="로그인" onclick="loginCheck()">
						<input type="button" value="회원가입">
					</td>
				</tr>
			</table>
		</div>	
	</form>
</body>
</html>