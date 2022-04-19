<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/sample.css">
</head>
<body>
	<!-- 목록보기 -->
	<div style="height: 170px;">
		<table>
			<tr>
				<th>이름</th>
				<th>아이디</th>
				<th>성별</th>
				<th>이메일</th>
				<th>전화번호</th>
				<th>가입일</th>
			</tr>
			<c:forEach var="dto" items="${list }">
				<tr align="center">
					<td>${dto.name }</td>
					<td>${dto.id }</td>
					<td>${dto.gender }</td>
					<td>${dto.email}</td>
					<td>${dto.tel1 }-${dto.tel2 }-${dto.tel3 }</td>
					<td>${dto.join }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<br>
	<!-- 페이징처리 -->
	<div align="center">
		<c:if test="${startPage > 3 }">
			[<a class="paging" href="account/selectList.do?pg=${startPage-1 }">이전</a>]
		</c:if>
		
		<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
			<c:if test="${pg == i }">
				[<a class="currentPaging" href="account/selectList.do?pg=${i }">${i }</a>]
			</c:if>
			<c:if test="${pg != i }">
				[<a class="Paging" href="account/selectList.do?pg=${i }">${i }</a>]
			</c:if>			
		</c:forEach>
		
		<c:if test="${endPage < totalP }">
			[<a class="paging" href="account/selectList.do?pg=${endPage+1 }">다음</a>]
		</c:if>
	</div>
	
	<a href="/">메인</a>
</body>
</html>