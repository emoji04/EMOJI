package com.bit.emoji.model;

import org.springframework.web.multipart.MultipartFile;

public class DeliciousReviewVO {
	private int deliciousReviewNum;
	private String deliciousReviewTitle;
	private String deliciousReviewContent;
	private String deliciousReviewWriteDate;
	private String deliciousReviewImg;
	private MultipartFile deliciousReviewFile;
	private double deliciousReviewGrade;
	private int deliciousPinNum;
	private int memberNum;
	
	
	public DeliciousReviewVO() {
		super();
		// TODO Auto-generated constructor stub
	}


	public DeliciousReviewVO(int deliciousReviewNum, String deliciousReviewTitle, String deliciousReviewContent,
			String deliciousReviewWriteDate, String deliciousReviewImg, MultipartFile deliciousReviewFile,
			double deliciousReviewGrade, int deliciousPinNum, int memberNum) {
		super();
		this.deliciousReviewNum = deliciousReviewNum;
		this.deliciousReviewTitle = deliciousReviewTitle;
		this.deliciousReviewContent = deliciousReviewContent;
		this.deliciousReviewWriteDate = deliciousReviewWriteDate;
		this.deliciousReviewImg = deliciousReviewImg;
		this.deliciousReviewFile = deliciousReviewFile;
		this.deliciousReviewGrade = deliciousReviewGrade;
		this.deliciousPinNum = deliciousPinNum;
		this.memberNum = memberNum;
	}


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


	public MultipartFile getDeliciousReviewFile() {
		return deliciousReviewFile;
	}


	public void setDeliciousReviewFile(MultipartFile deliciousReviewFile) {
		this.deliciousReviewFile = deliciousReviewFile;
	}


	public double getDeliciousReviewGrade() {
		return deliciousReviewGrade;
	}


	public void setDeliciousReviewGrade(double deliciousReviewGrade) {
		this.deliciousReviewGrade = deliciousReviewGrade;
	}


	public int getDeliciousPinNum() {
		return deliciousPinNum;
	}


	public void setDeliciousPinNum(int deliciousPinNum) {
		this.deliciousPinNum = deliciousPinNum;
	}


	public int getMemberNum() {
		return memberNum;
	}


	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}


	@Override
	public String toString() {
		return "DeliciousReviewVO [deliciousReviewNum=" + deliciousReviewNum + ", deliciousReviewTitle="
				+ deliciousReviewTitle + ", deliciousReviewContent=" + deliciousReviewContent
				+ ", deliciousReviewWriteDate=" + deliciousReviewWriteDate + ", deliciousReviewImg="
				+ deliciousReviewImg + ", deliciousReviewFile=" + deliciousReviewFile + ", deliciousReviewGrade="
				+ deliciousReviewGrade + ", deliciousPinNum=" + deliciousPinNum + ", memberNum=" + memberNum + "]";
	}
	
	
	
	
	
}