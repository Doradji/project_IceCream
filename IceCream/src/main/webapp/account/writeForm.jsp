<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script type="text/javascript" src="../script/accountCheck.js?v=1"></script>
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
</style>
</head>
<body>
	<form action="write.do" name="form" id="form1" method="post" onsubmit="inputCheck(); return false;">
		<div>
			<table>
				<tr>
					<th class="center">이름</th>
					<td>
						<input type="text" name="name" id="name" placeholder="*필수 입력">
					</td>
				</tr>
				<tr>
					<th class="center">아이디</th>
					<td>
						<input type="text" name="id" id="id" placeholder="*필수 입력">
						<input type="button" value="중복체크" onclick="checkId()">
					</td>
				</tr>
				<tr>
					<th class="center">비밀번호</th>
					<td>
						<input type="password" name="pass" id="pass" placeholder="*필수 입력">
					</td>
				</tr>
				<tr>
					<th class="center">비밀번호 재확인</th>
					<td>
						<input type="password" name="repass" id="repass" placeholder="*필수 입력">
					</td>
				</tr>
				<tr>
					<th class="center">성별</th>
					<td>
						<input style="width: 50px" type="radio" name="gender" value="남">남
						<input style="width: 50px" type="radio" name="gender" value="여">여
					</td>
				</tr>
				<tr>
					<th class="center">전화 번호</th>
					<td>
					<!-- 입력 수 지정 및 숫자만 입력 가능하도록 정규식 사용 -->
                    <input type="text" name="tel1" id="tel1" maxlength="3" style="width: 20%"
                           oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">-
                    <input type="text" name="tel2" id="tel2" maxlength="4" style="width: 20%"
                           oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">-
                    <input type="text" name="tel3" id="tel3" maxlength="4" style="width: 20%"
                           oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                </td>
				</tr>
				<tr>
					<th class="center">주소</th>
					<td>
						<!-- 우편번호 검색을 위한 주소 api 사용 -->
						<input type="text" name="addr1" id="postcode" placeholder="우편번호" readonly>
						<input type="button" onclick="DaumPostcode()" value="우편번호 찾기"><br>
						<input type="text" name="addr2" id="roadAddress" placeholder="도로명주소" readonly>
						<input type="text" name="addr3" id="jibunAddress" placeholder="지번주소" readonly>
						<span id="guide" style="color:#999;display:none"></span>
						<input style="width: 80%" name="addr4" type="text" id="detailAddress" placeholder="상세주소">
					</td>
				</tr>
				<tr>
					<th class="center">이메일</th>
					<td>
						<input type="email" name="email">
					</td>
				</tr>
				<tr>
					<th class="center">생일</th>
					<td>
						<input style="width: 80px" type="date" name="birth">
					</td>
				</tr>
				<tr>
					<td colspan="2" class="center">
						<input type="submit" value="회원가입">
						<input type="reset" value="다시 작성">
					</td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>