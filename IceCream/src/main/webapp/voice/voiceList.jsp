<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/sample.css">
</head>
<body>
	<div>
		<h2>글목록</h2>
		<div>
			<table>
				<tr>
					<th>작성자</th>
					<th>내용</th>
					<th>제목</th>
					<th>글번호</th>
					<th>날짜</th>
				</tr>
				<c:forEach var="dto" items="${list }">
					<tr>
						<td>${dto.id}</td>
						<td style="text-align:left;">
							<c:if test="">
								<c:forEach var="i" begin="0" end="${dto.voice_re_ref}" step="1">
									&nbsp;
								
								</c:forEach>
								▶
							</c:if>
							<a href="#">
							${dto.title}</a></td>
						<td>${dto.content}</td>
						<td>${dto.num}</td>
						<td>${dto.logTime}</td>
					</tr>
					
				</c:forEach>					
			</table>
		</div>
		<div>
			<c:if test="${startPage > 3}">
				[<a class="paging" href="voiceList.do?pg=${startPage-1}">이전</a>]
			</c:if>
		
			<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
				<c:if test="${pg == i}">
					[<a class="currentPaging" href="voiceList.do?pg=${i}">${i}</a>]
				</c:if>
					
				<c:if test="${pg != i}">
					[<a class="paging" href="voiceList.do?pg=${i}">${i}</a>]
				</c:if>
			</c:forEach>			
			
			<c:if test="${endPage < totalP}">
				[<a class="paging" href="voiceList.do?pg=${endPage+1}">다음</a>]
			</c:if>
		</div>
	</div>

</body>
</html>