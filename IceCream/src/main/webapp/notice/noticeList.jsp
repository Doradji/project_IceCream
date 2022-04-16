<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/sample.css">
<script type="text/javascript" src="../script/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	window.onload = function(){
		console.log("도니?");
		
		if(${result} > 0){
			console.log("ajax 성공");
			location.href = "/notice/selectList.do";
			return;
		}
		
	}
</script>
</head>
<body>
	<h1>NOTICE - LIST</h1>
	디비처리 결과 :${result}

	<div>
		<table>
			<tr>
				<th>NUM</th>
				<th>TITLE</th>
				<th>CONTENT</th>
				<th>HIT</th>
				<th>FILENAME</th>
			</tr>
			<c:forEach var="dto" items="${list}">
				<tr>
					<td>${dto.num}</td>
					<td>${dto.title}</td>
					<td>${dto.content}</td>
					<td>${dto.hit}</td>
					<td>${dto.logTime}</td>
					<td>${dto.fileName}</td>
				</tr>
			</c:forEach>
		</table>
	</div>



</body>
</html>