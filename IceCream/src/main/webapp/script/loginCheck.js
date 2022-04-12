// 로그인 화면에서 입력 검사
function loginCheck(){
	var frm = document.form;
	
	if(!frm.id.value){
		alert("아이디를 입력하세요");
		frm.id.focus();
	} else if(!frm.pass.value){
		alert("비밀번호를 입력하세요");
		frm.pass.focus();
	} else {
		frm.submit();
	}	
}