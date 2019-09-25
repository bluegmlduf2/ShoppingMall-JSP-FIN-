package com.MAFI.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.MAFI.domain.GoodsViewVO;
import com.MAFI.domain.ReplyListVO;
import com.MAFI.domain.ReplyVO;

public interface shopService {
	
	//상품별 카테고리 
	public List<GoodsViewVO> list(int cateCode,int level) throws Exception;
	
	//상품 조회 
	public GoodsViewVO getView(int gdsNum) throws Exception;
	
	//소감작성
	public void regisetReply(ReplyVO replyVO) throws Exception;
	
	//소감 리스트
	public List<ReplyListVO> replyList(int gdsNum) throws Exception;
	
	//소감삭제
	public void deleteReply(ReplyVO replyVO) throws Exception;
	
	//아이디체크 
	public String idCheck(int gdsNum) throws Exception;
	
	//상품소감 수정
	public void modifyReply(ReplyVO replyVO) throws Exception;
}
