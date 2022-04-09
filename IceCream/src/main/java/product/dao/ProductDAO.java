package product.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import product.dto.ProductDTO;

@Repository
public class ProductDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	//제품 등록
	public int insert(ProductDTO dto) {
		int result=0;
		try {
			result= sqlSessionTemplate.insert("mybatis.product.insert",dto);
		} catch (Throwable t) {
			System.out.println("Product insert 실패");
			System.out.println(t);
		}
		
	
	return result;
	}
	//개별 조회
	public ProductDTO selectone(int num) { //질문!!
		ProductDTO dto=null;
		try {
			dto= sqlSessionTemplate.selectOne("mybatis.product.selectone",num);			
		} catch (Throwable t) {
			System.out.println("ProductDAO selectone 실패");
			System.out.println(t);
		}
		return dto;
	}
	//리스트 조회
	public List<ProductDTO> selectList(int startNum, int endNum){
		Map<String, Integer> map=new HashMap<String, Integer>();
		map.put("startNum",startNum);
		map.put("endNum", endNum);
		List<ProductDTO> list=new ArrayList<ProductDTO>();
		try {
			list= sqlSessionTemplate.selectList("mybatis.product.selectList", map);
		} catch (Throwable t) {
			System.out.println("ProductDAO selectList 실패");
			System.out.println(t);
		}
		return list;
		
	}
	//전체 갯수 조회
	public int selectTotal() {
		int result =0;
		try {
			result=sqlSessionTemplate.selectOne("mybatis.product.selectTotal");
		} catch (Throwable t) {
			System.out.println("Product selectTotal 실패");
			System.out.println(t);
		}
		return result;
	}
	//삭제
	public int delete(String num) {
		int result =0;
		try {
			result=sqlSessionTemplate.delete("mybatis.product.delete");
		} catch (Throwable t) {
			System.out.println("ProductDAO delete 실패");
			System.out.println(t);
		}
		return result;
	}
	//수정
	public int update(ProductDTO dto) {
		int result =0;
		try {
			result= sqlSessionTemplate.update("mybatis.product.update");
		}catch (Throwable t) {
			System.out.println("ProductDAO update 실패");
			System.out.println(t);
		}
		return result;
	}
}
