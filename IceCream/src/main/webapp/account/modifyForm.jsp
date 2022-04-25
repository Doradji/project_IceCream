<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Title</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="../assets/favicon.ico"/>
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    <!-- Simple line icons-->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.5.5/css/simple-line-icons.min.css"
          rel="stylesheet"/>
    <!-- Google fonts-->
    <!-- <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css" /> -->
    <link href="https://fonts.googleapis.com/css?family=Do+Hyeon:400" rel="stylesheet">
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="../css/styles.css?v=2" rel="stylesheet"/>
<script type="text/javascript" src="../script/accountCheck.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function DaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("roadAddress").value = roadAddr;
                document.getElementById("jibunAddress").value = data.jibunAddress;
            	document.getElementById("detailAddress").focus();// 상세주소 포커스
            }
        }).open();
    }
</script>
<style type="text/css">
	body{
    	background-color: #dee9ff;
	}
	.form{
		padding: 50px 0;
	}

	.form form{
    	background-color: #fff;
    	max-width: 700px;
    	margin: auto;
    	padding: 50px 70px;
    	border-top-left-radius: 30px;
    	border-top-right-radius: 30px;
    	box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.075);
	}
	
	.button{
    	border-radius: 30px;
    	padding: 5px 20px;
    	font-size: 18px;
    	font-weight: bold;
    	background-color: #5791ff;
    	border: none;
    	color: white;
	}
	
	.box {
		border-radius: 20px;
    	margin-bottom: 10px;
    	padding: 10px 20px;
    	border: 1px solid lightgray;
	}
	 .tel {
		border-radius: 20px;
		size: 30px;
		padding: 10px 20px;
		border: 1px solid lightgray;
	}
	
    table{
    	margin: auto;
    	padding: 10px 20px;
        width: 600px;
        border-collapse: collapse;
        border: 1px solid lightgary;
        font-family: Gothic;       
    }
    .table {
    	border-radius : 20px;
    }
    th {
    	border-radius : 20px;
    	border: 1px solid lightgray;
        padding: 5px;
    }
    td{
        border: 1px solid lightgray;
        padding: 5px;
    }
    th.center{
        text-align: center;
        width: 15%;
    }
    td.center{
        text-align: center;
    }
</style>
</head>
<body>
	<header>
		<h1 class="smallHeader">회원 정보 수정</h1>
	</header>
<div class="form">
	<form action="modify.do" method="post" name="form" id="form"
		onsubmit="checkModify(); return false;">
	<div class="table">
		<table>
			<tr>
				<th class="center">아이디</th>
				<td>
					<input class="box" style="width: 100%" type="text" name="id" maxlength="10"
					value="${dto.id }" readonly="readonly">
				</td>
			</tr>
			<tr>
				<th class="center">이름</th>
				<td>
					<input class="box" style="width: 100%" type="text" name="name" value="${dto.name }" readonly="readonly">
				</td>
			</tr>
			<tr>
				<th class="center">비밀번호</th>
				<td>
					<input class="box" style="width: 100%" type="text" name="pass" id="pass" placeholder="* 변경할 비밀번호 입력">
				</td>
			</tr>
			<tr>
				<th class="center">비밀번호 재확인</th>
				<td>
					<input class="box" style="width: 100%" type="text" name="repass" id="repass" placeholder="* 변경할 비밀번호 재확인">
				</td>
			</tr>
			<tr>
				<th class="center">성별</th>
				<td style="height: 20%">
				<c:if test="${dto.gender == '남' }">
					<input class="box" type="radio" name="gender" value="남" checked disabled>남
					<input class="box" type="radio" name="gender" value="여" disabled>여
				</c:if>
				<c:if test="${dto.gender == '여' }">
					<input class="box" type="radio" name="gender" value="남" disabled>남
					<input class="box" type="radio" name="gender" value="여" checked disabled>여
				</c:if>
				</td>
			</tr>
			<tr>
				<th class="center">이메일</th>
				<td>
					<input class="box" style="width: 100%" type="email" name="email"value="${dto.email }" placeholder="* 변경할 이메일 입력">
				</td>
			</tr>
			<tr>
				<th class="center">전화번호</th>
				<td>
					<!-- 입력 수 지정 및 숫자만 입력 가능하도록 정규식 사용 -->
                    <input class="tel" type="text" name="tel1" id="tel1" value="${dto.tel1 }" maxlength="3" style="width: 20%"
                           oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"> -
                    <input class="tel" type="text" name="tel2" id="tel2" value="${dto.tel2 }" maxlength="4" style="width: 20%"
                           oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"> -
                    <input class="tel" type="text" name="tel3" id="tel3" value="${dto.tel3 }" maxlength="4" style="width: 20%"
                           oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
				</td>
			</tr>
			<tr>
				<th class="center">주소</th>
				<td>
					<!-- 우편번호 검색을 위한 주소 api 사용 -->
						<input class="box" type="text" name="addr1" id="postcode" value="${dto.addr1 }" placeholder="우편번호" readonly>
						<input class="box" type="button" onclick="DaumPostcode()" value="우편번호 찾기"><br>
						<input class="box" style="width: 100%" type="text" name="addr2" id="roadAddress" value="${dto.addr2 }" placeholder="도로명주소" readonly>
						<input class="box" style="width: 100%" type="text" name="addr3" id="jibunAddress" value="${dto.addr3 }" placeholder="지번주소" readonly>
						<span id="guide" style="color:#999;display:none"></span>
						<input class="box" style="width: 80%" name="addr4" type="text" id="detailAddress" value="${dto.addr4 }" placeholder="상세주소">
				</td>
			</tr>
			<tr>
				<th class="center">생일</th>
				<td>
					<input class="box" style="width: 100%" type="date" name="birth" value="${dto.birth }">
				</td>
			</tr>
			<tr>
				<td colspan="2" class="center">
					<input class="button" type="submit" value="수정하기">&nbsp;
					<button class="button" type="reset">다시 작성</button>
			
		</table>
	</div>
	</form>
</div>
<!-- Bootstrap core JS-->
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="../script/scripts.js"></script>
</body>
</html>