<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="../css/sample.css">
 <script type="text/javascript" src="../script/voiceCheck.js?v=3"></script>
</head>
<body>
	<div>
		<form action="voiceWrite.do" method="post" enctype="multipart/form-data" id="frm" name="form">
			<h2>게시판글등록</h2>
				<table>
					<tr>
						<th>작성자</th>
						<td><input type="text" name="id" size=""></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><input type="text" name="content" size=""></td>
					</tr>
					<tr>
						<th>제목</th>
						<td><input type="text" name="title" size=""></td>
					</tr>
					<tr>
						<th>글번호</th>
						<td><input type="text" name="num" size=""></td>
					</tr>
					<tr>
						
						<td colspan="2"><input type="file" name="fileName" size=""></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type="button" value="등록" onclick="voiceCheck()">
							<input type="button" value="다시쓰기">
						</td>
					</tr>
					
					
				</table>
		</form>
	</div>
</body>
</html>