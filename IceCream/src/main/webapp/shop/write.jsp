<%--
  Created by IntelliJ IDEA.
  User: Giteak_Dell5510
  Date: 2022-04-11
  Time: 오후 5:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../css/sample.css">
</head>
<body style="text-align: center">
<c:if test="${result > 0}">
    <img src="../resources/ChunsikPost.jpg" width="800px">
</c:if>
<c:if test="${result == 0}">
    <img src="../resources/tears.jpg" width="800px">
</c:if>
</body>
</html>
