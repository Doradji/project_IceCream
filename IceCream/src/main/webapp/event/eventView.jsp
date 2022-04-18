<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/sample.css">
<script type="text/javascript">
		function deleteView(num){
			console.log("삭제 가자");
			location.href="/event/delete.do"+"?num="+num+"&pg="+${pg};
		}
		
		function modifyView(num){
			console.log("수정 가자");
			location.href="/event/modifyForm.do"+"?num="+num+"&pg="+${pg};
		}
</script>
</head>
<body>
<h1>NOTICE-VIEW</h1>
	<table border="1">
		<tr>
			<td>번호 : ${dto.num}</td>
			<td>제목 : ${dto.title}</td>
			<td>내용 : ${dto.content}</td>
			<td>조회수 : ${dto.hit}</td>
			<td>작성일 : ${dto.logTime}</td>
			<td>첨부파일 : ${dto.fileName}</td>
		</tr>
	</table>
	
	<input type="button" value="수정" onclick="modifyView(${dto.num})">
	<input type="button" value="삭제" onclick="deleteView(${dto.num})">
</body>
</html>