<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

</head>
<body>
<c:if test="${result > 0 }">
	<header class="smallHeader">
	    <h1>회원 정보 수정</h1>
	</header>
	<br>
	<p align="center" style="font-size: 15px;">정상적으로 수정이 완료되었습니다.</p>
	<div align="center">
		<input type="button" value="홈으로" onclick="location.href='../main.do'">
	</div>
</c:if>
<c:if test="${result == 0 }">
	
</c:if>

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top"><i
        class="fas fa-angle-up"></i></a>
<!-- Bootstrap core JS-->
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="script/scripts.js"></script>

</body>
</body>
</html>