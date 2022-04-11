package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import shop.dao.ShopDAO;
import shop.dto.ShopDTO;

import java.util.List;

@Service
public class ShopService {
    @Autowired
    ShopDAO shopDAO;

    // 가계 신규 등록
    public int insert(ShopDTO dto) {
        return shopDAO.insert(dto);
    }

    // 개별 조회
    public ShopDTO selectOne(int num) {
        return shopDAO.selectOne(num);
    }

    // 리스트 조회
    public List<ShopDTO> selectList(int startNum, int endNum) {
        return shopDAO.selectList(startNum, endNum);
    }

    // 전체 개수 조회
    public int selectTotal() {
        return shopDAO.selectTotal();
    }

    // 삭제
    public int delete(int num) {
        return shopDAO.delete(num);
    }

    // 내용 수정
    public int modify(ShopDTO dto) {
        return shopDAO.modify(dto);
    }
}
