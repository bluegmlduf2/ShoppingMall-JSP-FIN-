package com.MAFI.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.MAFI.domain.CategoryVO;
import com.MAFI.domain.GoodsVO;
import com.MAFI.domain.GoodsViewVO;
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
	
	//상품 조회 
	public GoodsViewVO getView(int gdsNum) throws Exception{
		return dao.getView(gdsNum);
	}
}
