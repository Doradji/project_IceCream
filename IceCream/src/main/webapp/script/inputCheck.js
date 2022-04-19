function shopInputCheck() {
    let form = document.getElementById("form");
    let name = document.getElementById("name");
    let addr1 = document.getElementById("postcode");
    let addr4 = document.getElementById("detailAddress");
    let tel1 = document.getElementById("tel1");
    let tel2 = document.getElementById("tel2");
    let tel3 = document.getElementById("tel3");

    if(!name.value) {
        alert("매장 이름을 입력해주세요!");
        name.focus();
    } else if (!addr1.value) {
      alert("주소를 조회하여 기입해주세요!");
      addr1.focus();
    } else if (!addr4.value) {
        alert("상세 주소를 입력해주세요!");
        addr4.focus();
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