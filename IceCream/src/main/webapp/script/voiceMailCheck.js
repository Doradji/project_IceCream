function voiceMailCheck(){
	var frm=document.form

	if(!frm.username.value){
		alert("보내는사람 E-Mail을 입력하세요");
		frm.username.focus();
	}else if(!frm.password.value){
		alert("비밀번호를 입력하세요");
		frm.password.focus();
	}else if(!frm.recipient.value){
		alert("받는사람 E-Mail을 입력하세요");
		frm.recipient.focus();
 	}else if(!frm.subject.value){
		alert("제목을 입력하세요");
		frm.subject.focus();
 	}else if(!frm.contents.value){
		alert("내용을 입력하세요");
		frm.contents.focus();
 	}else{
	 	frm.submit();
	}
}