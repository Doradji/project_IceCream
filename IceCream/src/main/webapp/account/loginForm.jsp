<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Title</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="../assets/favicon.ico"/>
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    <!-- Simple line icons-->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.5.5/css/simple-line-icons.min.css"
          rel="stylesheet"/>
    <!-- Google fonts-->
    <!-- <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css" /> -->
    <link href="https://fonts.googleapis.com/css?family=Do+Hyeon:400" rel="stylesheet">
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="../css/styles.css?v=2" rel="stylesheet"/>
<script type="text/javascript" src="../script/accountCheck.js"></script>
<script type="text/javascript">
	function loginFail() {
		let id = document.getElementById("id");
		let memId = document.getElementById("memId");
		
		if(id.value != memId.value) {
			alert("아이디가 틀렸습니다.")
		}
	}
</script>
</head>
<body>
	<header>
		<h1 class="smallHeader">Login</h1>
	</header>
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
						<input type="button" value="로그인" onclick="loginCheck(), loginFail()">
						<input type="button" value="회원가입" onclick="location.href='writeForm.do'" >
					</td>
				</tr>
			</table>
		</div>	
	</form>
<!-- Bootstrap core JS-->
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="../script/scripts.js"></script>
</body>
</html>