package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;

@Controller
public class SampleController {
    @RequestMapping("/sample/sample.do")
    public ModelAndView sampleWriteForm() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("req", "sample/sample.jsp");
        modelAndView.setViewName("/");

        return modelAndView;
    }

    @RequestMapping(value = "/sample/sampleMapDefault.do")
    public ModelAndView sampleMapDefault() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("req", "sample/mapDefault.jsp");
        modelAndView.setViewName("/");

        return modelAndView;
    }

    @RequestMapping(value = "/sample/sampleMapMarker.do")
    public ModelAndView sampleMapMarker() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("req", "sample/mapMarker.jsp");
        modelAndView.setViewName("/");

        return modelAndView;
    }

    @RequestMapping(value = "/sample/sampleAddress.do")
    public ModelAndView sampleAddress() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("req", "sample/address.jsp");
        modelAndView.setViewName("/");

        return modelAndView;
    }

    @RequestMapping(value = "/sample/sampleSmartEditor.do")
    public ModelAndView sampleSmartEditor() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("req", "sample/sampleWriteForm.jsp");
        modelAndView.setViewName("/");

        return modelAndView;
    }

    @RequestMapping(value = "/sample/writeResultDefault.do")
    public ModelAndView sampleSmartEditorDefault(HttpServletRequest request) {
        // 데이터 처리
        try {
            request.setCharacterEncoding("UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        String ir1 = request.getParameter("ir1");

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("req", "sample/writeResult.jsp");
        modelAndView.addObject("ir1", ir1);
        modelAndView.setViewName("/");

        return modelAndView;
    }

    @RequestMapping(value = "/sample/sendMail.do")
    public ModelAndView sendMail(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/");
        modelAndView.addObject("req", "sample/sendMail.jsp");

        return modelAndView;
    }

    @RequestMapping(value = "/sample/sendMailOk.do")
    public ModelAndView sendMailOk(HttpServletRequest request){
        // 데이터 처리

        // 뷰처리 및 데이터 공유
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("req", "sample/sendMailOk.jsp");
        modelAndView.setViewName("/");

        return modelAndView;
    }

}
