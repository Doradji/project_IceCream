<%--
  Created by IntelliJ IDEA.
  User: hgt27
  Date: 2022-04-20
  Time: 오전 11:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
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
<link href="../css/styles.css" rel="stylesheet"/>
<script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8aaec602e7c53738460015520aa7ea63&libraries=services"></script>
<script type="text/javascript">
    function closeDialog() {
        let dialog = document.getElementById('resultDialog');
        dialog.close();
    }

    function showDialog() {
        let dialog = document.getElementById('resultDialog');
        let message = document.getElementById('message');
        if (${result > 0}) {
            message.innerHTML = '수정되었습니다';
        } else {
            message.innerHTML = '수정 실패하였습니다';
        }
        dialog.show();
    }

    function doDelete() {
        if (confirm("정말로 삭제하겠습니까?")) {
            <c:if test="${search != null}">
            location.href = 'delete.do?pg=${pg}$num=${num}&search=${search}';
            </c:if>
            <c:if test="${search == null}">
            location.href = 'delete.do?pg=${pg}&num=${num}';
            </c:if>
        }
    }

    <c:if test="${result != null}">
    window.onload = function () {
        showDialog();
    }
    </c:if>
</script>
<body>
<header class="smallHeader">
    <h1>고객의 소리</h1>
</header>
<div class="content">

    <br>
    <table style="margin: auto; width: 1000px;">
        <tr>
            <th style="width: 20%; text-align: center; height: 20px">제목</th>
            <td style="width: 80%; border-left: lightgrey 1px dotted">
                &emsp;${dto.title}
            </td>
        </tr>
        <tr>
            <td colspan="2" height="10px">
                <hr>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                ${dto.content}
            </td>
        </tr>
        <c:if test="${dto.fileName != null}">
            <tr>
                <th style="text-align: center">첨부 파일</th>
                <td>
                    <a href="/upload/${dto.fileName}" download="${dto.fileName}">${dto.fileName}</a>
                </td>
            </tr>
        </c:if>

        <tr>
            <td colspan="2" style="text-align: center">
                <hr>
                <c:if test="${memId != null}">
                    <button type="button" class="ui-button" style="width: 20%"
                            onclick="location.href = 'replyWriteForm.do?pg=${pg}&num=${num}&search=${search}'">답글등록
                    </button>
                    <c:if test="${memId == dto.id}">
                        <button type="button" class="ui-button" style="width: 20%"
                                onclick="location.href = 'modifyForm.do?pg=${pg}&num=${num}&search=${search}'">수정
                        </button>
                        <button type="button" class="ui-button" style="width: 20%"
                                onclick="doDelete()">삭제
                        </button>
                    </c:if>
                </c:if>
                <c:if test="${search == null}">
                    <button type="button" class="ui-button" style="width: 20%"
                            onclick="location.href = 'list.do?pg=${pg}&num=${num}'">목록으로
                    </button>
                </c:if>
                <c:if test="${search != null}">
                    <button type="button" class="ui-button" style="width: 20%"
                            onclick="location.href = 'list.do?pg=${pg}&num=${num}&search=${search}'">목록으로
                    </button>
                </c:if>

            </td>
        </tr>
    </table>
</div>
<hr>
<!-- Bootstrap core JS-->
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="../script/scripts.js"></script>
<dialog id="resultDialog">
    <p id="message"></p>
    <button type="button" onclick="closeDialog()">확인</button>
</dialog>
</body>
</html>
