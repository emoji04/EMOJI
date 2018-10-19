package com.bit.emoji.model;

public class DeliciousMapReviewVO {
	private int deliciousMapReviewNum;
	private int memberNum;
	private int deliciousMapNum;
	private String deliciousMapTitle;
	private String deliciousMapContent;
	private String deliciousMapWriteDate;
	private String deliciousMapImg;
	private double deliciousMapGrade;
	
	public int getDeliciousMapReviewNum() {
		return deliciousMapReviewNum;
	}
	public void setDeliciousMapReviewNum(int deliciousMapReviewNum) {
		this.deliciousMapReviewNum = deliciousMapReviewNum;
	}
	public int getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}
	public int getDeliciousMapNum() {
		return deliciousMapNum;
	}
	public void setDeliciousMapNum(int deliciousMapNum) {
		this.deliciousMapNum = deliciousMapNum;
	}
	public String getDeliciousMapTitle() {
		return deliciousMapTitle;
	}
	public void setDeliciousMapTitle(String deliciousMapTitle) {
		this.deliciousMapTitle = deliciousMapTitle;
	}
	public String getDeliciousMapContent() {
		return deliciousMapContent;
	}
	public void setDeliciousMapContent(String deliciousMapContent) {
		this.deliciousMapContent = deliciousMapContent;
	}
	public String getDeliciousMapWriteDate() {
		return deliciousMapWriteDate;
	}
	public void setDeliciousMapWriteDate(String deliciousMapWriteDate) {
		this.deliciousMapWriteDate = deliciousMapWriteDate;
	}
	public String getDeliciousMapImg() {
		return deliciousMapImg;
	}
	public void setDeliciousMapImg(String deliciousMapImg) {
		this.deliciousMapImg = deliciousMapImg;
	}
	public double getDeliciousMapGrade() {
		return deliciousMapGrade;
	}
	public void setDeliciousMapGrade(double deliciousMapGrade) {
		this.deliciousMapGrade = deliciousMapGrade;
	}
	@Override
	public String toString() {
		return "DeliciousMapReviewVO [deliciousMapReviewNum=" + deliciousMapReviewNum + ", memberNum=" + memberNum
				+ ", deliciousMapNum=" + deliciousMapNum + ", deliciousMapTitle=" + deliciousMapTitle
				+ ", deliciousMapContent=" + deliciousMapContent + ", deliciousMapWriteDate=" + deliciousMapWriteDate
				+ ", deliciousMapImg=" + deliciousMapImg + ", deliciousMapGrade=" + deliciousMapGrade + "]";
	}

	

}