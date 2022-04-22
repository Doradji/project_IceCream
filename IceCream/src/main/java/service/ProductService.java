package service;



import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import product.dao.ProductDAO;
import product.dto.ProductDTO;

@Service
public class ProductService {
	@Autowired
	ProductDAO productDAO;
	
	// 제품 등록
	public int insert(ProductDTO dto) {
		return productDAO.insert(dto);
	}

	// 개별 조회
	public ProductDTO selectOne(int num) {

		return productDAO.selectOne(num);
	}

	// 리스트 조회
	/*
	 * public List<ProductDTO> selectList(int startNum, int endNum) { return
	 * productDAO.selectList(startNum, endNum); }
	 */
	public List<ProductDTO> selectList() {
		return productDAO.selectList();
	}

	// 전체 갯수 조회
	public int selectTotal() {
		return productDAO.selectTotal();
	}

	// 삭제
	public int delete(String num) {

		return productDAO.delete(num);
	}

	// 수정
	public int update(ProductDTO dto) {

		return productDAO.update(dto);
	}
}
