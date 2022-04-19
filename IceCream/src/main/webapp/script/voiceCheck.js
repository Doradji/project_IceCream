function voiceCheck(){
	let id = document.getElementById("id");
	let content = document.getElementById("content");
	let title = document.getElementById("title");
	let num = document.getElementById("num");
	let fileName = document.getElementById("fileName");
	
	if(!id.value){
		alert("id를 입력하세요");
		id.focus();				
	} else if(!content.value){
		alert("내용을 입력하세요.");
		content.focus();	
	} else if(!title.value){
		alert("제목을 입력하세요.");
		title.focus();	
	} else if(!num.value){
		alert("글번호 입력하세요.");
		num.focus();		
	} else if(!fileName.value){
		alert("파일을 입력하세요.");
		fileName.focus();		
	} else{
		frm.submit();
	}
}