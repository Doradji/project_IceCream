<%--
  Created by IntelliJ IDEA.
  User: hgt27
  Date: 2022-04-15
  Time: 오전 9:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
    $(function () {
        let mainMenu = $("#mainMenu");
        let subMenu = $("#subMenu");

        subMenu.hide();

        mainMenu.hover(function () {
            $(this).parent().find("#subMenu").slideDown(200);
            $(this).parent().hover(function () {
              // 서브가 슬라이드 상태를 유지하도록 함
            }, function () {
                $(this).parent().find("#subMenu").slideUp(200);
            })
        });
    })
</script>
<style>
    #background{
        width: auto;
        height: auto;
        background: lightcyan;
    }
    header {
        width: 100%;
    }
    ul {
        list-style: none;
    }
    #mainMenu {
        background: lightpink;
    }
    #mainMenu > ul{
        width: 100%;

    }
    #mainMenu > ul > li {
        float: left;
        width: 20%;
        text-align: center;
    }
    #subMenu {
        background: lightseagreen;
    }
    #subMenu > ul {
        width: 100%;
    }
    #subMenu > ul > li {
        float: left;
        width: 20%;
        text-align: center;
    }
    section{
        clear: both;
        background: limegreen;
        width: 100%;
        min-height: 800px;
        height: auto;
    }
    footer{
        width: auto;
        height: 300px;
        background: black;
        color: lightgrey;
    }
</style>
<body>
<div id="background">
    <header>
        <div id="mainMenu">
            <ul> <!-- 기본 메뉴 -->
                <li>소개</li>
                <li>메뉴</li>
                <li>매장안내</li>
                <li>공지사항</li>
                <li>고객의소리</li>
            </ul>
        </div>
        <div id="subMenu">
            <ul class="menu">
                <li>1-1</li>
                <li>2-1</li>
                <li>3-1</li>
                <li>4-1</li>
                <li>5-1</li>
            </ul>
            <ul class="menu">
                <li>1-2</li>
                <li>2-2</li>
                <li>3-2</li>
                <li>4-2</li>
                <li>5-2</li>
            </ul>
            <ul class="menu">
                <li>1-3</li>
                <li>2-3</li>
                <li>3-3</li>
                <li>4-3</li>
                <li>5-3</li>
            </ul>
            <ul class="menu">
                <li>1-4</li>
                <li>2-4</li>
                <li>3-4</li>
                <li>4-4</li>
                <li>5-4</li>
            </ul>
        </div>
    </header>
    <section>
        <c:if test="${req == null}">
            페이지 위치(jsp:include)
        </c:if>
        <c:if test="${req != null}">
            <jsp:include page="/${req}"/>
        </c:if>
    </section>
    <footer>
        footer 위치
    </footer>
</div>
</body>
</html>
