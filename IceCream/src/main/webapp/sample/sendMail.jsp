<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="../css/sample.css">
    <script type="text/javascript" src="../script/sendMailScript.js?v=2"></script>
	<script src="../se2/js/service/HuskyEZCreator.js" charset="UTF-8"></script>
</head>
<body>
<form action="sendMailOk.do" method="post" name="sendMail"
      onsubmit="submitContent();check(); return false;">
    <table border="1" align="center" style="font-size: 10pt;"
           cellpadding="0" cellspacing="0">
        
        <tr>
            <td>비밀번호</td>
            <td><input type="password" name="password" size="50"/></td>
        </tr>
        <tr>
            <td>받는사람 E-Mail</td>
            <td><input type="text" name="recipient" size="50"/></td>
        </tr>
        <tr>
            <td>제목</td>
            <td><input type="text" name="subject" size="50"/></td>
        </tr>
        <tr>
            <td>내용</td>
            <td>
                <textarea name="contents" id="contents" style="width: auto; height: 200px" placeholder="내용을 입력해 주세요"></textarea>
                <script type="text/javascript">
                    let oEditors = [];
                    nhn.husky.EZCreator.createInIFrame({
                        oAppRef: oEditors,
                        elPlaceHolder: "contents",
                        sSkinURI: "../se2/SmartEditor2Skin.html",
                        fCreator: "createSEditor2"
                    });

                    function submitContent() {
                        oEditors.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);
                    }
                </script>
            </td>

        </tr>

        <tr>
            <td colspan="2" align="center">
                <input type="submit" value="메일 보내기">
                <input type="reset" value="취소">
            </td>
        </tr>
    </table>
</form>
</body>
</html>