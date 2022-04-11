package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import service.ShopService;
import shop.dto.ShopDTO;

import javax.servlet.http.HttpServletRequest;

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
}
