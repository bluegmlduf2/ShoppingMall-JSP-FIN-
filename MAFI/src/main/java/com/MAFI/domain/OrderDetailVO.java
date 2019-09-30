package com.MAFI.domain;

public class OrderDetailVO {

	private int orderDetailNum;
	private String orderId;
	private int gdsNum;
	private int cartStock;
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
	
}
