<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/sample.css">
<script type="text/javascript">
	window.onload = function() {
		if(confirm("회원 탈퇴하시겠습니까?")) {
			location.href="delete.do";
		} else {
			location.href="../index.do";
		}
	}
</script>
</head>
<body>

</body>
</html>