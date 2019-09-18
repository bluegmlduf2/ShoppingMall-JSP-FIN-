package com.MAFI.persistence;

import java.util.List;

import com.MAFI.domain.CategoryVO;
import com.MAFI.domain.GoodsVO;
import com.MAFI.domain.GoodsViewVO;

public interface AdminDAO {
	//카테고리
	public List<CategoryVO> category() throws Exception;

	//상품등록
	public void register(GoodsVO vo) throws Exception;

	//상품목록
	public List<GoodsViewVO> goodslist() throws Exception;

	//상품상세목록
	public GoodsViewVO goodsView(int gdsNum) throws Exception;
	
	//상품상세수정
	public void goodsModify(GoodsVO vo) throws Exception;
	
	//상품삭제
	public void goodsDelete(int gdsNum) throws Exception;
	
}
