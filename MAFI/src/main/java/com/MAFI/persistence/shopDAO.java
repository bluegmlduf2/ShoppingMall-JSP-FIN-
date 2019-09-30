package com.MAFI.persistence;

import java.util.List;

import com.MAFI.domain.CartListVO;
import com.MAFI.domain.CartVO;
import com.MAFI.domain.CategoryVO;
import com.MAFI.domain.GoodsVO;
import com.MAFI.domain.GoodsViewVO;
import com.MAFI.domain.OrderDetailVO;
import com.MAFI.domain.OrderListVO;
import com.MAFI.domain.OrderVO;
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
	
	//카트담기
	public void addCart(CartVO cartVO) throws Exception;
	
	//카트리스트 반환
	public List<CartListVO> cartList(String userId) throws Exception;
	
	//카트리스트 전체삭제
	public void deleteCart(CartVO cart) throws Exception;
	
	//주문정보
	public void orderInfo(OrderVO order) throws Exception;
	
	//주문상세정보
	public void orderInfo_Details(OrderDetailVO order) throws Exception;
	
	//카트리스트 전부 삭제
	public void cartAllDelete(String userId) throws Exception;
	
	//주문목록
	public List<OrderVO> orderList(String userId) throws Exception;
	
	//주문상세목록
	public List<OrderListVO> orderView(OrderVO order) throws Exception;
}
