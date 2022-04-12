<%--
  Created by IntelliJ IDEA.
  User: hgt27
  Date: 2022-04-12
  Time: 오후 3:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>지도 테스트</title>
    <link rel="stylesheet" href="../css/sample.css">
</head>
<body>
<div id="map" style="width: 500px; height: 600px"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8aaec602e7c53738460015520aa7ea63"></script>
<script type="text/javascript">
    // 지도를 담을 영역 설정
    let container = document.getElementById("map");
    // 지도를 생성할 때 필요할 기본 옵션
    let options = {
        center: new kakao.maps.LatLng(37.56646, 126.98121), // 지도 중심 좌표
        level: 3,   // 지도 확대 레벨
        mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도 종류
    };

    let map = new kakao.maps.Map(container, options); // 지도 생성 및 객체 리턴
</script>
</body>
</html>