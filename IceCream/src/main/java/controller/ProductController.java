package controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import product.dto.ProductDTO;
import service.ProductService;

@Controller
public class ProductController {
	@Autowired
	private ProductService productService;

	// writeForm 이동
	@RequestMapping("/product/writeForm.do")
	public ModelAndView writeForm() {
		System.out.println("********** controller - /product/writeForm.do");

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("req", "product/writeForm.jsp");
		modelAndView.setViewName("/");
		return modelAndView;
	}

	// insert : 게시물 등록
	@RequestMapping("/product/insert.do")
	public ModelAndView insert(HttpServletRequest request, MultipartFile productImg) {
		System.out.println("********** controller - /product/insert.do");

		// 파일
		String filePath = request.getSession().getServletContext().getRealPath("/storage");
		String fileName = productImg.getOriginalFilename();

		System.out.println("filePath ====" + filePath);
		System.out.println("fileName ====" + fileName);

		File file = new File(filePath, fileName);

		try {
			FileCopyUtils.copy(productImg.getInputStream(), new FileOutputStream(file));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		ProductDTO dto = new ProductDTO();
		dto.setName(request.getParameter("name"));
		dto.setExplain(request.getParameter("explain"));
		dto.setProductType(request.getParameter("productType"));
		dto.setFileName(fileName);

		int result = productService.insert(dto);
		System.out.println("db처리결과:::" + result);

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("result", result);
		modelAndView.setViewName("/product/productList.do");
		return modelAndView;
	}

	@RequestMapping(value = "/product/productList.do")
	public ModelAndView productList(HttpServletRequest request) {
		System.out.println("********** controller - /product/productList.do");

		List<ProductDTO> list = productService.selectList();

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("list", list);
		modelAndView.addObject("req", "product/productList.jsp");
		modelAndView.setViewName("../main.jsp");
		return modelAndView;
	}

}
