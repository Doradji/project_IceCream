<%--
  Created by IntelliJ IDEA.
  User: Giteak_Dell5510
  Date: 2022-04-11
  Time: 오후 4:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="../script/inputCheck.js"></script>
    <link rel="stylesheet" href="../css/sample.css">
</head>
<body>
<form action="write.do" name="form" id="form" method="post">
    <div class="content">
        <table>
            <tr>
                <th style="width: 40%">매장 이름</th>
                <td>
                    <input type="text" name="name" id="name">
                </td>
            </tr>
            <tr>
                <th>주소 입력</th>
                <td>
                    <input type="text" name="addr" id="addr">
                </td>
            </tr>
            <tr>
                <th>전화 번호</th>
                <td>
                    <input type="text" name="tel1" id="tel1" maxlength="3" style="width: 30%"
                           oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">-
                    <input type="text" name="tel2" id="tel2" maxlength="4" style="width: 30%"
                           oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">-
                    <input type="text" name="tel3" id="tel3" maxlength="4" style="width: 30%"
                           oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <button type="button" onclick="shopInputCheck()">저장</button>
                    <button type="reset">다시작성</button>
                </td>
            </tr>
        </table>
    </div>
</form>
</body>
</html>
