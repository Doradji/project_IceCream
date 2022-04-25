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
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>
<!-- Simple line icons-->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.5.5/css/simple-line-icons.min.css"
	rel="stylesheet" />
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon:400"
	rel="stylesheet">
<!-- bootstrap css -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../css/styles.css?v=2" rel="stylesheet" />

<script type="text/javascript" src="../script/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
function viewPage(num){
	console.log("수정");
	console.log(num);
	location.href="/product/selectOne.do?num="+num;
}
</script>
</head>
<body>
	<header class="smallHeader" style="margin-bottom: 30px">
		<h1>Product List</h1>
	</header>
	<div class="container">
		<div class="row row-cols-3">
			<c:forEach var="dto" items="${list}">
				<div class="col">
					<div class="card" onclick="viewPage(${dto.num})">
						<%-- <img src="../storage/${dto.fileName}" class="card-img-top"> --%>
						<img src="../upload/${dto.fileName}" class="card-img-top"
							style="height: 450px;">
						<div class="card-body">
							<h5 class="card-title">${dto.name}</h5>
							<p class="card-text">${dto.productType}</p>
							<a href="#none" class="btn btn-primary"
								onclick="javascript:viewPage('${dto.num}');">view</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="../script/scripts.js"></script>


</body>
</html>