<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/sample.css">
<script type="text/javascript" src="../script/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	window.onload = function(){
		if(${result} > 0){
			console.log("ajax 성공");
			location.href = "/notice/selectList.do";
			return;
		}else{
			return;
		}
	}
	
</script>
</head>
<body>
	<h1>NOTICE - LIST</h1>
	디비처리 결과 :${result}

	<div>
		<table>
			<tr>
				<th>NUM</th>
				<th>TITLE</th>
				<th>CONTENT</th>
				<th>HIT</th>
				<th>LOGTIME</th>
				<th>FILENAME</th>
			</tr>
			<c:forEach var="dto" items="${list}">
				<tr>
					<td>${dto.num}</td>
					<td><a id="link" href="#" onclick="view(${dto.num})">${dto.title}</a></td>
					<td>${dto.content}</td>
					<td>${dto.hit}</td>
					<td>${dto.logTime}</td>
					<td>${dto.fileName}</td>
				</tr>
			</c:forEach>
		</table>

		<div>
			<c:if test="${startPage > 3}">
				[<a class="paging" href="selectList.do?pg=${startPage-1}">이전</a>]
			</c:if>
		
			<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
				<c:if test="${pg == i}">
					[<a class="currentPaging" href="selectList.do?pg=${i}">${i}</a>]
				</c:if>
					
				<c:if test="${pg != i}">
					[<a class="paging" href="selectList.do?pg=${i}">${i}</a>]
				</c:if>
			</c:forEach>			
			
			<c:if test="${endPage < totalP}">
				[<a class="paging" href="selectList.do?pg=${endPage+1}">다음</a>]
			</c:if>
		</div>

	</div>
	
	<script type="text/javascript">
	function view(num){
		/* console.log("들어오냐고오오오오옹"); */
		location.href="/notice/selectOne.do?num="+num+"&pg="+${pg};
	}
	</script>


</body>
</html>