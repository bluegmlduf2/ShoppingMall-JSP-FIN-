package com.MAFI.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.Calendar;
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

import com.MAFI.domain.CartListVO;
import com.MAFI.domain.CartVO;
import com.MAFI.domain.CategoryVO;
import com.MAFI.domain.GoodsVO;
import com.MAFI.domain.GoodsViewVO;
import com.MAFI.domain.MemberVO;
import com.MAFI.domain.OrderDetailVO;
import com.MAFI.domain.OrderListVO;
import com.MAFI.domain.OrderVO;
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
		list = service.list(cateCode, level);

		model.addAttribute("list", list);

	}

	// 상품조회
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public void getView(@RequestParam("n") int gdsNum, Model model) throws Exception {
		logger.info("get view");
		// 상품조회
		GoodsViewVO view = service.getView(gdsNum);
		model.addAttribute("view", view);

		// 상품평조회,상품평을 남긴 회원들중 현재상품과 일치하는 정보가 있을떄 조회
		/*
		 * List<ReplyListVO> reply =service.replyList(gdsNum);
		 * model.addAttribute("reply", reply);
		 */
	}

	// 상품평추가후 상품조회 재실행
	@ResponseBody // 전달받는 데이터의 형태가 JSON일 경우 사용
	@RequestMapping(value = "/view/registReply", method = RequestMethod.POST)
	public void registReply(ReplyVO reply, HttpSession session) throws Exception {
		logger.info("regiset Reply");

		MemberVO member = (MemberVO) session.getAttribute("member");
		reply.setUserId(member.getUserid());

		service.regisetReply(reply);

		// ajxa를 추가전에는 url이 /view였다. 그리고 현재 메서드 호출 뒤 리다이렉트로 위의 /view의 get형식으로 재호출했었다
		// 리다이렉트는 get형태의 전송
		// return "redirect:/shop/view?n="+reply.getGdsNum();
	}

	// 상품평조회
	@ResponseBody
	@RequestMapping(value = "/view/replyList", method = RequestMethod.GET)
	public List<ReplyListVO> deleteReplyList(@RequestParam("n") int gdsNum) throws Exception {
		logger.info("getReplyList");

		// 상품평조회,상품평을 남긴 회원들중 현재상품과 일치하는 정보가 있을떄 조회
		List<ReplyListVO> reply = service.replyList(gdsNum);
		return reply;
	}

	// 상품평 삭제
	@ResponseBody
	@RequestMapping(value = "/view/deleteReply", method = RequestMethod.POST)
	public int deleteReply(ReplyVO reply, HttpSession session) throws Exception {
		logger.info("deleteReply");

		int result = 0;

		MemberVO member = (MemberVO) session.getAttribute("member");
		String userId = service.idCheck(reply.getRepNum());
		try {
			if (member.getUserid().equals(userId)) {
				reply.setUserId(member.getUserid());
				service.deleteReply(reply);

				result = 1;
			}
		} catch (NullPointerException e) {
			System.out.println("로그인되지 않은 비정상적인 접근 ID:" + e.getMessage());
			throw e;
		}

		return result;
	}

	// 상품평 수정
	@ResponseBody
	@RequestMapping(value = "/view/modifyReply", method = RequestMethod.POST)
	public int modifyReply(ReplyVO reply, HttpSession session) throws Exception {
		logger.info("post ModifyReply");

		int result = 0;

		MemberVO member = (MemberVO) session.getAttribute("member");
		String userId = service.idCheck(reply.getRepNum());
		try {
			if (member.getUserid().equals(userId)) {
				reply.setUserId(member.getUserid());
				service.modifyReply(reply);
				result = 1;
			}
		} catch (NullPointerException e) {
			System.out.println("로그인되지 않은 비정상적인 접근 ID:" + e.getMessage());
			throw e;
		}
		return result;
	}

	// 상품평추가후 상품조회 재실행
	// @ResponseBody는 반환시 뷰 페이지를 응답하지 않고 return 값을 그대로 반환하겠다..원래는 데이터처리도하고 뷰페이지도
	// 반환하지만 그 작업은 하지않겠다는 뜻
	@ResponseBody // 컨트롤러에서 전달받는 데이터의 형태가 AJAX로 JSON일 경우 사용
	@RequestMapping(value = "/view/addCart", method = RequestMethod.POST)
	public int addCart(CartVO cartVO, HttpSession session) throws Exception {
		logger.info("post addCart");

		int result = 0;

		MemberVO member = (MemberVO) session.getAttribute("member");

		if (member != null) {
			cartVO.setUserId(member.getUserid());
			service.addCart(cartVO);
			result = 1;
		}

		return result;
	}

	// 카트목록조회
	@RequestMapping(value = "/cartList", method = RequestMethod.GET)
	public void getCartList(Model model, HttpSession session) throws Exception {
		logger.info("getCartList");

		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String userId = memberVO.getUserid();
		List<CartListVO> cartList = service.cartList(userId);

		model.addAttribute("cartList", cartList);
	}

	// 카트리스트 전체삭제
	// 뷰에서 리스트로 받아올떄 리퀘스트 파람을 이용해서 리스트 형태로 받아온다
	@ResponseBody // 컨트롤러에서 전달받는 데이터의 형태가 AJAX로 JSON일 경우 사용
	@RequestMapping(value = "/deleteCart", method = RequestMethod.POST)
	public int deleteCart(HttpSession session, @RequestParam(value = "chbox[]") List<String> chArr, CartVO cart)
			throws Exception {
		logger.info("post deleteCart");
		int result = 0;
		int cartNum = 0;

		MemberVO member = (MemberVO) session.getAttribute("member");
		String userId = member.getUserid();

		if (member != null) {
			cart.setUserId(userId);
			for (String arr : chArr) {
				cartNum = Integer.parseInt(arr);
				cart.setCartNum(cartNum);
				service.deleteCart(cart);
			}
			result = 1;
		}

		return result;
	}

	// 뷰에서 form태그 action 없이 cartList재호출함
	@RequestMapping(value = "/cartList", method = RequestMethod.POST)
	public String order(HttpSession session, OrderVO order, OrderDetailVO orderDetail) throws Exception {
		logger.info("post order");

		MemberVO member = (MemberVO) session.getAttribute("member");
		String userId = member.getUserid();

		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String ymd = ym + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String subNum = "";

		for (int i = 1; i <= 6; i++) {
			subNum += (int) (Math.random() * 10);
		}

		String orderId = ymd + "_" + subNum;

		order.setOrderId(orderId);
		order.setUserId(userId);

		service.orderInfo(order);

		orderDetail.setOrderId(orderId);
		service.orderInfo_Details(orderDetail);

		service.cartAllDelete(userId);

		return "redirect:/shop/orderList";
	}

	//주문리스트
	@RequestMapping(value = "/orderList", method = RequestMethod.GET)
	public void getOrderList(HttpSession session, OrderVO order, Model model) throws Exception {
		logger.info("getOrderList");

		MemberVO member = (MemberVO) session.getAttribute("member");
		String userId = member.getUserid();

		order.setUserId(userId);

		List<OrderVO> orderList = service.orderList(userId);

		model.addAttribute("orderList", orderList);
	}

	//주문상세리스트
	@RequestMapping(value = "/orderView", method = RequestMethod.GET)
	public void getOrderList(HttpSession session, 
							@RequestParam("n") String orderId,
							 OrderVO order, Model model)throws Exception {
		logger.info("getOrderView");

		MemberVO member = (MemberVO) session.getAttribute("member");
		String userId = member.getUserid();

		order.setUserId(userId);
		order.setOrderId(orderId);
		List<OrderListVO> orderView = service.orderView(order);

		model.addAttribute("orderView", orderView);
	}

}
