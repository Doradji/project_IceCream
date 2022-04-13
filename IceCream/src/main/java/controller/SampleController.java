package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
}
