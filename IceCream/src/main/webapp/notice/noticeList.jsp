<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="../assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
<!-- Simple line icons-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.5.5/css/simple-line-icons.min.css" rel="stylesheet" />
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon:400" rel="stylesheet">
<!-- bootstrap css -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../css/styles.css" rel="stylesheet" />

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
	<header class="smallHeader">
		<h1>Notice List</h1>
	</header>
	<table class="table">
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col">제목</th>
				<th scope="col">조회수</th>
				<th scope="col">작성일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="dto" items="${list}">
				<tr>
					<td>${dto.num}</td>
					<td><a id="link" href="#" onclick="view(${dto.num})">${dto.title}</a></td>
					<td>${dto.hit}</td>
					<td>${dto.logTime}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<nav aria-label="Page navigation example">
		<ul class="pagination">
			<li class="page-item">
				<c:if test="${startPage > 3}">
					<a class="page-link" href="#" aria-label="Previous"> 
					<span aria-hidden="true">&laquo;</span>
					</a>
				</c:if>
			</li>

			<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
				<c:if test="${pg == i}">
					<li class="page-item">
						<a class="page-link" href="selectList.do?pg=${i}">${i}</a>
					</li>
				</c:if>
				<c:if test="${pg != i}">
					<li class="page-item">
						<a class="page-link" href="selectList.do?pg=${i}">${i}</a>
					</li>
				</c:if>
			</c:forEach>

			<c:if test="${endPage < totalP}">
				<li class="page-item">
					<a class="page-link" href="selectList.do?pg=${endPage+1}" aria-label="Next">
					<span aria-hidden="true">&raquo;</span>
					</a>
				</li>
			</c:if>
		</ul>
	</nav>


	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="../script/scripts.js"></script>

	<script type="text/javascript">
	function view(num){
		/* console.log("들어오냐고오오오오옹"); */
		location.href="/notice/selectOne.do?num="+num+"&pg="+${pg};
	}
	</script>


</body>
</html>