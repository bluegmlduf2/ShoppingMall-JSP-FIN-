package com.MAFI.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

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
import com.MAFI.persistence.AdminDAO;
import com.MAFI.persistence.shopDAO;

@Service
public class shopServiceImpl implements shopService {

	@Inject
	private shopDAO dao;

	// 카테고리 별 상품
	@Override
	public List<GoodsViewVO> list(int cateCode, int level) throws Exception {

		int cateCodeRef = 0;

		if (level == 1) {//1차 분류
			cateCodeRef=cateCode;
			return dao.list(cateCode, cateCodeRef);
		} else { //2차분류
			return dao.list(cateCode);
		}
	}

	// 상품 조회
	@Override
	public GoodsViewVO getView(int gdsNum) throws Exception {
		return dao.getView(gdsNum);
	}

	// 소감작성
	@Override
	public void regisetReply(ReplyVO replyVO) throws Exception {
		dao.regisetReply(replyVO);
	}
	
	//소감 리스트
	@Override
	public List<ReplyListVO> replyList(int gdsNum) throws Exception{
		return dao.replyList(gdsNum);
	}
	
	//소감 삭제
	@Override
	public void deleteReply(ReplyVO replyVO) throws Exception{
		dao.deleteReply(replyVO);
	}
	
	//소감 리스트
	@Override
	public String idCheck(int gdsNum) throws Exception{
		return dao.idCheck(gdsNum);
	}
	
	//상품소감 수정
	@Override
	public void modifyReply(ReplyVO replyVO) throws Exception{
		dao.modifyReply(replyVO);
	}
	
	//카트담기
	@Override
	public void addCart(CartVO cartVO) throws Exception{
		dao.addCart(cartVO); 
	}
	
	//카트리스트 반환
	@Override
	public List<CartListVO> cartList(String userId) throws Exception{
		return dao.cartList(userId);
	}
	
	//카트리스트 전체삭제
	@Override
	public void deleteCart(CartVO cart) throws Exception{
		 dao.deleteCart(cart);
	}
	
	//주문상세정보
	@Override
	public void orderInfo(OrderVO order) throws Exception{
		dao.orderInfo(order);
	}
	
	//주문상세정보
	@Override
	public void orderInfo_Details(OrderDetailVO order) throws Exception{
		dao.orderInfo_Details(order); 
	}
	
	//카트리스트 전부 삭제
	@Override
	public void cartAllDelete(String userId) throws Exception{
		dao.cartAllDelete(userId);
	}
	
	//주문목록
	@Override
	public List<OrderVO> orderList(String userId) throws Exception{
		return dao.orderList(userId);
	}
	
	//주문상세목록
	@Override
	public List<OrderListVO> orderView(OrderVO order) throws Exception{
		return dao.orderView(order);
	}
}
