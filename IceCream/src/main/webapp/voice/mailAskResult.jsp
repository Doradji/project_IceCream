<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
      var dialog = document.getElementById("write_dialog");
      dialog.showModal();
   }
   function close_ok() {
      var dialog = document.getElementById("write_dialog");
      dialog.close();
      if(${result}>0){
    	  location.href = "../main.jsp";
      }else{
    	  location.href = "mailAsk.jsp";
      }
      
   }
   </script>
</head>
<body> 
<dialog id="write_dialog" align="center">
	<c:if test="${result==0 }">
		문의등록에 실패 했습니다!
	</c:if>
	<c:if test="${result > 0 }">
		문의등록에 성공 했습니다
	</c:if>
	<input type="button" id="btn_ok" value="확인" onclick="close_ok()">
 </dialog>	
 	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="../script/scripts.js"></script>
</body>
</html>