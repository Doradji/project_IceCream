function voiceMailCheck(){
	
 	var frm1=document.getElementById('frm');
 	
	if(!frm1.recipient.value){
		alert("받는사람 E-Mail을 입력하세요");
		frm1.recipient.focus();
	}else if(!frm1.title.value){
		alert("제목을 입력하세요");
		frm1.title.focus();
	}else if(frm1.content.value == '<p><br></p>'){
		alert("내용을 입력하세요");
		frm1.content.focus();
 	}else{
	 	frm1.submit();
	}
}