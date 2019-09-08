package com.MAFI.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.MAFI.domain.MemberVO;

public class AdminInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object obj) throws Exception {

		HttpSession session = req.getSession();
		MemberVO member = (MemberVO) session.getAttribute("member");

		// 멤버객체(로그인정보)가 없을 경우 로그인 화면
		if (member == null) {
			res.sendRedirect("/member/signin");
			return false;
		}

		//관리자가 아닐 경우 메인화면
		if (member.getVerify() != 9) {
			res.sendRedirect("/");
			return false;
		}

		return true;
	}
}