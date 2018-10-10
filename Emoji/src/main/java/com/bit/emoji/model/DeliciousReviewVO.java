package com.bit.emoji.model;

import org.springframework.web.multipart.MultipartFile;

public class DeliciousReviewVO {
	private int deliciousReviewNum;
	private String deliciousReviewTitle;
	private String deliciousReviewContent;
	private String deliciousReviewWriteDate;
	private String deliciousReviewImg;
	private double deliciousMapGrade;
	private int memberNum;
	private int deliciousMapNum;
	
	public int getDeliciousReviewNum() {
		return deliciousReviewNum;
	}
	public void setDeliciousReviewNum(int deliciousReviewNum) {
		this.deliciousReviewNum = deliciousReviewNum;
	}
	public String getDeliciousReviewTitle() {
		return deliciousReviewTitle;
	}
	public void setDeliciousReviewTitle(String deliciousReviewTitle) {
		this.deliciousReviewTitle = deliciousReviewTitle;
	}
	public String getDeliciousReviewContent() {
		return deliciousReviewContent;
	}
	public void setDeliciousReviewContent(String deliciousReviewContent) {
		this.deliciousReviewContent = deliciousReviewContent;
	}
	public String getDeliciousReviewWriteDate() {
		return deliciousReviewWriteDate;
	}
	public void setDeliciousReviewWriteDate(String deliciousReviewWriteDate) {
		this.deliciousReviewWriteDate = deliciousReviewWriteDate;
	}
	public String getDeliciousReviewImg() {
		return deliciousReviewImg;
	}
	public void setDeliciousReviewImg(String deliciousReviewImg) {
		this.deliciousReviewImg = deliciousReviewImg;
	}
	public double getDeliciousMapGrade() {
		return deliciousMapGrade;
	}
	public void setDeliciousMapGrade(double deliciousMapGrade) {
		this.deliciousMapGrade = deliciousMapGrade;
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
	@Override
	public String toString() {
		return "DeliciousReviewVO [deliciousReviewNum=" + deliciousReviewNum + ", deliciousReviewTitle="
				+ deliciousReviewTitle + ", deliciousReviewContent=" + deliciousReviewContent
				+ ", deliciousReviewWriteDate=" + deliciousReviewWriteDate + ", deliciousReviewImg="
				+ deliciousReviewImg + ", deliciousMapGrade=" + deliciousMapGrade + ", memberNum=" + memberNum
				+ ", deliciousMapNum=" + deliciousMapNum + "]";
	}
	
}