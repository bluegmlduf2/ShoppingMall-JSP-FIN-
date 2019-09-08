package com.MAFI.controller;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.MAFI.domain.CategoryVO;
import com.MAFI.domain.GoodsVO;
import com.MAFI.domain.GoodsViewVO;
import com.MAFI.service.AdminService;
import com.MAFI.utils.UploadFileUtils;

import net.sf.json.JSONArray;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/admin/*")
public class AdminController {

	private final static Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	AdminService adminservice;
	
	//Resource어노테이션은  서블릿컨텍스의 자원을"id=uploadPath" 불러온다
	@Resource(name="uploadPath")
	private String uploadPath;
	
	// 관리자화면  get
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public void getIndex() throws Exception {
		logger.info("get index(get)");
	}
	
	// 카테고리 목록
	@RequestMapping(value = "/goods/register", method = RequestMethod.GET)
	public void getGoodsRegister(Model model) throws Exception {
		logger.info("get goods register");
		
		//객체를 json형식으로 변환시켜 view에 전달
		
		List<CategoryVO> category=null;
		category=adminservice.category();
		model.addAttribute("category", JSONArray.fromObject(category));
	}
	
	// 상품등록
	//String을 반환형으로 redirect해주지 않는 경우는 보통 value안에 값을 찾아서 화면을 변경한다
	@RequestMapping(value = "/goods/register", method = RequestMethod.POST)
	public String postGoodsRegister(GoodsVO vo,MultipartFile file) throws Exception {
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if(file != null) {
		 fileName =UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
		} else {
		 fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}

		vo.setGdsImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		vo.setGdsThumbImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		
		adminservice.register(vo);
		return "redirect:/admin/index";
	}
	
	//상품목록
	@RequestMapping(value = "/goods/list", method = RequestMethod.GET)
	public void getGoodsList(Model model) throws Exception {
		logger.info("get goods list");
		
		List<GoodsVO> list=null;
		list=adminservice.goodslist();
		model.addAttribute("list", list);
	}
	
	//상품상세목록
	@RequestMapping(value = "/goods/view", method = RequestMethod.GET)
	public void getGoodsview(@RequestParam("n") int gdsNum,Model model) throws Exception {
		logger.info("get goods view");
		GoodsViewVO goods=adminservice.goodsView(gdsNum);
		
		model.addAttribute("goods", goods);
	}
	
	//상품수정（화면이동/GET)
	@RequestMapping(value = "/goods/modify", method = RequestMethod.GET)
	public void getGoodsModify(@RequestParam("n") int gdsNum,Model model) throws Exception {
		logger.info("get goods modify");
		
		GoodsViewVO goods=adminservice.goodsView(gdsNum);	
		model.addAttribute("goods", goods);
		
		List<CategoryVO> category=null;
		category=adminservice.category();
		model.addAttribute("category",JSONArray.fromObject(category));
	}
	
	//상품수정（정보수정/POST)
	@RequestMapping(value = "/goods/modify", method = RequestMethod.POST)
	public String postGoodsModify(GoodsVO vo) throws Exception {
		logger.info("post goods modify");
		
		adminservice.goodsModify(vo);
		
		return "redirect:/admin/index";
	}
	
	//상품삭제（정보수정/POST)
	@RequestMapping(value = "/goods/delete", method = RequestMethod.POST)
	public String postGoodsDelete(@RequestParam("n") int gdsNum) throws Exception {
		logger.info("post goods delete");
		
		adminservice.goodsDelete(gdsNum);
		
		return "redirect:/admin/index";
	}
}
