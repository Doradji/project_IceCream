<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ICECREAM</title>
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
			<li class="sidebar-brand"><a href="#page-top">Login</a></li>
		</c:if>
        <c:if test="${memId != null}">
			<label>${memId} 님</label><br>
			<li class="sidebar-brand"><a href="#page-top">logout</a></li>
		</c:if>
        <li class="sidebar-nav-item"><a href="/main.do">Home</a></li>
        <li class="sidebar-nav-item"><a href="#about">About</a></li>
        <li class="sidebar-nav-item"><a href="/shop/shopList.do">Shop List</a></li>
        <li class="sidebar-nav-item"><a href="#portfolio">Portfolio</a></li>
        <li class="sidebar-nav-item"><a href="#contact">Contact</a></li>
    </ul>
</nav>
<!-- Header-->
<c:if test="${req == null}">
<header class="masthead d-flex align-items-center">
    <div class="container px-4 px-lg-5 text-center">
        <h1 class="mb-1">춘스킨라빈스</h1>
        <h3 class="mb-5">
            <em>made by 춘식이팀</em>
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
                    아이스크림의 새로운 기준, 춘스킨라빈스 <a href="http://www.baskinrobbins.co.kr/">baskin31</a>!
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
					<span class="service-icon rounded-circle mx-auto mb-3"><i
                            class="icon-screen-smartphone"></i></span>
                <h4>
                    <strong>IceCream</strong>
                </h4>
                <p class="text-faded mb-0">새로운 기준, 춘스킨라빈스!</p>
            </div>
            <div class="col-lg-3 col-md-6 mb-5 mb-lg-0">
					<span class="service-icon rounded-circle mx-auto mb-3"><i
                            class="icon-pencil"></i></span>
                <h4>
                    <strong>Beverage</strong>
                </h4>
                <p class="text-faded mb-0">즐거운 춘스킨라빈스 음료</p>
            </div>
            <div class="col-lg-3 col-md-6 mb-5 mb-md-0">
					<span class="service-icon rounded-circle mx-auto mb-3"><i
                            class="icon-like"></i></span>
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
        <a class="btn btn-primary btn-xl" href="">Download Now!</a>
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
        <h2 class="mb-4">뭐 넣지....</h2>
        <!-- <a class="btn btn-xl btn-light me-4" href="#!">Click Me!</a>
        <a class="btn btn-xl btn-dark" href="#!">Look at Me!</a> -->
    </div>
</section>
<!-- Map-->
<div class="map" id="contact">
    <iframe
            src="https://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=Twitter,+Inc.,+Market+Street,+San+Francisco,+CA&amp;aq=0&amp;oq=twitter&amp;sll=28.659344,-81.187888&amp;sspn=0.128789,0.264187&amp;ie=UTF8&amp;hq=Twitter,+Inc.,+Market+Street,+San+Francisco,+CA&amp;t=m&amp;z=15&amp;iwloc=A&amp;output=embed"></iframe>
    <br/> <small><a
        href="https://maps.google.com/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=Twitter,+Inc.,+Market+Street,+San+Francisco,+CA&amp;aq=0&amp;oq=twitter&amp;sll=28.659344,-81.187888&amp;sspn=0.128789,0.264187&amp;ie=UTF8&amp;hq=Twitter,+Inc.,+Market+Street,+San+Francisco,+CA&amp;t=m&amp;z=15&amp;iwloc=A"></a></small>
</div>
</c:if>
<c:if test="${req != null}">
	<jsp:include page="${req}"/>
</c:if>
<!-- Footer-->
<footer class="footer text-center">
    <div class="container px-4 px-lg-5">
        <ul class="list-inline mb-5">
            <li class="list-inline-item"><a
                    class="social-link rounded-circle text-white mr-3" href="#!"><i
                    class="icon-social-facebook"></i></a></li>
            <li class="list-inline-item"><a
                    class="social-link rounded-circle text-white mr-3" href="#!"><i
                    class="icon-social-twitter"></i></a></li>
            <li class="list-inline-item"><a
                    class="social-link rounded-circle text-white" href="#!"><i
                    class="icon-social-github"></i></a></li>
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