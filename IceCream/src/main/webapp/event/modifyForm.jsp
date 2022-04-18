<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/sample.css">

<!-- summernote 에디터 적용 -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
</head>
<body>
MODIFY - FROM
<form action="modify.do" method="post" enctype="multipart/form-data" id="frm" name="frm">
		<table border="1">
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" value="${dto.title}"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<div id="summernote">${dto.content}</div> 
					<input type="text" hidden id="content" name="content">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="file" name="contentFile" value=${dto.fileName}>
				</td>
			</tr>
			<tr>
				<input type="hidden" id="num" name="num" value="${num}">
				<input type="hidden" id="pg" name="pg" value="${pg}">
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button class="btn btn-primary" onclick="CheckContent()" type="button">수정내용확인</button>
					<button class="btn btn-primary" onclick="testSubmit()" type="button">수정 테스트</button> 
				</td>
			</tr>
		</table>
	</form>
	
	<!-- summernote 에디터 처리 -->
	<script>
		$(document).ready(function() {
			$('#summernote').summernote({
				callbacks : {
					onImageUpload : function(files) {
						for (var i = files.length; i >= 0; i--) {
							uploadSummernoteImageFile(files[i], this);
						}
					}
				}
			});
		});
		
		// 이미지 업로드
		function uploadSummernoteImageFile(file, el) {
			data = new FormData();
			data.append("file", file);
			$.ajax({
				data : data,
				type : "POST",
				url : "/summernoteImageUpload.do",
				contentType : false,
				enctype : 'multipart/form-data',
				processData : false,
				success : function(data) {
					$(el).summernote('editor.insertImage', data.url);
				}
			});
		}

		
		// 게시물 내용 저장
		function testSubmit() {
			let markupStr = $('#summernote').summernote('code');
			let content = $('#content');
			content.attr('value', markupStr);

			let frm = $('#frm');
			frm.submit();
		}

		// 게시물 내용 가져오기
		function CheckContent() {
			let markupStr = $('#summernote').summernote('code');
			alert(markupStr);
		}
	</script>
</body>
</html>