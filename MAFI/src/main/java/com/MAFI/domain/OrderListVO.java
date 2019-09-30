package com.MAFI.domain;

import java.util.Date;

public class OrderListVO {

	private String orderId;
	private String userId;
	private String orderRec;
	private String userAddr1;
	private String userAddr2;
	private String userAddr3;
	private String orderPhon;
	private int amount;
	private Date orderDate;
	
	private int orderDetailNum;
	private int gdsNum;
	private int cartStock;
	
	private String gdsName;
	private String gdsThumbImg;
	private int gdsPrice;
	
	private String delivery;
	
	
	/**
	 * @return the delivery
	 */
	public String getDelivery() {
		return delivery;
	}
	/**
	 * @param delivery the delivery to set
	 */
	public void setDelivery(String delivery) {
		this.delivery = delivery;
	}
	/**
	 * @return the orderId
	 */
	public String getOrderId() {
		return orderId;
	}
	/**
	 * @param orderId the orderId to set
	 */
	public void setOrderId(String orderId) {
		this.orderId = orderId;
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
	 * @return the orderRec
	 */
	public String getOrderRec() {
		return orderRec;
	}
	/**
	 * @param orderRec the orderRec to set
	 */
	public void setOrderRec(String orderRec) {
		this.orderRec = orderRec;
	}
	/**
	 * @return the userAddr1
	 */
	public String getUserAddr1() {
		return userAddr1;
	}
	/**
	 * @param userAddr1 the userAddr1 to set
	 */
	public void setUserAddr1(String userAddr1) {
		this.userAddr1 = userAddr1;
	}
	/**
	 * @return the userAddr2
	 */
	public String getUserAddr2() {
		return userAddr2;
	}
	/**
	 * @param userAddr2 the userAddr2 to set
	 */
	public void setUserAddr2(String userAddr2) {
		this.userAddr2 = userAddr2;
	}
	/**
	 * @return the userAddr3
	 */
	public String getUserAddr3() {
		return userAddr3;
	}
	/**
	 * @param userAddr3 the userAddr3 to set
	 */
	public void setUserAddr3(String userAddr3) {
		this.userAddr3 = userAddr3;
	}
	/**
	 * @return the orderPhon
	 */
	public String getOrderPhon() {
		return orderPhon;
	}
	/**
	 * @param orderPhon the orderPhon to set
	 */
	public void setOrderPhon(String orderPhon) {
		this.orderPhon = orderPhon;
	}
	/**
	 * @return the amount
	 */
	public int getAmount() {
		return amount;
	}
	/**
	 * @param amount the amount to set
	 */
	public void setAmount(int amount) {
		this.amount = amount;
	}
	/**
	 * @return the orderDate
	 */
	public Date getOrderDate() {
		return orderDate;
	}
	/**
	 * @param orderDate the orderDate to set
	 */
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	/**
	 * @return the orderDetailNum
	 */
	public int getOrderDetailNum() {
		return orderDetailNum;
	}
	/**
	 * @param orderDetailNum the orderDetailNum to set
	 */
	public void setOrderDetailNum(int orderDetailNum) {
		this.orderDetailNum = orderDetailNum;
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


}
