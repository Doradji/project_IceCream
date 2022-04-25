<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <style type="text/css">
    	h2 {
    		font-size: 30px;
    		font-style: Gulim;
    	}
    	h3 {
    		font-size: 23px;
    		font-style: Gulim; 
    	}
    </style>
</head>
<body>
<c:if test="${result > 0}">
	<header class="smallHeader">
    	<h1>Sign Up</h1>
	</header>
	<br>
	<h2 align="center">${memId}님</h2>
	<h3 align="center">춘스킨라빈스 회원으로 가입해주셔서 감사합니다. </h3>
	<h3 align="center">춘스킨라빈스의 다양한 메뉴를 구경하러 가보실까요?</h3>	
	<br>
	<div align="center">
	<input type="button" value="보러가기" onclick="location.href='/product/productList.do'">
	</div> 
</c:if>
<c:if test="${result == 0}">
	<header class="smallHeader">
    	<h1>Sign Up</h1>
	</header>
	<br>
	<h2 align="center">회원가입이 정상적으로 진행되지 않습니다.</h2>
	<h2 align="center">다시 회원가입 부탁드립니다.</h2>
	<br>
	<div align="center">
	<input type="button" value="회원가입" onclick="location.href='writeForm.do'">
	</div> 
</c:if>

<!-- Bootstrap core JS-->
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="../script/scripts.js"></script>
</body>
</html>