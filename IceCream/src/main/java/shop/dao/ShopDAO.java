package shop.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import shop.dto.SearchDTO;
import shop.dto.ShopDTO;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class ShopDAO {
    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    // 가계 신규 등록
    public int insert(ShopDTO dto) {
        int result = 0;
        try {
            result = sqlSessionTemplate.insert("mybatis.shop.insert", dto);
        } catch (Throwable t) {
            System.out.println("ShopDAO insert 실패");
            System.out.println(t);
        }

        return result;
    }

    // 개별 조회
    public ShopDTO selectOne(int num) {
        ShopDTO dto = null;
        try {
            dto = sqlSessionTemplate.selectOne("mybatis.shop.selectOne", num);
        } catch (Throwable t) {
            System.out.println("ShopDAO selectOne 실패");
            System.out.println(t);
        }

        return dto;
    }

    // 리스트 조회
    public List<ShopDTO> selectList(int startNum, int endNum) {
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("startNum", startNum);
        map.put("endNum", endNum);

        List<ShopDTO> list = new ArrayList<ShopDTO>();
        try {
            list = sqlSessionTemplate.selectList("mybatis.shop.selectList", map);
        } catch (Throwable t) {
            System.out.println("ShopDAO selectList 실패");
            System.out.println(t);
        }
        return list;
    }

    // 전체 개수 조회
    public int selectTotal() {
        int result = 0;
        try {
            result = sqlSessionTemplate.selectOne("mybatis.shop.selectTotal");
        } catch (Throwable t) {
            System.out.println("ShopDAO selectTotal 실패");
            System.out.println(t);
        }
        return result;
    }

    // 삭제
    public int delete(int num) {
        int result = 0;
        try {
            result = sqlSessionTemplate.delete("mybatis.shop.delete", num);
        } catch (Throwable t) {
            System.out.println("ShopDAO delete 실패");
            System.out.println(t);
        }
        return result;
    }

    // 내용 수정
    public int modify(ShopDTO dto) {
        int result = 0;
        try {
            result = sqlSessionTemplate.update("mybatis.shop.modify", dto);
        } catch (Throwable t) {
            System.out.println("ShopDAO modify 실패");
            System.out.println(t);
        }
        return result;
    }

    // 특정 내용 검색 후 갯수
    public int selectTotalSearch(String search) {
        int result = 0;
        search = search;
        try {
            result = sqlSessionTemplate.selectOne("mybatis.shop.selectTotalSearch", search);
        } catch (Throwable throwable) {
            System.out.println("shopDAO selectTotalSearch 실패");
            System.out.println(throwable);
        }
        return result;
    }

    // 특정 내용 검색 후 리스트 출력
    public List<ShopDTO> selectListSearch(int startNum, int endNum, String search) {
        List<ShopDTO> list = new ArrayList<>();
        Map<String, Integer> map = new HashMap<>();
        SearchDTO searchDTO = new SearchDTO();
        searchDTO.setStartNum(startNum);
        searchDTO.setEndNum(endNum);
        searchDTO.setSearch(search);
        try {
            list = sqlSessionTemplate.selectList("mybatis.shop.selectListSearch", searchDTO);
        } catch (Throwable throwable) {
            System.out.println("ShopDAO searchListSearch 실패");
            System.out.println(throwable);
        }
        return list;
    }
}
