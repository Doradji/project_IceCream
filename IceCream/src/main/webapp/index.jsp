<%--
  Created by IntelliJ IDEA.
  User: hgt27
  Date: 2022-04-07
  Time: 오후 2:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>기능 테스트</title>
    <link rel="stylesheet" href="css/sample.css?v=2">
    <script type="text/javascript">
        function dialog(message){
            let dialog = document.getElementById("dialog");
            let p = document.getElementById("p");

            p.innerHTML = message;
            dialog.showModal();
        }

        function closeDialog(){
            let dialog = document.getElementById("dialog");
            dialog.close();
        }

        window.onload = function (){
            if(${result != null}) {
                if(${result > 0 && req == "shop/write.jsp"}) {
                    dialog("가계 추가 성공");
                } else if (${result == 0 && req == "shop/write.jsp"}) {
                    dialog("가계 추가 실패");
                }
            }
        }
    </script>
</head>
<body>
<header>
    <h1>헤더 영역</h1>
</header>
<aside>
    <a href="/">처음으로</a><br>
    <a href="/sample/sample.do">샘플페이지</a><br>
    <a href="/shop/writeForm.do">가계 등록</a>
</aside>
<section>
    <c:if test="${req == null}">
        <jsp:include page="resources/body.html"/>
    </c:if>
    <c:if test="${req != null}">
        <jsp:include page="${req}"/>
    </c:if>
</section>
<footer>
    <h1>footer 영역</h1>
</footer>
<dialog id="dialog">
    <p id="p"></p>
    <button type="button" onclick="closeDialog()">확인</button>
</dialog>
</body>
</html>
