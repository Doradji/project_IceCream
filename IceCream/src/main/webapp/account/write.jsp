<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/sample.css">
</head>
<body>
<c:if test="${result > 0}">
	<img src="../resources/hamster.png" width="800px">
</c:if>
<c:if test="${result == 0}">
	<img src="../resources/hamster2.png" width="800px">
</c:if>
</body>
</html>