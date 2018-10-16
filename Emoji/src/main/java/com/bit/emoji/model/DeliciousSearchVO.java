package com.bit.emoji.model;

public class DeliciousSearchVO {
	private int deliciousMapNum;
	private String deliciousMapName;
	private String deliciousMapTag;
	private String deliciousMapDetail;
	private String deliciousImg;
	
	public DeliciousSearchVO() { }
	
	public DeliciousSearchVO(int deliciousMapNum, String deliciousMapName, String deliciousMapTag,
			String deliciousMapDetail, String deliciousImg) {
		super();
		this.deliciousMapNum = deliciousMapNum;
		this.deliciousMapName = deliciousMapName;
		this.deliciousMapTag = deliciousMapTag;
		this.deliciousMapDetail = deliciousMapDetail;
		this.deliciousImg = deliciousImg;
	}

	public int getDeliciousMapNum() {
		return deliciousMapNum;
	}
	
	public void setDeliciousMapNum(int deliciousMapNum) {
		this.deliciousMapNum = deliciousMapNum;
	}
	
	public String getDeliciousMapName() {
		return deliciousMapName;
	}
	
	public void setDeliciousMapName(String deliciousMapName) {
		this.deliciousMapName = deliciousMapName;
	}
	
	public String getDeliciousMapTag() {
		return deliciousMapTag;
	}
	
	public void setDeliciousMapTag(String deliciousMapTag) {
		this.deliciousMapTag = deliciousMapTag;
	}
	
	public String getDeliciousMapDetail() {
		return deliciousMapDetail;
	}
	
	public void setDeliciousMapDetail(String deliciousMapDetail) {
		this.deliciousMapDetail = deliciousMapDetail;
	}
	
	public String getDeliciousImg() {
		return deliciousImg;
	}
	
	public void setDeliciousImg(String deliciousImg) {
		this.deliciousImg = deliciousImg;
	}

	@Override
	public String toString() {
		return "DeliciousSearchVO [deliciousMapNum=" + deliciousMapNum + ", deliciousMapName=" + deliciousMapName
				+ ", deliciousMapTag=" + deliciousMapTag + ", deliciousMapDetail=" + deliciousMapDetail
				+ ", deliciousImg=" + deliciousImg + "]";
	}
}