package com.MAFI.domain;

public class CategoryVO {
	private String cateName;
	private String cateCode;
	private String cateCodeRef;
	private String level;
	
	/**
	 * @return the level
	 */
	public String getLevel() {
		return level;
	}

	/**
	 * @param level the level to set
	 */
	public void setLevel(String level) {
		this.level = level;
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
}
