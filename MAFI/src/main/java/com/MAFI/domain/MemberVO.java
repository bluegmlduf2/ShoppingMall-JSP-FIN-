package com.MAFI.domain;

import java.util.Date;

public class MemberVO {
	private String userid;
	private String userpass;
	private String username;
	private String userphon;
	private String useraddr1;
	private String useraddr2;
	private String useraddr3;
	private Date regidate;
	private int verify;
	
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpass() {
		return userpass;
	}
	public void setUserpass(String userpass) {
		this.userpass = userpass;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUserphon() {
		return userphon;
	}
	public void setUserphon(String userphon) {
		this.userphon = userphon;
	}
	public String getUseraddr1() {
		return useraddr1;
	}
	public void setUseraddr1(String useraddr1) {
		this.useraddr1 = useraddr1;
	}
	public String getUseraddr2() {
		return useraddr2;
	}
	public void setUseraddr2(String useraddr2) {
		this.useraddr2 = useraddr2;
	}
	public String getUseraddr3() {
		return useraddr3;
	}
	public void setUseraddr3(String useraddr3) {
		this.useraddr3 = useraddr3;
	}
	public Date getRegidate() {
		return regidate;
	}
	public void setRegidate(Date regidate) {
		this.regidate = regidate;
	}
	public int getVerify() {
		return verify;
	}
	public void setVerify(int verify) {
		this.verify = verify;
	}
}
