<%--
  Created by IntelliJ IDEA.
  User: Giteak_Dell5510
  Date: 2022-04-11
  Time: 오후 4:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="../script/inputCheck.js?v=2"></script>
    <link rel="stylesheet" href="../css/sample.css">
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

    <script>
        function DaumPostcode() {
            new daum.Postcode({
                oncomplete: function (data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var roadAddr = data.roadAddress; // 도로명 주소 변수
                    var extraRoadAddr = ''; // 참고 항목 변수

                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                        extraRoadAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if (data.buildingName !== '' && data.apartment === 'Y') {
                        extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if (extraRoadAddr !== '') {
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
    </script>
</head>
<body>
<form action="modify.do" name="form" id="form" method="post">
    <div class="content">
        <table>
            <tr>
                <th style="width: 40%">매장 이름</th>
                <td>
                    <input type="text" name="name" id="name" value="${dto.name}">
                </td>
            </tr>
            <tr>
            <tr>
                <th class="center">주소</th>
                <td>
                    <!-- 우편번호 검색을 위한 주소 api 사용 -->
                    <input type="text" name="addr1" id="postcode" placeholder="우편번호" value="${dto.addr1}" readonly>
                    <input type="button" onclick="DaumPostcode();" value="우편번호 찾기"><br>
                    <input type="text" name="addr2" id="roadAddress" placeholder="도로명주소" value="${dto.addr2}" readonly>
                    <input type="text" name="addr3" id="jibunAddress" placeholder="지번주소" value="${dto.addr3}" readonly>
                    <span id="guide" style="color:#999;display:none"></span>
                    <input style="width: 80%" name="addr4" type="text" id="detailAddress" value="${dto.addr4}" placeholder="상세주소">
                </td>
            </tr>
            </tr>
            <tr>
                <th>전화 번호</th>
                <td>
                    <input type="text" name="tel1" id="tel1" maxlength="3" value="${tel1}" style="width: 30%"
                           oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">-
                    <input type="text" name="tel2" id="tel2" maxlength="4" value="${tel2}" style="width: 30%"
                           oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">-
                    <input type="text" name="tel3" id="tel3" maxlength="4" value="${tel3}" style="width: 30%"
                           oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <button type="button" onclick="shopInputCheck()">수정내역 저장</button>
                    <button type="reset">다시작성</button>
                </td>
            </tr>
        </table>
    </div>
    <input type="hidden" name="num" value="${dto.num}">
</form>
</body>
</html>
