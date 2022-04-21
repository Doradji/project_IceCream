<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head> 
    <meta charset="UTF-8">
    <title>ICECREAM</title>
    <!-- 다음 Maps API -->
    <script type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8aaec602e7c53738460015520aa7ea63&libraries=services"></script>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico"/>
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    <!-- Simple line icons-->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.5.5/css/simple-line-icons.min.css"
          rel="stylesheet"/>
    <!-- Google fonts-->
    <!-- <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css" /> -->
    <link href="https://fonts.googleapis.com/css?family=Do+Hyeon:400" rel="stylesheet">
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="css/styles.css" rel="stylesheet"/>

</head>
<body id="page-top">
<!-- Navigation-->
<a class="menu-toggle rounded" href="#"><i class="fas fa-bars"></i></a>
<nav id="sidebar-wrapper">
    <ul class="sidebar-nav">
        <c:if test="${memId == null}">
            <li class="sidebar-brand"><a href="/account/loginForm.do">Login</a></li>
        </c:if>
        <c:if test="${memId != null}">
            	<li>${memName} 님</li><br>
            	<li class="sidebar-brand"><a href="/account/modifyForm.do">Modify</a></li>
            	<li class="sidebar-brand"><a href="/account/delete.do">Sign Out</a></li>
            	<li class="sidebar-brand"><a href="/account/logout.do">Logout</a></li>
        </c:if>
        <li class="sidebar-nav-item"><a href="/main.do">Home</a></li>
        <li class="sidebar-nav-item"><a href="/shop/shopList.do">점포안내</a></li>
        <li class="sidebar-nav-item"><a href="/event/selectList.do">Event</a></li>
        <li class="sidebar-nav-item"><a href="/notice/selectList.do">Notice</a></li>
        <li class="sidebar-nav-item"><a href="/voice/list.do">고객게시판</a></li>
        <li class="sidebar-nav-item"><a href="/voice/mailAsk.do">메일문의</a>
    </ul>
</nav>
<!-- Header-->
<c:if test="${req == null}">
    <header class="masthead d-flex align-items-center">
        <div class="container px-4 px-lg-5 text-center">
            <h1 class="mb-1" style="padding-bottom: 75px; color: #fff; padding-left: 60px;">Chunskin Robbins</h1>
            <h3 class="mb-5">
                <em style="color: #fff;">made by 춘식이팀</em>
            </h3>
            <a class="btn btn-primary btn-xl" href="#about">Find Out More</a>
        </div>
    </header>
    <!-- About-->
    <section class="content-section bg-light" id="about">
        <div class="container px-4 px-lg-5 text-center">
            <div class="row gx-4 gx-lg-5 justify-content-center">
                <div class="col-lg-10">
                    <h2>ICECREAM</h2>
                    <p class="lead mb-5">
                        아이스크림의 새로운 기준, 춘스킨라빈스!
                    </p>
                    <a class="btn btn-dark btn-xl" href="/account/loginForm.do">Login</a>
                </div>
            </div>
        </div>
    </section>
    <!-- Services-->
    <section class="content-section bg-primary text-white text-center"
             id="services">
        <div class="container px-4 px-lg-5">
            <div class="content-section-heading">
                <h3 class="text-secondary mb-0">Services</h3>
                <h2 class="mb-5">CR MENU</h2>
            </div>
            <div class="row gx-4 gx-lg-5">
                <div class="col-lg-3 col-md-6 mb-5 mb-lg-0">
					<span class="service-icon rounded-circle mx-auto mb-3">
						<i class="icon-screen-smartphone"></i>
					</span>
                    <h4>
                        <strong>IceCream</strong>
                    </h4>
                    <p class="text-faded mb-0">새로운 기준, 춘스킨라빈스!</p>
                </div>
                <div class="col-lg-3 col-md-6 mb-5 mb-lg-0">
					<span class="service-icon rounded-circle mx-auto mb-3">
						<i class="icon-pencil"></i>
					</span>
                    <h4>
                        <strong>Beverage</strong>
                    </h4>
                    <p class="text-faded mb-0">즐거운 춘스킨라빈스 음료</p>
                </div>
                <div class="col-lg-3 col-md-6 mb-5 mb-md-0">
					<span class="service-icon rounded-circle mx-auto mb-3">
						<i class="icon-like"></i>
					</span>
                    <h4>
                        <strong>Coffee</strong>
                    </h4>
                    <p class="text-faded mb-0">
                        춘스킨라빈스의 사랑과 <i class="fas fa-heart"></i> 관심!
                    </p>
                </div>
                <div class="col-lg-3 col-md-6">
                    <span class="service-icon rounded-circle mx-auto mb-3"><i class="icon-mustache"></i></span>
                    <h4>
                        <strong>Dessert</strong>
                    </h4>
                    <p class="text-faded mb-0">간편하게 즐기는 디저트</p>
                </div>
            </div>
        </div>
    </section>
    <!-- Callout-->
    <section class="callout">
        <div class="container px-4 px-lg-5 text-center">
            <h2 class="mx-auto mb-5">
                Welcome to <em>your</em> new 춘스킨라빈스!
            </h2>
            <a class="btn btn-primary btn-xl" href="/shop/shopList.do">매장보기</a>
        </div>
    </section>
    <!-- Portfolio-->
    <section class="content-section" id="portfolio">
        <div class="container px-4 px-lg-5">
            <div class="content-section-heading text-center">
                <h3 class="text-secondary mb-0">ABOUT</h3>
                <h2 class="mb-5">Recent Projects</h2>
            </div>
            <div class="row gx-0">
                <div class="col-lg-6">
                    <a class="portfolio-item" href="#!">
                        <div class="caption">
                            <div class="caption-content">
                                <div class="h2">Notice</div>
                                <p class="mb-0">공지사항 메뉴 입니다!</p>
                            </div>
                        </div>
                        <img class="img-fluid" src="assets/img/portfolio-1.jpg" alt="..."/>
                    </a>
                </div>
                <div class="col-lg-6">
                    <a class="portfolio-item" href="#!">
                        <div class="caption">
                            <div class="caption-content">
                                <div class="h2">Event</div>
                                <p class="mb-0">이벤트 메뉴 입니다!</p>
                            </div>
                        </div>
                        <img class="img-fluid" src="assets/img/portfolio-2.jpg" alt="..."/>
                    </a>
                </div>
                <div class="col-lg-6">
                    <a class="portfolio-item" href="#!">
                        <div class="caption">
                            <div class="caption-content">
                                <div class="h2">Product</div>
                                <p class="mb-0">제품 설명 메뉴 입니다!</p>
                            </div>
                        </div>
                        <img class="img-fluid" src="assets/img/portfolio-3.jpg" alt="..."/>
                    </a>
                </div>
                <div class="col-lg-6">
                    <a class="portfolio-item" href="#!">
                        <div class="caption">
                            <div class="caption-content">
                                <div class="h2">Voice</div>
                                <p class="mb-0">고객 불만 접수 메뉴 입니다.</p>
                            </div>
                        </div>
                        <img class="img-fluid" src="assets/img/portfolio-4.jpg" alt="..."/>
                    </a>
                </div>
            </div>
        </div>
    </section>
    <!-- Call to Action-->
    <section class="content-section bg-primary text-white">
        <div class="container px-4 px-lg-5 text-center">
            <!-- <h2 class="mb-4">뭐 넣지....</h2> -->
            <!-- <a class="btn btn-xl btn-light me-4" href="#!">Click Me!</a>
            <a class="btn btn-xl btn-dark" href="#!">Look at Me!</a> -->
        </div>
    </section>
    <!-- Map-->
    <div class="map" id="contact">
        <div id="map" style="width: auto; height: 30rem; margin: auto"></div>

        <script type="text/javascript">
            let mapContainer = document.getElementById('map'), // 지도를 표시할 div
                mapOption = {
                    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                    level: 3 // 지도의 확대 레벨
                };

            // 지도를 생성합니다
            let map = new kakao.maps.Map(mapContainer, mapOption);

            // 주소-좌표 변환 객체를 생성합니다
            let geocoder = new kakao.maps.services.Geocoder();

            // 주소로 좌표를 검색합니다
            geocoder.addressSearch('서울 서초구 강남대로 429 동일빌딩', function(result, status) {

                // 정상적으로 검색이 완료됐으면
                if (status === kakao.maps.services.Status.OK) {

                    let coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                    // 결과값으로 받은 위치를 마커로 표시합니다
                    let marker = new kakao.maps.Marker({
                        map: map,
                        position: coords
                    });

                    // 인포윈도우로 장소에 대한 설명을 표시합니다
                    let infowindow = new kakao.maps.InfoWindow({
                        content: '<div style="width:150px;text-align:center;padding:6px 0;">춘스킨라빈스</div>'
                    });
                    infowindow.open(map, marker);

                    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                    map.setCenter(coords);
                }
            });
        </script>
    </div>
</c:if>
<c:if test="${req != null}">
    <jsp:include page="${req}"/>
</c:if>
<!-- Footer-->
<footer class="footer text-center">
    <div class="container px-4 px-lg-5">
        <ul class="list-inline mb-5">
            <li class="list-inline-item">
	            <a  class="social-link rounded-circle text-white mr-3" href="https://www.facebook.com/baskinrobbinskr/" target="_blank">
	            	<i class="icon-social-facebook"></i>
	            </a>
	        </li>
            <li class="list-inline-item">
            	<a class="social-link rounded-circle text-white mr-3" href="https://twitter.com/BaskinrobbinsKR" target="_blank">
            		<i class="icon-social-twitter"></i></a>
            </li>
            <li class="list-inline-item">
            	<a class="social-link rounded-circle text-white" href="https://github.com/Doradji/project_IceCream.git" target="_blank">
            		<i class="icon-social-github"></i>
            	</a>
            </li>
        </ul>
        <p class="text-muted small mb-0">Copyright &copy; 춘스킨라빈스 2022</p>
    </div>
</footer>

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top"><i
        class="fas fa-angle-up"></i></a>
<!-- Bootstrap core JS-->
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="script/scripts.js"></script>
</body>
</html>