package com.MAFI.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.MAFI.domain.CategoryVO;
import com.MAFI.domain.GoodsVO;
import com.MAFI.domain.GoodsViewVO;
import com.MAFI.domain.OrderListVO;
import com.MAFI.domain.OrderVO;
import com.MAFI.domain.ReplyListVO;
import com.MAFI.domain.ReplyVO;

@Repository
public class AdminDAOImpl implements AdminDAO{
	@Inject
	private SqlSession sql;

	// 매퍼
	private static String namespace = "com.MAFI.mappers.adminMapper";
	
	//카테고리 반환
	@Override
	public List<CategoryVO> category() throws Exception {
		return sql.selectList(namespace+".category");
	}

	//상품등록
	@Override
	public void register(GoodsVO vo) throws Exception {
		sql.insert(namespace+".register",vo);
	}

	//상품목록
	@Override
	public List<GoodsViewVO> goodslist() throws Exception {
		return sql.selectList(namespace+".goodslist");
	}

	//상품목록상세
	@Override
	public GoodsViewVO goodsView(int gdsNum) throws Exception {
		return sql.selectOne(namespace+".goodsView", gdsNum);
	}

	//상품목록수정
	@Override
	public void goodsModify(GoodsVO vo) throws Exception {
		sql.update(namespace+".goodsModify", vo);
	}

	//상품삭제
	@Override
	public void goodsDelete(int gdsNum) throws Exception {
		sql.delete(namespace+".goodDelete", gdsNum);
	}

	//주문목록
	@Override
	public List<OrderVO> orderList() throws Exception{
		return sql.selectList(namespace+".orderList");
	}
	
	//주문상세목록
	@Override
	public List<OrderListVO> orderView(OrderVO order) throws Exception{
		return sql.selectList(namespace+".orderView", order);
	}

	//주문상태수정
	@Override
	public void delivery(OrderVO order) throws Exception {
		sql.update(namespace+".delivery", order);
	}
	
	//배송완료시 상품수량 조절
	@Override
	public void changeStock(GoodsVO vo) throws Exception {
		sql.update(namespace+".changeStock", vo);
	}
	
	//모든 소감
	@Override
	public List<ReplyListVO> allReply() throws Exception{
		return sql.selectList(namespace+".allReply");
	}
	
	//선택 소감 삭제
	@Override
	public void deleteReply(int repNum) throws Exception {
		sql.delete(namespace+".deleteReply", repNum);
	}
}
