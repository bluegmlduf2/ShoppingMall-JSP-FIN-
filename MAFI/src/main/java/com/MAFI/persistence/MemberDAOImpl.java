package com.MAFI.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.MAFI.domain.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.MAFI.persistence.MemberDAO#signup(com.MAFI.domain.MemberVO)
	 */
	@Inject
	private SqlSession sql;

	// 매퍼
	private static String namespace = "com.MAFI.mappers.memberMapper";

	//회원가입
	@Override
	public void signup(MemberVO vo) throws Exception {
		sql.insert(namespace+".signup",vo);
	}

	//로그인
	@Override
	public MemberVO signin(MemberVO vo) throws Exception {
		return sql.selectOne(namespace+".signin", vo);
	}

}
