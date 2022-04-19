<%--
  Created by IntelliJ IDEA.
  User: hgt27
  Date: 2022-04-12
  Time: 오전 10:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../css/sample.css">
</head>
<body>
<div class="content">
    <div class="tableTab" style="width: 100%; min-height: 400px">
        <table>
            <tr>
                <th style="width: 60%">매장 이름</th>
                <th style="width: 30%">전화번호</th>
                <th></th>
            </tr>
            <c:forEach items="${list}" var="dto" begin="${startNum}" end="${endNum}">
                <tr>
                    <td>${dto.name}</td>
                    <td>${dto.tel}</td>
                    <td><a href="/shop/view.do?pg=${pg}&num=${dto.num}">상세보기</a></td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <div class="pageTab" style="width: 100%; text-align: center">
        <c:if test="${startPage > VIEW_PAGE_COUNT}">
            <a href="/shop/list.do?pg=${startPage - 1}">이전</a>&nbsp;
        </c:if>
        <c:forEach var="i" begin="${startPage}" end="${endPage}">
            <c:if test="${pg == i}">
                <a href="/shop/list.do?pg=${i}" id="currentPage">${i}</a>&nbsp;
            </c:if>
            <c:if test="${pg > i && pg < i}">
                <a href="/shop/list.do?pg=${i}">${i}</a>&nbsp;
            </c:if>
        </c:forEach>
        <c:if test="${endPage < TOTAL_PAGE}">
            <a href="/shop/list.do?pg=${endPage + 1}">다음</a>
        </c:if>
    </div>
</div>
</body>
</html>
