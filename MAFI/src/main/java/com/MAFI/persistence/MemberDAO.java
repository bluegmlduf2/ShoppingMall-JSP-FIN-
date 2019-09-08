package com.MAFI.persistence;

import com.MAFI.domain.MemberVO;

public interface MemberDAO {
	//회원가입
	public void signup(MemberVO vo) throws Exception;
	//로그인
	public MemberVO signin(MemberVO vo) throws Exception;
}
