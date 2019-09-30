package com.MAFI.persistence;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

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

@Repository
public class shopDAOImpl implements shopDAO{
	@Inject
	private SqlSession sql;

	// 매퍼
	private static String namespace = "com.MAFI.mappers.shopMapper";
	
	//카테고리 상품 리스트 1차 분류
	@Override
	public List<GoodsViewVO> list(int cateCode,int cateCodeRef) throws Exception {
		HashMap<String,Object> map= new HashMap<String,Object>();
		//map.put("cateCode", cateCode);
		map.put("cateCodeRef", cateCodeRef);
		return sql.selectList(namespace+".list_1",map);
	}
	
	//카테고리 상품 리스트 2차 분류
	@Override
	public List<GoodsViewVO> list(int cateCode) throws Exception {
		return sql.selectList(namespace+".list_2",cateCode);
	}
	
	//상품조회
	@Override
	public GoodsViewVO getView(int gdsNum) throws Exception{
		return sql.selectOne("com.MAFI.mappers.adminMapper.goodsView",gdsNum);

	}
	
	//소감작성
	@Override
	public void regisetReply(ReplyVO replyVO) throws Exception{
		sql.insert(namespace+".regisetReply", replyVO); 
	}
	
	//소감 리스트
	@Override
	public List<ReplyListVO> replyList(int gdsNum) throws Exception{
		return sql.selectList(namespace+".replyList", gdsNum); 
	}
	
	//소감 삭제
	@Override
	public void deleteReply(ReplyVO replyVO) throws Exception{
		sql.delete(namespace+".deleteReply", replyVO);
	}

	//아이디 체크
	@Override
	public String idCheck(int repNum) throws Exception{
		return sql.selectOne(namespace+".replyUserIdCheck", repNum);
	}	
	
	//상품소감 수정
	@Override
	public void modifyReply(ReplyVO replyVO) throws Exception{
		sql.update(namespace+".modifyReply", replyVO);
	}
	
	//카트담기
	@Override
	public void addCart(CartVO cartVO) throws Exception{
		sql.insert(namespace+".addCart", cartVO); 
	}
	
	//카트리스트 반환
	@Override
	public List<CartListVO> cartList(String userId) throws Exception{
		return sql.selectList(namespace+".cartList", userId);
	}
	
	//카트리스트 전체삭제
	@Override
	public void deleteCart(CartVO cart) throws Exception{
		 sql.delete(namespace+".deleteCart", cart);
	}
	
	//주문정보
	@Override
	public void orderInfo(OrderVO order) throws Exception{
		sql.insert(namespace+".orderInfo", order); 
	}
	
	//주문상세정보
	@Override
	public void orderInfo_Details(OrderDetailVO order) throws Exception{
		sql.insert(namespace+".orderInfo_Detail", order); 
	}
	
	//카트리스트 전부 삭제
	@Override
	public void cartAllDelete(String userId) throws Exception{
		sql.delete(namespace+".cartAllDelete", userId);
	}
	
	//주문목록
	@Override
	public List<OrderVO> orderList(String userId) throws Exception{
		return sql.selectList(namespace+".orderList", userId);
	}
	
	//주문상세목록
	@Override
	public List<OrderListVO> orderView(OrderVO order) throws Exception{
		return sql.selectList(namespace+".orderView", order);
	}
}
