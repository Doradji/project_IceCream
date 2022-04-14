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

// 회원가입 화면에서 입력 검사
function inputCheck(){
        let name = document.getElementById("name");
        let id = document.getElementById("id");
        let pass = document.getElementById("pass");
        let repass = document.getElementById("repass");
        let form = document.getElementById("form");

        if(name.value == ""){
            alert("이름을 입력하세요");
            name.focus();
            return false;
        } else if(id.value == ""){
            alert("아이디를 입력하세요.");
            id.focus();
            return false;
        } else if(pass.value == ""){
            alert("비밀번호를 입력하세요.");
            pass.focus();
            return false;
        } else if(repass.value == ""){
            alert("비밀번호 재확인을 입력하세요.");
            repass.focus();
            return false;
        } else if(pass.value != repass.value){
            alert("비밀번호를 재확인하세요");
            return false;
        } else {
			form.submit();
		}       
}

// 아이디 입력창 띄우기
function checkId() {
	var sId = document.form.id.value;
	
	if(sId == "") {
		alert("먼저 아이디를 입력하세요.");
		document.form.id.focus();
	} else {
		// 브라우저창 열기
		window.open("checkId.do?id="+sId, "", "width=450 height=100 left=500 top=200")
	}
}