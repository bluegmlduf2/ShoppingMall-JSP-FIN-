package com.MAFI.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.MAFI.domain.CategoryVO;
import com.MAFI.domain.GoodsVO;
import com.MAFI.domain.GoodsViewVO;
import com.MAFI.domain.MemberVO;
import com.MAFI.domain.ReplyListVO;
import com.MAFI.domain.ReplyVO;
import com.MAFI.service.AdminService;
import com.MAFI.service.shopService;
import com.MAFI.utils.UploadFileUtils;

import net.sf.json.JSONArray;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/shop/*")
public class shopController {

	private final static Logger logger = LoggerFactory.getLogger(shopController.class);

	@Inject
	shopService service;

	// 카테고리별 상품 리스트
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void getList(@RequestParam("c") int cateCode, @RequestParam("l") int level, Model model) throws Exception {
		logger.info("get llist");

		List<GoodsViewVO> list = null;
		list = service.list(cateCode,level);

		model.addAttribute("list", list);

	}
	
	// 상품조회
	//@RequestMapping(value = "/view", method = {RequestMethod.GET,RequestMethod.POST})
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public void getView(@RequestParam("n") int gdsNum,Model model) throws Exception {
		logger.info("get view");
		//상품조회
		GoodsViewVO view =service.getView(gdsNum);
		model.addAttribute("view", view);
		
		//상품평조회,상품평을 남긴 회원들중 현재상품과 일치하는 정보가 있을떄 조회
		/*List<ReplyListVO> reply =service.replyList(gdsNum);
		model.addAttribute("reply", reply);*/
	}
	
	//상품평추가후 상품조회 재실행
	@ResponseBody
	@RequestMapping(value = "/view/registReply", method = RequestMethod.POST)
	public void registReply(ReplyVO reply,HttpSession session) throws Exception {
		logger.info("regiset Reply");
		
		MemberVO member=(MemberVO)session.getAttribute("member");
		reply.setUserId(member.getUserid());
		
		service.regisetReply(reply);
		
		//리다이렉트는 get형태의 전송
		//return "redirect:/shop/view?n="+reply.getGdsNum();
	}
	
	// 상품평조회
	@ResponseBody
	@RequestMapping(value = "/view/replyList", method = RequestMethod.GET)
	public List<ReplyListVO> getReplyList(@RequestParam("n") int gdsNum) throws Exception {
		logger.info("getReplyList");

		//상품평조회,상품평을 남긴 회원들중 현재상품과 일치하는 정보가 있을떄 조회
		List<ReplyListVO> reply =service.replyList(gdsNum);
		return reply;
	}

}
