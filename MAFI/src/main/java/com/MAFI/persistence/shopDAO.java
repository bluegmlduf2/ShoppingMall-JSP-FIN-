package com.MAFI.persistence;

import java.util.List;

import com.MAFI.domain.CategoryVO;
import com.MAFI.domain.GoodsVO;
import com.MAFI.domain.GoodsViewVO;
import com.MAFI.domain.ReplyListVO;
import com.MAFI.domain.ReplyVO;

public interface shopDAO {

	// 카테고리 상품 리스트 1차 분류
	public List<GoodsViewVO> list(int cateCode,int cateCodeRef) throws Exception;

	// 카테고리 상품 리스트 2차 분류
	public List<GoodsViewVO> list(int cateCode) throws Exception;

	// 상품조회
	public GoodsViewVO getView(int gdsNum) throws Exception;
	
	//소감작성
	public void regisetReply(ReplyVO replyVO) throws Exception;
	
	//소감 리스트
	public List<ReplyListVO> replyList(int gdsNum) throws Exception;
	
	//소감삭제
	public void deleteReply(ReplyVO replyVO) throws Exception;
	
	//아이디 체크
	public String idCheck(int repNum) throws Exception;
	
	//상품소감 수정
	public void modifyReply(ReplyVO replyVO) throws Exception;
}
