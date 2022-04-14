<%--
  Created by IntelliJ IDEA.
  User: Giteak_Dell5510
  Date: 2022-04-11
  Time: 오전 11:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>sample</title>
<link rel="stylesheet" href="../css/sample.css">

<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
</head>
<body>
	Notice Sample 페이지

	<!-- summernote  form-->
	<form method="post" name="form" id="frm" action="write.do">
		<div id="summernote"></div>
		<button class="btn btn-primary" onclick="CheckContent()" type="button">작성내용확인</button>
		<button class="btn btn-primary" onclick="testSubmit()" type="button">저장 테스트</button>
		<input type="text" hidden id="content" name="content">
	</form>

	<script>
		$(document).ready(function() {
			/* $('#summernote').summernote(); */
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

		// 게시물 내용 가져오기
		function CheckContent() {
			let markupStr = $('#summernote').summernote('code');
			alert(markupStr);
		}

		// 게시물 내용 저장
		function testSubmit() {
			let markupStr = $('#summernote').summernote('code');
			let content = $('#content');
			content.attr('value', markupStr);

			let frm = $('#frm');
			frm.submit();
		}

		// 이미지 업로드
		function uploadSummernoteImageFile(file, el) {
			data = new FormData();
			data.append("file", file);
			$.ajax({
				data : data,
				type : "POST",
				url : "/summernote.do",
				contentType : false,
				enctype : 'multipart/form-data',
				processData : false,
				success : function(data) {
					$(el).summernote('editor.insertImage', data.url);
				}
			});
		}
	</script>
</body>
</html>
