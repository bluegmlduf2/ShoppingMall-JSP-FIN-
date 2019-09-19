package com.MAFI.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.MAFI.domain.GoodsViewVO;

public interface shopService {
	
	//상품별 카테고리 
	public List<GoodsViewVO> list(int cateCode,int level) throws Exception;
	
	//상품 조회 
	public GoodsViewVO getView(int gdsNum) throws Exception;
}
