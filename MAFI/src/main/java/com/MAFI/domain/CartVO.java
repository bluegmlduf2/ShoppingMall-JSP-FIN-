package com.MAFI.domain;

import java.util.Date;

public class CartVO {
	private int cartNum;
	private String userId;
	private int gdsNum;
	private int cartStock;
	private Date addDate;
	/**
	 * @return the cartNum
	 */
	public int getCartNum() {
		return cartNum;
	}
	/**
	 * @param cartNum the cartNum to set
	 */
	public void setCartNum(int cartNum) {
		this.cartNum = cartNum;
	}
	/**
	 * @return the userId
	 */
	public String getUserId() {
		return userId;
	}
	/**
	 * @param userId the userId to set
	 */
	public void setUserId(String userId) {
		this.userId = userId;
	}
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
	 * @return the cartStock
	 */
	public int getCartStock() {
		return cartStock;
	}
	/**
	 * @param cartStock the cartStock to set
	 */
	public void setCartStock(int cartStock) {
		this.cartStock = cartStock;
	}
	/**
	 * @return the addDate
	 */
	public Date getAddDate() {
		return addDate;
	}
	/**
	 * @param addDate the addDate to set
	 */
	public void setAddDate(Date addDate) {
		this.addDate = addDate;
	}
	

}
