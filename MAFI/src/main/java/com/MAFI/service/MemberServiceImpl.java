package com.MAFI.service;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.MAFI.domain.MemberVO;
import com.MAFI.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	private MemberDAO dao;
	
	//회원가입
	@Override
	public void signup(MemberVO vo) throws Exception {
		dao.signup(vo);
	}
	
	//로그인
	@Override
	public MemberVO signin(MemberVO vo) throws Exception {
		return dao.signin(vo);
	}

	//로그아웃
	@Override
	public void signout(HttpSession session) throws Exception {
		session.invalidate();
	}

	
}
