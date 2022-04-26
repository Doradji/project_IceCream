<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/sample.css">
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
    .box {
		border-radius: 20px;
    	margin-bottom: 10px;
    	padding: 10px 20px;
    	border: 1px solid lightgray;    	
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
</style>
</head>
<body>
	<div class="table">
	<table>
			<tr>
				<th class="center">주소</th>
				<td>
					<input class="box" type="text" name="addr1" id="postcode" placeholder="우편번호" readonly>
						<input class="box" type="button" onclick="DaumPostcode()" value="우편번호 찾기"><br>
						<input class="box" style="width: 100%" type="text" name="addr2" id="roadAddress" placeholder="도로명주소" readonly>
						<input class="box" style="width: 100%" type="text" name="addr3" id="jibunAddress" placeholder="지번주소" readonly>
						<span id="guide" style="color:#999;display:none"></span>
						<input class="box" style="width: 80%" name="addr4" type="text" id="detailAddress" placeholder="상세주소">
				</td>
			</tr>
	</table>
	</div>
</body>
</html>