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
<title>Main</title>
<!-- main.CSS -->
<link rel="stylesheet" type="text/css" href="css/main.css">

<!-- bxSlider -->
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="//cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<link rel="stylesheet" href="//cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">

<!--mainMenu.js  -->
<script type="text/javascript" src="script/mainMenu.js"></script>
</head>

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
        
        <!--이미지 슬라이드  -->
        <ul class="bxslider">
        	<li><a href="#"><img src="./resources/11.jpg"></a></li>
        	<li><a href="#"><img src="./resources/12.jpg"></a></li>
        </ul>
    </section>
    <footer>
        footer 위치
    </footer>
</div>
</body>
</html>
