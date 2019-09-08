package com.MAFI.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.MAFI.domain.MemberVO;
import com.MAFI.service.MemberService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/member/*")
public class MemberController {

	private final static Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Inject
	MemberService service;

	// 회원 가입 get
	// a태그 사용시 get으로 넘어감
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public void getSignup() throws Exception {
		logger.info("get signup(get)");
	}

	// 회원 가입 post
	// 실제 회원가입 input태그
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String postSignup(MemberVO vo) throws Exception {
		logger.info("post signup(post)");

		/* 암호화 생략 */

		service.signup(vo);

		return "redirect:/";
	}

	
	// 로그인  get
	@RequestMapping(value = "/signin", method = RequestMethod.GET)
	public void getSignin() throws Exception {
	 logger.info("get signin");
	}
	
	// 로그인 post
	@RequestMapping(value = "/signin", method = RequestMethod.POST)
	public String postSignin(MemberVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
		logger.info("post signin");

		MemberVO login = service.signin(vo);
		HttpSession session = req.getSession();

		boolean passMatch = false;
		
		//NULL체크 후 비번 비교
		if(login !=null && !login.equals("")) {
			if (vo.getUserpass().equals(login.getUserpass())) {
				passMatch = true;
			}
		}
		
		//비번맞을시 값을 넣고 아니면 로그인화면으로 리다이렉션
		if (passMatch) {
			//jsp페이지에 member변수에 VO를 담아서 넘긴다
			session.setAttribute("member", login); 
		} else {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
			return "redirect:/member/signin";
		}

		return "redirect:/";
	}

	// 로그아웃
	@RequestMapping(value = "/signout", method = RequestMethod.GET)
	public String signout(HttpSession session) throws Exception {
		logger.info("get logout");

		service.signout(session);

		return "redirect:/";
	}
}
