<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/sample.css">
<script type="text/javascript">
//iframe 안의 스마트에디터 작성한 값 가져와서 다른 창에 값 반영
function iframeContent() {
	let iframe = document.getElementById("iframe");
	iframe.contentWindow.insertContent();
	let value = iframe.contentWindow.document.getElementById("content").value;
	let explain = document.getElementById("explain");
	explain.value = value;
}

function inputCheck(){
	let frm = document.getElementById("frm");
	iframeContent();
	
	if(!frm.name.value){
		alert("제품명을 입력해주세요!");
		frm.product.focus();
		return;
	}else if(frm.explain.value == '<p><br></p>'){
		alert("제품 상세내용을 입력해주세요!");
		frm.summernote.focus();
		return;
	}else if(frm.productType.value == ""){
		alert("제품 타입을 선택해주세요!");
		return false;
	}else if(!frm.productImg.value){
		alert("제품 대표 이미지를 입력해주세요!");
		return;
	}
	
	imgCheck();
}

function imgCheck(){
	let frm = document.getElementById("frm");
	let imgFile = document.getElementById("productImg");
	let fileForm = /(.*?)\.(jpg|jpeg|png|gif|bmp|pdf)$/;
	
	if(imgFile.value == ""){
		alert("제품 대표 이미지를 입력해주세요!");
		imgFile.focus();
		return;
	}
	
	if(imgFile.value != "" && imgFile.value != null){
		if(!imgFile.value.match(fileForm)){
			alert("이미지 파일만 업로드 가능");
			return;
		}
	}
	
	frm.submit();
}

</script>
</head>
<body>
	<h1>Notice - WRITE FORM</h1>
	<form action="insert.do" method="post" enctype="multipart/form-data" id="frm" name="frm">
		<table>
			<tr>
				<th>제품명</th>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<th>제품 설명</th>
				<td>
					<iframe style="width: 100%; height: 600px; border: none" 
						id="iframe" name="iframe" src="../resources/summernote.html">
					</iframe>
					<input type="hidden" name="explain" id="explain">
				</td>
			</tr>
			<tr>
				<th>제품 분류</th>
				<td>
					<select name="productType" id="productType">
						<option value="" disabled selected>제품타입</option>
						<option value="icecream">아이스크림</option>
						<option value="cake">케이크</option>
						<option value="coffee">커피</option>
						<option value="beverage">음료</option>
						<option value="dessert">디저트</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="file" name="productImg" id="productImg" accept="image/*">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button onclick="inputCheck()" type="button">저장</button>
					<button onclick="back()" type="button">취소</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>