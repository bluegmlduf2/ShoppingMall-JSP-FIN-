package com.MAFI.domain;

import java.util.Date;

public class OrderVO {

	private String orderId;
	private String userId;
	private String orderRec;
	private String userAddr1;
	private String userAddr2;
	private String userAddr3;
	private String orderPhon;
	private int amount;
	private Date orderDate;
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
	 * @return the orderPhone
	 */

	/**
	 * @return the amount
	 */
	public int getAmount() {
		return amount;
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

}
