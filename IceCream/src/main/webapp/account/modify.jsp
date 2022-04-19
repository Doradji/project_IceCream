<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/sample.css">
<script type="text/javascript">
	// 브라우저가 모든 태그를 인식한 다음, onload 이벤트가 동작됨
	window.onload = function() {
		if(${result > 0}) {
			alert("회원 정보를 수정하였습니다.");
		} else {
			alert("회원 정보를 수정하지 못했습니다.");
		}
		location.href = "../account/loginOk.do";
	}
</script>
</head>
<body>

</body>
</html>