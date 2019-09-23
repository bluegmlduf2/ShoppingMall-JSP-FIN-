package com.MAFI.persistence;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.MAFI.domain.CategoryVO;
import com.MAFI.domain.GoodsVO;
import com.MAFI.domain.GoodsViewVO;
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
}
