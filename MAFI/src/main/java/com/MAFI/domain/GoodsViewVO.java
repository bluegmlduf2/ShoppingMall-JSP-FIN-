package com.MAFI.domain;

import java.util.Date;
/**
 * 상품정보와 카테고리 정보를 조인해서 가져오는 경우
 */
public class GoodsViewVO {
	
	private int gdsNum;
	private String gdsName;
	private String cateCode;
	private int gdsPrice;
	private int gdsStock;
	private String gdsDes;
	private String gdsImg;
	private Date gdsDate;
	
	private String cateCodeRef;
	private String cateName;
	
	private String gdsThumbImg;
	
	
	/**
	 * @return the gdsNum
	 */
	public int getGdsNum() {
		return gdsNum;
	}
	/**
	 * @param gdsNum the gdsNum to set
	 */
	public void setGdsNum(int gdsNum) {
		this.gdsNum = gdsNum;
	}
	/**
	 * @return the gdsName
	 */
	public String getGdsName() {
		return gdsName;
	}
	/**
	 * @param gdsName the gdsName to set
	 */
	public void setGdsName(String gdsName) {
		this.gdsName = gdsName;
	}
	/**
	 * @return the cateCode
	 */
	public String getCateCode() {
		return cateCode;
	}
	/**
	 * @param cateCode the cateCode to set
	 */
	public void setCateCode(String cateCode) {
		this.cateCode = cateCode;
	}
	/**
	 * @return the gdsPrice
	 */
	public int getGdsPrice() {
		return gdsPrice;
	}
	/**
	 * @param gdsPrice the gdsPrice to set
	 */
	public void setGdsPrice(int gdsPrice) {
		this.gdsPrice = gdsPrice;
	}
	/**
	 * @return the gdsStock
	 */
	public int getGdsStock() {
		return gdsStock;
	}
	/**
	 * @param gdsStock the gdsStock to set
	 */
	public void setGdsStock(int gdsStock) {
		this.gdsStock = gdsStock;
	}
	/**
	 * @return the gdsDes
	 */
	public String getGdsDes() {
		return gdsDes;
	}
	/**
	 * @param gdsDes the gdsDes to set
	 */
	public void setGdsDes(String gdsDes) {
		this.gdsDes = gdsDes;
	}
	/**
	 * @return the gdsImg
	 */
	public String getGdsImg() {
		return gdsImg;
	}
	/**
	 * @param gdsImg the gdsImg to set
	 */
	public void setGdsImg(String gdsImg) {
		this.gdsImg = gdsImg;
	}
	/**
	 * @return the gdsDate
	 */
	public Date getGdsDate() {
		return gdsDate;
	}
	/**
	 * @param gdsDate the gdsDate to set
	 */
	public void setGdsDate(Date gdsDate) {
		this.gdsDate = gdsDate;
	}
	/**
	 * @return the cateCodeRef
	 */
	public String getCateCodeRef() {
		return cateCodeRef;
	}
	/**
	 * @param cateCodeRef the cateCodeRef to set
	 */
	public void setCateCodeRef(String cateCodeRef) {
		this.cateCodeRef = cateCodeRef;
	}
	/**
	 * @return the cateName
	 */
	public String getCateName() {
		return cateName;
	}
	/**
	 * @param cateName the cateName to set
	 */
	public void setCateName(String cateName) {
		this.cateName = cateName;
	}
	/**
	 * @return the gdsThumbImg
	 */
	public String getGdsThumbImg() {
		return gdsThumbImg;
	}
	/**
	 * @param gdsThumbImg the gdsThumbImg to set
	 */
	public void setGdsThumbImg(String gdsThumbImg) {
		this.gdsThumbImg = gdsThumbImg;
	}

	
}
