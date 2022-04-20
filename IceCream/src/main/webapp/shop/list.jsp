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
    <link href="../css/styles.css?v=2" rel="stylesheet"/>
    <script type="text/javascript">
        function searchCheck() {
            let search = document.getElementById('search');
            let searchForm = document.getElementById('searchForm');

            if (!search.value) {
                alert('검색어를 입력해주세요');
                search.focus();
            } else {
                searchForm.submit();
            }
        }
    </script>
</head>
<body>
<header class="smallHeader">
    <h1>Shop List</h1>
</header>
<section class="content-section bg-light" id="about">
    <div class="content" style="text-align: center">
        <div class="tableTab" style="width: 100%; min-height: 400px">
            <table style="margin: auto; width: 600px">
                <tr style="border-bottom: 1px solid lightgrey">
                    <th style="width: 60%">매장 이름</th>
                    <th style="width: 40%">전화번호</th>
                </tr>
                <c:forEach items="${list}" var="dto">
                    <tr>
                        <c:if test="${search != null}">
                            <td style="text-align: left">
                                <a href="/shop/view.do?pg=${pg}&num=${dto.num}&search=${search}"
                                style="text-decoration: none;"
                                >${dto.name}</a>
                            </td>
                        </c:if>
                        <c:if test="${search == null}">
                            <td style="text-align: left">
                                <a href="/shop/view.do?pg=${pg}&num=${dto.num}"
                                   style="text-decoration: none;"
                                >${dto.name}</a>
                            </td>
                        </c:if>
                        <td>${dto.tel}</td>
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
                        <a href="/shop/shopList.do?pg=${i}" &search=${search}>${i}</a>&nbsp;
                    </c:if>
                </c:forEach>
                <c:if test="${endPage < TOTAL_PAGE}">
                    <a href="/shop/shopList.do?pg=${endPage + 1}&search=${search}">다음</a>
                </c:if>
            </c:if>
            <br>
            <hr>
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
</section>

<!-- Bootstrap core JS-->
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="../script/scripts.js"></script>
</body>
</html>
