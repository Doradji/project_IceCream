<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="../assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
<!-- Simple line icons-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.5.5/css/simple-line-icons.min.css" rel="stylesheet" />
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon:400" rel="stylesheet">
<!-- bootstrap css -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../css/styles.css?v=2" rel="stylesheet" />

<script type="text/javascript">
		function deleteView(num){
			console.log("삭제 가자");
			location.href="/notice/delete.do"+"?num="+num+"&pg="+${pg};
		}
		
		function modifyView(num){
			console.log("수정 가자");
			location.href="/notice/modifyForm.do"+"?num="+num+"&pg="+${pg};
		}
</script>

</head>
<body>
	<header class="smallHeader">
		<h1>Notice View</h1>
	</header>
	<div class="jumbotron" style="background-color: #ffffff;">
		<h1 class="display-4">${dto.title}</h1><br>
		<p class="lead">${dto.logTime}</p>
		<p class="lead">조회수 : ${dto.hit}</p>
		<hr class="my-4">
		<p>${dto.content}</p>
		<hr class="my-4">
		<a href="../storage/${dto.fileName}" download>${dto.fileName}</a><br><br>
		
		<c:if test="${memType == 1}">
			<a class="btn btn-primary btn-lg" role="button" onclick="modifyView(${dto.num})">수정</a>
			<a class="btn btn-primary btn-lg" role="button" onclick="deleteView(${dto.num})">삭제</a>
		</c:if>
	</div>


	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="../script/scripts.js"></script>
</body>
</html>