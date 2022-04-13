<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function checkIdClose() {
		opener.form.id.value = "${id}";
		window.close();
		opener.form.pass.focus();
	}
	
	function checkId() {
		if(!document.form.id.value) {
			alert("아이디를 입력하세요.");
			document.form.id.focus();
		} else {
			document.form.submit();
		}
	}
</script>
</head>
<body>
<form action="">
	<c:if test="${exist }">
		${id }는 사용 중입니다.<br><br>
		아이디 <input type="text" name="id">
		<input type="button" value="중복체크" onclick="checkId()">
	</c:if>
	<c:if test="${!(exist) }">
		${id }는 사용 가능합니다.<br><br>
		<input type="button" value="사용" onclick="checkIdClose()">
	</c:if>
</form>
</body>
</html>