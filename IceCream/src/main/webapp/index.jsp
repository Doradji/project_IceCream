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
</head>
<body>
<header>
    <h1>헤더 영역</h1>
</header>
<aside>
    <a href="/">처음으로</a><br>
    <a href="/sample/sample.do">샘플페이지</a>
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
</body>
</html>
