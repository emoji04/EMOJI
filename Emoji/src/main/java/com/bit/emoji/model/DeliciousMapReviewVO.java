package com.bit.emoji.model;

import org.springframework.web.multipart.MultipartFile;

public class DeliciousMapReviewVO {
	private int deliciousReviewNum;
	private int deliciousMapNum;
	private int memberNum;
	private String deliciousMapReviewTitle;
	private String deliciousMapReviewContent;
	private String deliciousMapReviewWriteDate;
	private String deliciousMapReviewImg;
	private double deliciousMapReviewGrade;
	public int getDeliciousReviewNum() {
		return deliciousReviewNum;
	}
	public void setDeliciousReviewNum(int deliciousReviewNum) {
		this.deliciousReviewNum = deliciousReviewNum;
	}
	public int getDeliciousMapNum() {
		return deliciousMapNum;
	}
	public void setDeliciousMapNum(int deliciousMapNum) {
		this.deliciousMapNum = deliciousMapNum;
	}
	public int getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}
	public String getDeliciousMapReviewTitle() {
		return deliciousMapReviewTitle;
	}
	public void setDeliciousMapReviewTitle(String deliciousMapReviewTitle) {
		this.deliciousMapReviewTitle = deliciousMapReviewTitle;
	}
	public String getDeliciousMapReviewContent() {
		return deliciousMapReviewContent;
	}
	public void setDeliciousMapReviewContent(String deliciousMapReviewContent) {
		this.deliciousMapReviewContent = deliciousMapReviewContent;
	}
	public String getDeliciousMapReviewWriteDate() {
		return deliciousMapReviewWriteDate;
	}
	public void setDeliciousMapReviewWriteDate(String deliciousMapReviewWriteDate) {
		this.deliciousMapReviewWriteDate = deliciousMapReviewWriteDate;
	}
	public String getDeliciousMapReviewImg() {
		return deliciousMapReviewImg;
	}
	public void setDeliciousMapReviewImg(String deliciousMapReviewImg) {
		this.deliciousMapReviewImg = deliciousMapReviewImg;
	}
	public double getDeliciousMapReviewGrade() {
		return deliciousMapReviewGrade;
	}
	public void setDeliciousMapReviewGrade(double deliciousMapReviewGrade) {
		this.deliciousMapReviewGrade = deliciousMapReviewGrade;
	}
	@Override
	public String toString() {
		return "DeliciousReviewVO [deliciousReviewNum=" + deliciousReviewNum + ", deliciousMapNum=" + deliciousMapNum
				+ ", memberNum=" + memberNum + ", deliciousMapReviewTitle=" + deliciousMapReviewTitle
				+ ", deliciousMapReviewContent=" + deliciousMapReviewContent + ", deliciousMapReviewWriteDate="
				+ deliciousMapReviewWriteDate + ", deliciousMapReviewImg=" + deliciousMapReviewImg
				+ ", deliciousMapReviewGrade=" + deliciousMapReviewGrade + "]";
	}


}