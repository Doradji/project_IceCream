<%--
  Created by IntelliJ IDEA.
  User: hgt27
  Date: 2022-04-20
  Time: 오전 11:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="../assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
<!-- Simple line icons-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.5.5/css/simple-line-icons.min.css" rel="stylesheet" />
<!-- Google fonts-->
<!-- <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css" /> -->
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon:400" rel="stylesheet">
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../css/styles.css" rel="stylesheet" />
<script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8aaec602e7c53738460015520aa7ea63&libraries=services"></script>
<!-- 입력검사 -->
<script type="text/javascript">
    // iframe 안의 스마트에디터 작성한 값 가져와서 다른 창에 값 반영
    function iframeContent(){
        let iframe = document.getElementById("iframe");
        iframe.contentWindow.insertContent();
        let value = iframe.contentWindow.document.getElementById("content").value;
        let content = document.getElementById("content");
        content.value = value;
    }
    function voiceWriteInputCheck(){
        let frm = document.getElementById("frm");
        iframeContent();

        if(!frm.title.value) {
            alert("제목을 입력해주세요!");
            frm.title.focus();
        } else if(frm.content.value == '<p><br></p>') {
            alert("내용을 입력해주세요!");
            frm.summernote.focus();
        } else {
            frm.submit();
        }
    }

    function back(){
        if(confirm("정말 취소하겠습니까?")){
            history.back();
        }
    }
</script>
<body>
<header class="smallHeader">
    <h1>고객의 소리</h1>
</header>
<div class="content">
    <br>
    <form name="frm" id="frm" action="replyWrite.do" method="post" enctype="multipart/form-data">
        <table style="margin: auto; width: 1000px">
            <tr>
                <th style="width: 20%; text-align: center">제목</th>
                <td style="width: 80%; border-left: lightgrey 1px dotted">
                    <input type="text" name="title" style="width: 100%; height: 100%; border: none">
                </td>
            </tr>
            <tr>
                <td colspan="2" height="10px"></td>
            </tr>
            <tr>
                <td colspan="2" height="500px">
                    <iframe style="width: 100%;height: 600px; border: none" id="iframe" name="iframe" src="summernote.html"></iframe>
                    <input type="hidden" name="content" id="content">
                </td>
            </tr>
            <tr>
                <th style="text-align: center">파일 첨부</th>
                <td>
                    <input type="file" name="contentFile" style="width: 100%; height: 100%">
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center">
                    <hr>
                    <button type="button" class="ui-button" style="width: 20%" onclick="voiceWriteInputCheck()">등록</button>
                    <button type="button" class="ui-button" style="width: 20%" onclick="back()">취소</button>
                </td>
            </tr>
            <input type="hidden" name="id" value="${memId}">
        </table>

    </form>
</div>
<hr>
<!-- Bootstrap core JS-->
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="../script/scripts.js"></script>
</body>
</html>
