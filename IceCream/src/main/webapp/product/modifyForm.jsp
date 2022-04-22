<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/sample.css">

<script type="text/javascript" src="../script/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	window.onload=function(){
		insertSummernote();
		$('#productType').val('${dto.productType}').prop("selected", true);
	}

	//iframe 안의 스마트에디터 작성한 값 가져와서 다른 창에 값 반영
	function iframeContent() {
		let iframe = document.getElementById("iframe");
		iframe.contentWindow.insertContent();
		let value = iframe.contentWindow.document.getElementById("content").value;
		let explain = document.getElementById("explain");
		explain.value = value;
	}
	
	function insertSummernote() {
        let iframe = document.getElementById("iframe");
        iframe.contentWindow.insertSummernote('${dto.explain}');
    }
	

	function inputCheck() {
		let frm = document.getElementById("frm");
		iframeContent();

		if (!frm.name.value) {
			alert("제품명을 입력해주세요!");
			frm.product.focus();
			return;
		} else if (frm.explain.value == '<p><br></p>') {
			alert("제품 상세내용을 입력해주세요!");
			frm.summernote.focus();
			return;
		} else if (frm.productType.value == "") {
			alert("제품 타입을 선택해주세요!");
			return false;
		} else if (!frm.productImg.value) {
			alert("제품 대표 이미지를 입력해주세요!");
			return;
		}

		imgCheck();
	}

	function imgCheck() {
		let frm = document.getElementById("frm");
		let imgFile = document.getElementById("productImg");
		let fileForm = /(.*?)\.(jpg|jpeg|png|gif|bmp|pdf)$/;

		/* if (imgFile.value == "") {
			alert("제품 대표 이미지를 입력해주세요!");
			imgFile.focus();
			return;
		} */

		if (imgFile.value != "" && imgFile.value != null) {
			if (!imgFile.value.match(fileForm)) {
				alert("이미지 파일만 업로드 가능");
				return;
			}
		}

		frm.submit();
	}
</script>
</head>
<body>
	<h1>Product - Modify FORM</h1>
	<form action="modify.do" method="post" enctype="multipart/form-data"
		id="frm" name="frm">
		<table>
			<tr>
				<th>제품명</th>
				<td><input type="text" name="name" value="${dto.name}"></td>
			</tr>
			<tr>
				<th>제품 설명</th>
				<td><iframe style="width: 100%; height: 600px; border: none"
						id="iframe" name="iframe" src="../resources/summernote.html"></iframe>
					<input type="hidden" name="explain" id="explain"></td>
			</tr>
			<tr>
				<th>제품 분류</th>
				<td>${dto.productType } <%-- <select name="productType" id="productType">
						<option value="" disabled>제품타입</option>
						<option <c:if test="${dto.productType eq 'icecream'}">selected</c:if> value="icecream" >
						아이스크림</option>
						<option value="cake" <c:if test="${dto.productType eq 'cake'}">selected</c:if>>케이크</option>
						<option value="coffee" <c:if test="${dto.productType eq 'coffee'}">selected</c:if>>커피</option>
						<option value="beverage" <c:if test="${dto.productType eq 'beverage'}">selected</c:if>>음료</option>
						<option value="dessert" <c:if test="${dto.productType eq 'dessert'}">selected</c:if>>디저트</option>
					</select> --%> 
					<select name="productType" id="productType">
						<option value="" disabled>제품타입</option>
						<option value="icecream">아이스크림</option>
						<option value="cake">케이크</option>
						<option value="coffee">커피</option>
						<option value="beverage">음료</option>
						<option value="dessert">디저트</option>
				</select>
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="file" name="productImg"
					id="productImg" accept="image/*" value="../storage/${dto.fileName}">
				</td>
				<input type="hidden" id="num" name="num" value="${dto.num}">
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