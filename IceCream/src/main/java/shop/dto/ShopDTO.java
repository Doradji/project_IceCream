package shop.dto;

public class ShopDTO {
    private String name; // 매장 이름
    private String addr; // 매장 주소
    private String tel; // 매장 전화번호
    private int num;    // 매장 번호

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
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
                ", addr='" + addr + '\'' +
                ", tel='" + tel + '\'' +
                ", num=" + num +
                '}';
    }
}
