package shop.dto;

public class ShopDTO {
    private String name; // 매장 이름
    private String addr1; // 우편번호
    private String addr2; // 도로명 주소
    private String addr3; // 지번 주소
    private String addr4; // 상세주소
    private String tel; // 매장 전화번호
    private int num;    // 매장 번호

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddr1() {
        return addr1;
    }

    public void setAddr1(String addr1) {
        this.addr1 = addr1;
    }

    public String getAddr2() {
        return addr2;
    }

    public void setAddr2(String addr2) {
        this.addr2 = addr2;
    }

    public String getAddr3() {
        return addr3;
    }

    public void setAddr3(String addr3) {
        this.addr3 = addr3;
    }

    public String getAddr4() {
        return addr4;
    }

    public void setAddr4(String addr4) {
        this.addr4 = addr4;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    @Override
    public String toString() {
        return "ShopDTO{" +
                "name='" + name + '\'' +
                ", addr1='" + addr1 + '\'' +
                ", addr2='" + addr2 + '\'' +
                ", addr3='" + addr3 + '\'' +
                ", addr4='" + addr4 + '\'' +
                ", tel='" + tel + '\'' +
                ", num=" + num +
                '}';
    }
}
