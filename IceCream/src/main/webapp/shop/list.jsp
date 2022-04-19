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
    <script type="text/javascript">
        function searchCheck() {
            let search = document.getElementById('search');
            let searchForm = document.getElementById('searchForm');

            if(!search.value) {
                alert('검색어를 입력해주세요');
                search.focus();
            } else {
                searchForm.submit();
            }
        }
    </script>
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
            <c:forEach items="${list}" var="dto">
                <tr>
                    <td>${dto.name}</td>
                    <td>${dto.tel}</td>
                    <td><a href="/shop/view.do?pg=${pg}&num=${dto.num}">상세보기</a></td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <div class="pageTab" style="width: 100%; text-align: center">
        <!-- 검색어가 없다면? -->
        <c:if test="${search == null}">
            <c:if test="${startPage > VIEW_PAGE_COUNT}">
                <a href="/shop/shopList.do?pg=${startPage - 1}">이전</a>&nbsp;
            </c:if>
            <c:forEach var="i" begin="${startPage}" end="${endPage}">
                <c:if test="${pg == i}">
                    <a href="/shop/shopList.do?pg=${i}" id="currentPage">${i}</a>&nbsp;
                </c:if>
                <c:if test="${pg > i && pg < i}">
                    <a href="/shop/shopList.do?pg=${i}">${i}</a>&nbsp;
                </c:if>
            </c:forEach>
            <c:if test="${endPage < TOTAL_PAGE}">
                <a href="/shop/shopList.do?pg=${endPage + 1}">다음</a>
            </c:if>
        </c:if>
        <!-- 검색어가 있다면? -->
        <c:if test="${search != null}">
            <c:if test="${startPage > VIEW_PAGE_COUNT}">
                <a href="/shop/shopList.do?pg=${startPage - 1}&search=${search}">이전</a>&nbsp;
            </c:if>
            <c:forEach var="i" begin="${startPage}" end="${endPage}">
                <c:if test="${pg == i}">
                    <a href="/shop/shopList.do?pg=${i}&search=${search}" id="currentPage">${i}</a>&nbsp;
                </c:if>
                <c:if test="${pg > i && pg < i}">
                    <a href="/shop/shopList.do?pg=${i}"&search=${search}>${i}</a>&nbsp;
                </c:if>
            </c:forEach>
            <c:if test="${endPage < TOTAL_PAGE}">
                <a href="/shop/shopList.do?pg=${endPage + 1}&search=${search}">다음</a>
            </c:if>
        </c:if>
        <br>
        <form name="searchForm" id="searchForm" method="post" action="shopList.do">
            <input type="text" name="search" id="search" style="width: 30%">
            <c:if test="${search!=null}">
                <button type="button" value="${search}" onclick="searchCheck()">검색</button>
            </c:if>
            <c:if test="${search == null}">
                <button type="button" onclick="searchCheck()">검색</button>
            </c:if>
            <input type="hidden" name="pg" value="${pg}">
        </form>
    </div>

</div>
</body>
</html>
