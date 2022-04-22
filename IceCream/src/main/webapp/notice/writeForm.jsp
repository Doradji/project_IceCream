<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/sample.css">

<!-- <script type="text/javascript" src="../script/noticeCheck.js?v=1"></script> -->
<script type="text/javascript">
	// iframe 안의 스마트에디터 작성한 값 가져와서 다른 창에 값 반영
	function iframeContent() {
		let iframe = document.getElementById("iframe");
		iframe.contentWindow.insertContent();
		let value = iframe.contentWindow.document.getElementById("content").value;
		let content = document.getElementById("content");
		content.value = value;
	}
	
	function inputCheck() {
		let frm = document.getElementById("frm");
		iframeContent();

		if (!frm.title.value) {
			alert("제목을 입력해주세요!");
			frm.title.focus();
		} else if (frm.content.value == '<p><br></p>') {
			alert("내용을 입력해주세요!");
			frm.summernote.focus();
		} else {
			frm.submit();
		}
	}

	function back() {
		if (confirm("정말 취소하겠습니까?")) {
			history.back();
		}
	}
</script>
</head>
<body>
	<h1>Notice - WRITE FORM</h1>
	<form action="insert.do" method="post" enctype="multipart/form-data" id="frm" name="frm">
		<table border="1">
			<tr>
				<th>제목</th>
				<td><input type="text" name="title"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<iframe style="width: 100%; height: 600px; border: none" 
						id="iframe" name="iframe" src="../resources/summernote.html">
					</iframe>
					<input type="hidden" name="content" id="content">
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="file" name="contentFile"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<!-- <button class="btn btn-primary" onclick="CheckContent()" type="button">작성내용확인</button> -->
					<button class="btn btn-primary" onclick="inputCheck()" type="button">저장</button>
					<button class="btn btn-primary" onclick="back()" type="button">취소</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>