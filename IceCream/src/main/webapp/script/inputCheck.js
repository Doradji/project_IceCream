function shopInputCheck() {
    let form = document.getElementById("form");
    let name = document.getElementById("name");
    let addr = document.getElementById("addr");
    let tel1 = document.getElementById("tel1");
    let tel2 = document.getElementById("tel2");
    let tel3 = document.getElementById("tel3");

    if(!name.value) {
        alert("매장 이름을 입력해주세요!");
        name.focus();
    } else if (!addr.value) {
        alert("매장 주소를 입력해주세요!");
        addr.focus();
    } else if (tel1.value.length < 2) {
        alert("전화번호 앞자리를 확인하세요.");
        tel1.focus();
    } else if (tel2.value.length <=2) {
        alert("전화번호 중간자리를 확인하세요.");
        tel2.focus();
    } else if (tel3.value.length <= 2) {
        alert("전화번호 끝자리를 확인하세요.");
        tel3.focus();
    } else {
        form.submit();
    }
}