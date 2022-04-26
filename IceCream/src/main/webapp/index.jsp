<%--
  Created by IntelliJ IDEA.
  User: hgt27
  Date: 2022-04-07
  Time: 오후 2:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <!-- 관리자 타입이 아닌경우 -->
    <c:if test="${memType == null}">
        <meta http-equiv="refresh" content="0;url=/main.do">
    </c:if>
    <title>개발자 관리 및 기능 테스트 페이지</title>
    <link rel="stylesheet" href="css/sample.css?v=2">
    <script type="text/javascript">
        function dialog(message) {
            let dialog = document.getElementById("dialog");
            let p = document.getElementById("p");

            p.innerHTML = message;
            dialog.showModal();
        }

        function closeDialog() {
            let dialog = document.getElementById("dialog");
            dialog.close();
        }

        window.onload = function () {
            if (${result != null}) {
                if (${result > 0 && req == "shop/write.jsp"}) {
                    dialog("가계 추가 성공");
                } else if (${result == 0 && req == "shop/write.jsp"}) {
                    dialog("가계 추가 실패");
                }
            }
        }
        window.onload = function () {
            if (${result != null}) {
                if (${result > 0 && req == "account/write.jsp"}) {
                    dialog("회원가입 성공");
                } else if (${result == 0 && req == "account/write.jsp"}) {
                    dialog("회원가입 실패");
                }
            }
        }
    </script>
    <c:if test="${memType != null}">
        <c:if test="${memType < 1 || memType > 1}">
            <meta http-equiv="refresh" content="0;url=/main.do">
        </c:if>
    </c:if>
	<style type="text/css">
		aside a {
				text-decoration : none;
			}
		aside a:hover {
				color: red;
			}
	</style>
</head>
<c:if test="${memType == 1}">
    <body>
    <header>
        <h1>개발자 관리 및 기능 테스트 페이지</h1>
    </header>
    <aside>
        <a href="/main.do">소비자 페이지</a>
        <hr>
        <a href="/">처음으로</a><br>              
      
		<hr>
        <label>회원 관리</label><br>
        <a href="/account/writeForm.do">회원 가입</a><br>
        <a href="/account/selectList.do">회원 리스트</a><br>
        <a href="/account/deleteForm.do">회원 탈퇴</a>
                
        <hr>
        <label>공지사항 관리</label><br>
        <a href="/notice/writeForm.do">공지사항 등록</a><br>
        <a href="/notice/selectList.do">공지사항 리스트</a><br>
        
        <hr>
        <label>매장 관리</label><br>
        <a href="/shop/writeForm.do">가계 등록</a><br>
        <a href="/shop/list.do">가계 리스트</a>
        
        <hr>
        <label>이벤트 관리</label><br>
        <a href="/event/writeForm.do">이벤트 등록</a><br>
        <a href="/event/selectList.do">이벤트 리스트</a><br>
        
        <hr>
        <label>고객문의 관리</label><br>
        <a href="/voice/writeForm.do">고객문의 등록</a><br>
        <a href="/voice/list.do">고객문의 리스트</a>
        
        <hr>
        <label>제품 관리</label><br>
        <a href="/product/writeForm.do">제품 등록</a><br>
        <a href="/product/productList.do">제품 리스트</a>

		<hr>
        <label>텍스트 편집기</label><br>
        <a href="/sample/sampleSmartEditor.do">텍스트에디터(only text)</a>
                
        <hr>
        <label>지도 테스트</label><br>
        <a href="/sample/sampleMapDefault.do">기본 지도</a><br>
        <a href="/sample/sampleMapMarker.do">마커 및 다이얼로그 표시 지도</a>

        <hr>
        <label>메일 테스트</label><br>
        <a href="/sample/sendMail.do">단순 메일 보내기</a>
		
		<hr>
        <label>주소 테스트</label><br>
        <a href="/sample/sampleAddress.do">주소 입력</a>
    </aside>
    <section>
        <c:if test="${req == null}">
            <jsp:include page="resources/body.html"/>
        </c:if>
        <c:if test="${req != null}">
            <jsp:include page="${req}"/>
        </c:if>
    </section>
    <footer>
        <h1>기능 수정 시 공유 필수!</h1>
    </footer>
    <dialog id="dialog">
        <p id="p"></p>
        <button type="button" onclick="closeDialog()">확인</button>
    </dialog>
    </body>
</c:if>
</html>
