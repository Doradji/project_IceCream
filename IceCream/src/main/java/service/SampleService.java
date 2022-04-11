package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import shop.dao.ShopDAO;
import shop.dto.ShopDTO;

@Service
public class SampleService {
    @Autowired
    ShopDAO shopDAO;

    public int insert(ShopDTO dto) {
        return shopDAO.insert(dto);
    }
}
