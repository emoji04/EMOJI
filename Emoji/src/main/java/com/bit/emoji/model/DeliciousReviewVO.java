package com.bit.emoji.model;

import org.springframework.web.multipart.MultipartFile;

public class DeliciousReviewVO {
	private int deliciousReviewNum;
	private int deliciousNum;
	private int memberNum;
	private String deliciousReviewTitle;
	private String deliciousReviewContent;
	private String deliciousReviewWriteDate;
	private String deliciousReviewImg;
	private double deliciousReviewGrade;
	public int getDeliciousReviewNum() {
		return deliciousReviewNum;
	}
	public void setDeliciousReviewNum(int deliciousReviewNum) {
		this.deliciousReviewNum = deliciousReviewNum;
	}
	public int getDeliciousNum() {
		return deliciousNum;
	}
	public void setDeliciousNum(int deliciousNum) {
		this.deliciousNum = deliciousNum;
	}
	public int getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
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
	public double getDeliciousReviewGrade() {
		return deliciousReviewGrade;
	}
	public void setDeliciousReviewGrade(double deliciousReviewGrade) {
		this.deliciousReviewGrade = deliciousReviewGrade;
	}
	@Override
	public String toString() {
		return "DeliciousReviewVO [deliciousReviewNum=" + deliciousReviewNum + ", deliciousNum=" + deliciousNum
				+ ", memberNum=" + memberNum + ", deliciousReviewTitle=" + deliciousReviewTitle
				+ ", deliciousReviewContent=" + deliciousReviewContent + ", deliciousReviewWriteDate="
				+ deliciousReviewWriteDate + ", deliciousReviewImg=" + deliciousReviewImg + ", deliciousReviewGrade="
				+ deliciousReviewGrade + "]";
	}


}