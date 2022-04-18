<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../script/accountCheck.js"></script>
<style type="text/css">
    table{
    	margin: auto;
        width: 500px;
        border-collapse: collapse;
        border: 1px solid black;
        font-family: Gothic;
    }
    th {
    	border: 1px solid black;
        padding: 5px;
    }
    td{
        border: 1px solid black;
        padding: 5px;
    }
    th.center{
        text-align: center;
    }
    td.center{
        text-align: center;
    }
</style>
</head>
<body>
	<form action="modify.do" method="post" name="form" id="form"
		onsubmit="checkModify(); return false;">
		<table>
			<tr>
				<th class="center">아이디</th>
				<td>
					<input type="text" name="id" maxlength="10"
					value="${dto.id }" readonly="readonly">
				</td>
			</tr>
			<tr>
				<th class="center">이름</th>
				<td>
					<input type="text" name="name" value="${dto.name }" readonly="readonly">
				</td>
			</tr>
			<tr>
				<th class="center">비밀번호</th>
				<td>
					<input type="text" name="pass" id="pass" placeholder="* 변경할 비밀번호 입력">
				</td>
			</tr>
			<tr>
				<th class="center">비밀번호 재확인</th>
				<td>
					<input type="text" name="repass" id="repass" placeholder="* 변경할 비밀번호 재확인">
				</td>
			</tr>
			<tr>
				<th class="center">성별</th>
				<td>
				<c:if test="${dto.gender == '남' }">
					<input type="radio" name="gender" value="남" checked disabled>남
					<input type="radio" name="gender" value="여" disabled>여
				</c:if>
				<c:if test="${dto.gender == '여' }">
					<input type="radio" name="gender" value="남" disabled>남
					<input type="radio" name="gender" value="여" checked disabled>여
				</c:if>
				</td>
			</tr>
			<tr>
				<th class="center">이메일</th>
				<td>
					<input type="email" name="email"value="${dto.email }" placeholder="* 변경할 이메일 입력">
				</td>
			</tr>
			<tr>
				<th class="center">전화번호</th>
				<td>
					<!-- 입력 수 지정 및 숫자만 입력 가능하도록 정규식 사용 -->
                    <input type="text" name="tel1" id="tel1" value="${dto.tel1 }" maxlength="3" style="width: 20%"
                           oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">-
                    <input type="text" name="tel2" id="tel2" value="${dto.tel2 }" maxlength="4" style="width: 20%"
                           oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">-
                    <input type="text" name="tel3" id="tel3" value="${dto.tel3 }" maxlength="4" style="width: 20%"
                           oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
				</td>
			</tr>
			<tr>
				<th class="center">주소</th>
				<td>
					<!-- 우편번호 검색을 위한 주소 api 사용 -->
						<input type="text" name="addr1" id="sample4_postcode" value="${dto.addr1 }" placeholder="우편번호" readonly>
						<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
						<input type="text" name="addr2" id="sample4_roadAddress" value="${dto.addr2 }" placeholder="도로명주소" readonly>
						<input type="text" name="addr3" id="sample4_jibunAddress" value="${dto.addr3 }" placeholder="지번주소" readonly>
						<span id="guide" style="color:#999;display:none"></span>
						<input style="width: 80%" name="addr4" type="text" id="sample4_detailAddress" value="${dto.addr4 }" placeholder="상세주소">
				</td>
			</tr>
			<tr>
				<th class="center">생일</th>
				<td>
					<input type="date" name="birth" value="${dto.birth }">
				</td>
			</tr>
			<tr>
				<td colspan="2" class="center">
					<input type="submit" value="수정하기">&nbsp;
					<button type="reset">다시 작성</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>