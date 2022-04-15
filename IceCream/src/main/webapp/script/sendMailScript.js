function check(){
	var frm=document.sendMail;
	
	if(!frm.senderName.value){
		alert("보내는사람 이름을 입력하세요");
		frm.senderName.focus();		
	}else if(!frm.senderEmail.value){
		alert("보내는사람 E-Mail를 입력하세요");
		frm.senderEmail.focus();
		
	}else if(!frm.receiverEmail.value){
		alert("받는사람 E-Mail를 입력하세요");
		frm.receiverEmail.focus();
		
	}else if(!frm.subject.value){
		alert("제목을 입력하세요");
		frm.subject.focus();
		
	}else if(!frm.content.value){
		alert("내용을 입력하세요");
		frm.content.focus();
		
	}

}