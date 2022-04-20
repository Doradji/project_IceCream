/**
 * 상단 메뉴 js
 */
 
 /********************************************************************************/
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
    
 /********************************************************************************/
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
	
 /********************************************************************************/	

$(document).ready(function() {
	let img = document.getElementById("slide");
	let imgArray = ["./resources/11.jpg", "./resources/12.jpg"];
	let imgIndex = 0;	
	
	console.log("if 타기 전");
    console.log("imgIndex===="+imgIndex);
    console.log("imgArray.length===="+imgArray.length);
	
	function changeImg(){
	    img.setAttribute("src", imgArray[imgIndex]);
	    imgIndex++;
	    
	    if(imgIndex > imgArray.length){
	    
	    console.log("if탄후");
	    console.log("imgIndex===="+imgIndex);
        console.log("imgArray.length===="+imgArray.length);
	   
	   imgIndex = 0;
    }
	}
	setInterval(changeImg, 3000);
	
});
	

