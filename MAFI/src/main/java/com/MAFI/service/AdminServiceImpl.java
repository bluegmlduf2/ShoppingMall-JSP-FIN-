package com.MAFI.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.MAFI.domain.CategoryVO;
import com.MAFI.domain.GoodsVO;
import com.MAFI.domain.GoodsViewVO;
import com.MAFI.domain.OrderListVO;
import com.MAFI.domain.OrderVO;
import com.MAFI.persistence.AdminDAO;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Inject
	private AdminDAO dao;
	
	//카테고리
	@Override
	public List<CategoryVO> category() throws Exception {
		return dao.category();
	}

	//상품등록
	@Override
	public void register(GoodsVO vo) throws Exception {
		dao.register(vo);
	}

	//상품목록
	@Override
	public List<GoodsViewVO> goodslist() throws Exception {
		return dao.goodslist();
	}

	//상품상세목록
	@Override
	public GoodsViewVO goodsView(int gdsNum)  throws Exception {
		return dao.goodsView(gdsNum);
	}

	//상품수정
	@Override
	public void goodsModify(GoodsVO vo) throws Exception {
		dao.goodsModify(vo);
	}

	//상품삭제
	@Override
	public void goodsDelete(int gdsNum) throws Exception {
		dao.goodsDelete(gdsNum);
	}
	
	//주문목록
	@Override
	public List<OrderVO> orderList() throws Exception{
		return dao.orderList();
	}
	
	//주문상세목록
	@Override
	public List<OrderListVO> orderView(OrderVO order) throws Exception{
		return dao.orderView(order);
	}
	
	//주문상태수정
	@Override
	public void delivery(OrderVO order) throws Exception{
		dao.delivery(order);
	}
}
