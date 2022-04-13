<%--
  Created by IntelliJ IDEA.
  User: hgt27
  Date: 2022-04-13
  Time: 오전 11:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="../se2/js/service/HuskyEZCreator.js" charset="UTF-8"></script>
    <link rel="stylesheet" href="../css/sample.css">
</head>
<body>
<h1>텍스트만 받아오는 에디터</h1>
<form id="form" action="writeResultDefault.do" method="post">
    <!-- 스마트 에디터를 삽입할 textarea 삽입-->
    <textarea name="ir1" id="ir1" rows="40" cols="100">에디터에 기본으로 삽입할 글(수정 모드)이 없다면 이 value 값을 지정하지 않으시면 됩니다.</textarea>
    <script type="text/javascript">
        let oEditors = [];
        nhn.husky.EZCreator.createInIFrame({
            oAppRef: oEditors,
            elPlaceHolder: "ir1",
            sSkinURI: "../se2/SmartEditor2Skin.html",
            fCreator: "createSEditor2"
        });
        function submitContent(elClickObj) {
            // 에디터에 작성한 내역이 textarea value로 적용되는 코드
            oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
            try {
                elClickObj.form.submit();
            } catch (e) {
                
            }
        }

        function inputData() {
            // 에디터에 작성한 내역이 textarea value로 적용되는 코드
            oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);

            let ir1 = document.getElementById("ir1");
            alert(ir1.value);
        }

        function pasteDate() {
            let content = "<br><span style='color:#FF0000;'>이미지도 같은 방식으로 삽입.</span>";
            oEditors.getById["ir1"].exec("PASTE_HTML", [content]);
        }
    </script>
    <button type="button" onclick="submitContent(this)">저장</button>&nbsp;
    <button type="button" onclick="inputData()">전달 데이터 확인</button>&nbsp;
    <button type="button" onclick="pasteDate()">본문에 내용 넣기</button>
</form>
</body>
</html>
