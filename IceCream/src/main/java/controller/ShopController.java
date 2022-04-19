package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import service.ShopService;
import shop.dto.ShopDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.util.List;

@Controller
public class ShopController {
    @Autowired
    ShopService service;

    @RequestMapping(value = "/shop/writeForm.do")
    public ModelAndView writeForm(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("req", "shop/writeForm.jsp");
        modelAndView.setViewName("/");

        return modelAndView;
    }

    @RequestMapping(value = "/shop/write.do")
    public ModelAndView write(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        // 데이터 처리
        try {
            request.setCharacterEncoding("utf-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        String tel1 = request.getParameter("tel1");
        String tel2 = request.getParameter("tel2");
        String tel3 = request.getParameter("tel3");
        String name = request.getParameter("name");

        String addr1 = request.getParameter("addr1");
        String addr2 = request.getParameter("addr2");
        String addr3 = request.getParameter("addr3");
        String addr4 = request.getParameter("addr4");

        System.out.println("-------------------------");
        System.out.println("addr1 : " + addr1);
        System.out.println("addr2 : " + addr2);
        System.out.println("addr3 : " + addr3);
        System.out.println("addr4 : " + addr4);


        String tel = tel1 + "-" + tel2 + "-" + tel3;
        ShopDTO dto = new ShopDTO();
        dto.setName(name);
        dto.setTel(tel);
        dto.setAddr1(addr1);
        dto.setAddr2(addr2);
        dto.setAddr3(addr3);
        dto.setAddr4(addr4);


        int result = service.insert(dto);

        // 뷰처리
        modelAndView.addObject("req", "shop/write.jsp");
        modelAndView.addObject("result", result);
        modelAndView.setViewName("/");

        return modelAndView;
    }

    // 기술 테스트용 list.do
    @RequestMapping(value = "/shop/list.do")
    public ModelAndView list(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        // 데이터 처리
        int pg = 1;
        if(request.getParameter("pg") != null){
            pg = Integer.parseInt(request.getParameter("pg"));
        }

        int startPage = 0;
        int endPage = 0;
        // 한 페이지당 표현할 게시글 수
        int INDEX_COUNT = 5;
        // 페이지 표시할 갯수
        int VIEW_PAGE_COUNT = 3;
        // 전체 계정 갯수
        int LIST_COUNT = service.selectTotal();
        // 총 페이지 갯수
        int TOTAL_PAGE = (LIST_COUNT + (INDEX_COUNT - 1)) / INDEX_COUNT;
        // 스타트 페이지
        startPage = (pg - 1) / VIEW_PAGE_COUNT * VIEW_PAGE_COUNT + 1;
        // 마지막 페이지
        endPage = startPage + (VIEW_PAGE_COUNT - 1);
        if (endPage > TOTAL_PAGE) endPage = TOTAL_PAGE;

        // 한페이지당 게시물
        int startNum = INDEX_COUNT * (pg - 1) + 1;
        int endNum = INDEX_COUNT * pg;

        if (startNum == LIST_COUNT) {
            endNum = startNum;
        } else if (endNum >= LIST_COUNT) {
            endNum = LIST_COUNT;
        }

        List<ShopDTO> list = service.selectList(startNum, endNum);

        // 파라미터 공유
        modelAndView.addObject("pg", pg);
        modelAndView.addObject("startPage", startPage);
        modelAndView.addObject("endPage", endPage);
        modelAndView.addObject("VIEW_PAGE_COUNT", VIEW_PAGE_COUNT);
        modelAndView.addObject("TOTAL_PAGE", TOTAL_PAGE);
        modelAndView.addObject("list", list);

        modelAndView.addObject("req", "shop/sampleList.jsp");
        modelAndView.setViewName("/");

        return modelAndView;
    }

    // 메인페이지용
    @RequestMapping(value = "/shop/shopList.do")
    public ModelAndView shopList(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        // 데이터 처리
        int pg = 1;
        if(request.getParameter("pg") != null){
            pg = Integer.parseInt(request.getParameter("pg"));
        }
        String search = null;
        if(request.getParameter("search") != null) {
            search = request.getParameter("search");
        }

        int startPage = 0;
        int endPage = 0;
        // 한 페이지당 표현할 게시글 수
        int INDEX_COUNT = 5;
        // 페이지 표시할 갯수
        int VIEW_PAGE_COUNT = 3;

        // 검색어가 있다면
        if(search != null) {
            // 전체 계정 갯수
            int LIST_COUNT = service.selectTotalSearch(search);
            // 총 페이지 갯수
            int TOTAL_PAGE = (LIST_COUNT + (INDEX_COUNT - 1)) / INDEX_COUNT;
            // 스타트 페이지
            startPage = (pg - 1) / VIEW_PAGE_COUNT * VIEW_PAGE_COUNT + 1;
            // 마지막 페이지
            endPage = startPage + (VIEW_PAGE_COUNT - 1);
            if (endPage > TOTAL_PAGE) endPage = TOTAL_PAGE;

            // 한페이지당 게시물
            int startNum = INDEX_COUNT * (pg - 1) + 1;
            int endNum = INDEX_COUNT * pg;

            if (startNum == LIST_COUNT) {
                endNum = startNum;
            } else if (endNum >= LIST_COUNT) {
                endNum = LIST_COUNT;
            }

            List<ShopDTO> list = service.selectListSearch(startNum, endNum, search);

            // 파라미터 공유
            modelAndView.addObject("pg", pg);
            modelAndView.addObject("startPage", startPage);
            modelAndView.addObject("endPage", endPage);
            modelAndView.addObject("VIEW_PAGE_COUNT", VIEW_PAGE_COUNT);
            modelAndView.addObject("TOTAL_PAGE", TOTAL_PAGE);
            modelAndView.addObject("list", list);
            modelAndView.addObject("search", search);


            System.out.println("--------------------------------------------------");
            System.out.println("search : " + search);
            System.out.println("pg : " + pg);
            System.out.println("startPage : " + startPage);
            System.out.println("endPage : " + endPage);
            System.out.println("startNum : " + startNum);
            System.out.println("endNum : " + endNum);
            System.out.println("VIEW_PAGE_COUNT : " + VIEW_PAGE_COUNT);
            System.out.println("TOTAL_PAGE : " + TOTAL_PAGE);
            System.out.println("list : " + list);

            modelAndView.addObject("req", "shop/list.jsp");
        } else { // 검색어가 없다면 기존대로
            // 전체 계정 갯수
            int LIST_COUNT = service.selectTotal();
            // 총 페이지 갯수
            int TOTAL_PAGE = (LIST_COUNT + (INDEX_COUNT - 1)) / INDEX_COUNT;
            // 스타트 페이지
            startPage = (pg - 1) / VIEW_PAGE_COUNT * VIEW_PAGE_COUNT + 1;
            // 마지막 페이지
            endPage = startPage + (VIEW_PAGE_COUNT - 1);
            if (endPage > TOTAL_PAGE) endPage = TOTAL_PAGE;

            // 한페이지당 게시물
            int startNum = INDEX_COUNT * (pg - 1) + 1;
            int endNum = INDEX_COUNT * pg;

            if (startNum == LIST_COUNT) {
                endNum = startNum;
            } else if (endNum >= LIST_COUNT) {
                endNum = LIST_COUNT;
            }

            List<ShopDTO> list = service.selectList(startNum, endNum);

            // 파라미터 공유
            modelAndView.addObject("pg", pg);
            modelAndView.addObject("startPage", startPage);
            modelAndView.addObject("endPage", endPage);
            modelAndView.addObject("VIEW_PAGE_COUNT", VIEW_PAGE_COUNT);
            modelAndView.addObject("TOTAL_PAGE", TOTAL_PAGE);
            modelAndView.addObject("list", list);

            modelAndView.addObject("req", "shop/list.jsp");
        }

        modelAndView.setViewName("../main.jsp");

        return modelAndView;
    }

    @RequestMapping(value = "/shop/view.do")
    public ModelAndView shopView(HttpServletRequest request) {
        // 파라미터 파싱
        int pg = Integer.parseInt(request.getParameter("pg"));
        String search = null;
        if(request.getParameter("search") != null)
            search = request.getParameter("search");
        int num = Integer.parseInt(request.getParameter("num"));

        // 데이터 처리
        ShopDTO dto = service.selectOne(num);

        // 뷰처리 및 파라미터 공유
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("pg", pg);
        modelAndView.addObject("search", search);
        modelAndView.addObject("dto", dto);
        modelAndView.addObject("req", "shop/view.jsp");
        modelAndView.setViewName("../main.jsp");

        return modelAndView;
    }

}
