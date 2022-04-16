<%--
  Created by IntelliJ IDEA.
  User: hgt27
  Date: 2022-04-14
  Time: 오후 4:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../css/sample.css">
<script type="text/javascript">
	window.onload = function(){
		let dialog = document.getElementById("write_dialog");
		dialog.showModal();
	}
</script>
</head>
<body>
${result}
<hr>
<dialog id="write_dialog" align="center">
		<c:if test="${result > 0 }">
			<p>작성하신 글을 저장하였습니다.</p>
		</c:if>
		<c:if test="${!(result > 0)}">
			<p>작성하신 글을 저장하지 못하였습니다.</p>
		</c:if>
	</dialog>
</body>
</html>
