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
        String addr = request.getParameter("addr");
        String tel = tel1 + "-" + tel2 + "-" + tel3;
        ShopDTO dto = new ShopDTO();
        dto.setName(name);
        dto.setTel(tel);
        dto.setAddr(addr);

        int result = service.insert(dto);

        // 뷰처리
        modelAndView.addObject("req", "shop/write.jsp");
        modelAndView.addObject("result", result);
        modelAndView.setViewName("/");

        return modelAndView;
    }

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
        modelAndView.addObject("startNum", startNum);
        modelAndView.addObject("endNum", endNum);
        modelAndView.addObject("VIEW_PAGE_COUNT", VIEW_PAGE_COUNT);
        modelAndView.addObject("TOTAL_PAGE", TOTAL_PAGE);
        modelAndView.addObject("list", list);

        modelAndView.addObject("req", "shop/list.jsp");
        modelAndView.setViewName("/");

        return modelAndView;
    }
}