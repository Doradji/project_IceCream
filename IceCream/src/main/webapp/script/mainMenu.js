/**
 * 상단 메뉴 js
 */
 
console.log("MainMenu 들어옴?");

/* 메인배너 슬라이 (bxSlider)*/
$(document).ready(function () {
    $('.bxslider').bxSlider({ // 클래스명 주의!
        auto: true, // 자동으로 애니메이션 시작
        speed: 500,  // 애니메이션 속도
        pause: 5000,  // 애니메이션 유지 시간 (1000은 1초)
        mode: 'horizontal', // 슬라이드 모드 ('fade', 'horizontal', 'vertical' 이 있음)
        //autoControls: true, // 시작 및 중지버튼 보여짐
        pager: true, // 페이지 표시 보여짐
        captions: true, // 이미지 위에 텍스트를 넣을 수 있음
    });
});
 
/* 상단 메뉴 */
$(function () {
        let mainMenu = $("#mainMenu");
        let subMenu = $("#subMenu");

        subMenu.hide();

        mainMenu.hover(function () {
            $(this).parent().find("#subMenu").slideDown(200);
            $(this).parent().hover(function () {
              // 서브가 슬라이드 상태를 유지하도록 함
            }, function () {
                $(this).parent().find("#subMenu").slideUp(200);
            })
        });
    })



