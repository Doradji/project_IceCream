/**
 * 상단 메뉴 js
 */
    /* main 스크롤러 */
    let mHtml = $("html");
    let page = 1;
    
    let lastPage = $(".content").length;
    
    mHtml.animate({scrollTop: 0}, 10);
    
    $(window).on("wheel", function(e){
        if(mHtml.is(":animated")) return;
        
        if(e.originalEvent.deltaY > 0){
            if(page == lastPage) return;
            page ++;
        }else if(e.originalEvent.deltaY < 0){
            if(page == 1) return;
            page --;
        }
        
        var posTop = (page -1)*$(window).height();
        mHtml.animate({scrollTop : posTop});
    })
    
    /* bxSlider */
    /* $(document).ready(function () {
    $('.bxslider').bxSlider({ // 클래스명 주의!
        auto: true, // 자동으로 애니메이션 시작
        speed: 500,  // 애니메이션 속도
        pause: 3000,  // 애니메이션 유지 시간 (1000은 1초)
        mode: 'horizontal', // 슬라이드 모드 ('fade', 'horizontal', 'vertical' 이 있음)
        //autoControls: true, // 시작 및 중지버튼 보여짐
        pager: true, // 페이지 표시 보여짐
        captions: true, // 이미지 위에 텍스트를 넣을 수 있음
        });
    }); */
    
    /* 메뉴 */
	$(function (){
	    let mainMenu = $(".topMenu");
	    let subMenu = $(".dept02");
	
	    subMenu.hide();

	    mainMenu.hover(function(){
	        $(this).parent().find(".dept02").slideDown(200); // 200ms = 1
	        $(this).parent().hover(function (){
	            // 서브 슬라이드 상태 유지
	        }, function() {
	            $(this).parent().find(".dept02").slideUp(200);
	        })
	    });
	})


