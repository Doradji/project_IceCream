<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<style type="text/css">
body {
	background-color: #dee9ff;
}

.registration-form {
	padding: 50px 0;
}

.registration-form form {
	background-color: #fff;
	max-width: 600px;
	margin: auto;
	padding: 50px 70px;
	border-top-left-radius: 30px;
	border-top-right-radius: 30px;
	box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.075);
}

.registration-form .form-icon {
	text-align: center;
	background-color: #5891ff;
	border-radius: 50%;
	font-size: 40px;
	color: white;
	width: 100px;
	height: 100px;
	margin: auto;
	margin-bottom: 50px;
	line-height: 100px;
}

.registration-form .item {
	border-radius: 20px;
	margin-bottom: 25px;
	padding: 10px 20px;
}

.registration-form .create-account {
	border-radius: 30px;
	padding: 10px 20px;
	font-size: 18px;
	font-weight: bold;
	background-color: #5791ff;
	border: none;
	color: white;
	margin-top: 20px;
}
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$('#birth-date').mask('00/00/0000');
		$('#phone-number').mask('0000-0000');
	})
</script>
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
<!-- <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css" /> -->
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon:400"
	rel="stylesheet">
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../css/styles.css?v=2" rel="stylesheet" />
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.4.1/css/simple-line-icons.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/style.css">
<script type="text/javascript" src="../script/voiceMailCheck.js?v=2"></script>
</head>
<body>
	<div class="registration-form">
		<form action="mailAskResult.do" name="form" method="post">
			<div class="form-icon">
				<span><i class="icon icon-user"></i></span>
			</div>
			<div class="form-group">
				<input type="text" class="form-control item" id="username" name="username"
					placeholder="메일주소">
			</div>
			<div class="form-group">
				<input type="password" class="form-control item" id="password" name="password"
					placeholder="비밀번호">
			</div>
			<div class="form-group">
				<input type="text" class="form-control item" id="recipient" name="recipient"
					placeholder="받는사람 메일주소">
			</div>
			<div class="form-group">
				 <input type="text" class="form-control item" id="subject" name="subject"
					placeholder="제목">
			</div>
			<div class="form-group">
				<textarea class="form-control item" id="contents" name="contents" placeholder="문의내용"></textarea>

			</div>
			<div class="form-group">
				<button type="button" class="btn btn-block create-account" onclick="voiceMailCheck()">문의하기</button>
			</div>
		</form>

	</div>
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.min.js"></script>
	<script src="assets/js/script.js"></script>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="../script/scripts.js"></script>
</body>
</html>