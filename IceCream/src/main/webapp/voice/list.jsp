<%--
  Created by IntelliJ IDEA.
  User: hgt27
  Date: 2022-04-21
  Time: 오전 10:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>고객의 소리 리스트</title>
</head>
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
<link href="../css/styles.css?v=3" rel="stylesheet"/>
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
<body>
<header class="smallHeader">
    <h1>고객 게시판</h1>
</header>
<div class="content" style="width: auto;  height: 400px;">
    <br><br>

    <table style="width: 1000px; margin: auto; text-align: center">
        <tr>
            <th style="width: 15%">Num</th>
            <th style="width: 45%">Title</th>
            <th style="width: 15%">Author</th>
            <th style="width: 15%">logDate</th>
        </tr>
        <tr>
            <td colspan="4">
                <hr>
            </td>
        </tr>
        <c:forEach items="${list}" var="dto">
            <tr>
                <td>${dto.num}</td>
                <td style="text-align: left">
                    <c:forEach var="i" begin="1" end="${dto.voice_re_lev}">
                        &emsp;
                        <c:if test="${i == dto.voice_re_lev}">
                            ▷
                        </c:if>
                    </c:forEach>
                    <!-- 검색어가 없다면 -->
                    <c:if test="${search == null}">
                        <a href="/voice/view.do?pg=${pg}&num=${dto.num}">${dto.title}</a>
                    </c:if>
                    <!-- 검색어가 있다면 -->
                    <c:if test="${search != null}">
                        <a href="/voice/view.do?pg=${pg}&num=${dto.num}&search=${search}">${dto.title}</a>
                    </c:if>
                </td>
                <td>${dto.id}</td>
                <td>${dto.logTime}</td>
            </tr>
        </c:forEach>
    </table>
</div>
<div class="pageTab" style="width: auto; text-align: center;">
    <!-- 검색어가 없다면? -->
    <c:if test="${search == null}">
        <c:if test="${startPage > VIEW_PAGE_COUNT}">
            <a href="/voice/list.do?pg=${startPage - 1}">이전</a>&nbsp;
        </c:if>
        <c:forEach var="i" begin="${startPage}" end="${endPage}">
            <c:if test="${pg == i}">
                <a href="/voice/list.do?pg=${i}" id="currentPage">${i}</a>&nbsp;
            </c:if>
            <c:if test="${pg > i || pg < i}">
                <a href="/voice/list.do?pg=${i}">${i}</a>&nbsp;
            </c:if>
        </c:forEach>
        <c:if test="${endPage < TOTAL_PAGE}">
            <a href="/voice/list.do?pg=${endPage + 1}">다음</a>
        </c:if>
    </c:if>
    <!-- 검색어가 있다면? -->
    <c:if test="${search != null}">
        <c:if test="${startPage > VIEW_PAGE_COUNT}">
            <a href="/voice/list.do?pg=${startPage - 1}&search=${search}">이전</a>&nbsp;
        </c:if>
        <c:forEach var="i" begin="${startPage}" end="${endPage}">
            <c:if test="${pg == i}">
                <a href="/voice/list.do?pg=${i}&search=${search}" id="currentPage">${i}</a>&nbsp;
            </c:if>
            <c:if test="${pg > i || pg < i}">
                <a href="/voice/list.do?pg=${i}&search=${search}">${i}</a>&nbsp;
            </c:if>
        </c:forEach>
        <c:if test="${endPage < TOTAL_PAGE}">
            <a href="/voice/list.do?pg=${endPage + 1}&search=${search}">다음</a>
        </c:if>
    </c:if>
    <br>
    <hr>
    <form name="searchForm" id="searchForm" method="post" action="list.do">
        <input type="text" name="search" id="search" style="width: 30%" value="${search}">
        <c:if test="${search!=null}">
            <button type="button"  onclick="searchCheck()">검색</button>
        </c:if>
        <c:if test="${search == null}">
            <button type="button" onclick="searchCheck()">검색</button>
        </c:if>
        <c:if test="${memId != null}">
            &nbsp;<a href="/voice/writeForm.do">새글쓰기</a>
        </c:if>
        <input type="hidden" name="pg" value="${pg}">
    </form>
</div>
<dialog id="dialog">
    <p id="message"></p>
    <button type="button">확인</button>
</dialog>
<!-- Bootstrap core JS-->
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="../script/scripts.js"></script>
</body>
</html>
