package com.MAFI.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.MAFI.domain.CategoryVO;
import com.MAFI.domain.GoodsVO;
import com.MAFI.domain.GoodsViewVO;
import com.MAFI.domain.MemberVO;

public interface AdminService {
	// 카테고리
	public List<CategoryVO> category() throws Exception;
	
	// 상품등록
	public void register(GoodsVO vo) throws Exception;
	
	//상품목록
	public List<GoodsViewVO> goodslist() throws Exception;

	//상품상세목록
	public GoodsViewVO goodsView(int gdsNum)  throws Exception;

	//상품수정
	public void goodsModify(GoodsVO vo)  throws Exception;

	//상품삭제
	public void goodsDelete(int gdsNum)  throws Exception;

}
