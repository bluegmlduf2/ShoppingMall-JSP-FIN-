package com.MAFI.persistence;

import java.util.List;

import com.MAFI.domain.CategoryVO;
import com.MAFI.domain.GoodsVO;
import com.MAFI.domain.GoodsViewVO;

public interface shopDAO {

	// 카테고리 상품 리스트 1차 분류
	public List<GoodsViewVO> list(int cateCode,int cateCodeRef) throws Exception;

	// 카테고리 상품 리스트 2차 분류
	public List<GoodsViewVO> list(int cateCode) throws Exception;

	// 상품조회
	public GoodsViewVO getView(int gdsNum) throws Exception;
}
