package com.bit.emoji.model;

import org.springframework.web.multipart.MultipartFile;

public class DeliciousPinVO {
	private int deliciousPinNum;
	private String deliciousPinName;
	private String deliciousPinAddress;
	private String deliciousPinPhone;
	private String deliciousPinCategory;
	private double deliciousPinGrade;
	private String deliciousPinDetail;
	private String deliciousPinImg;
	private MultipartFile delciousPinFile;
	private boolean deliciousPinDeleted;
	private int deliciousPinOrder;
	private int deliciousMapNum;
	public DeliciousPinVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	public DeliciousPinVO(int deliciousPinNum, String deliciousPinName, String deliciousPinAddress,
			String deliciousPinPhone, String deliciousPinCategory, double deliciousPinGrade, String deliciousPinDetail,
			String deliciousPinImg, MultipartFile delciousPinFile, boolean deliciousPinDeleted, int deliciousPinOrder,
			int deliciousMapNum) {
		super();
		this.deliciousPinNum = deliciousPinNum;
		this.deliciousPinName = deliciousPinName;
		this.deliciousPinAddress = deliciousPinAddress;
		this.deliciousPinPhone = deliciousPinPhone;
		this.deliciousPinCategory = deliciousPinCategory;
		this.deliciousPinGrade = deliciousPinGrade;
		this.deliciousPinDetail = deliciousPinDetail;
		this.deliciousPinImg = deliciousPinImg;
		this.delciousPinFile = delciousPinFile;
		this.deliciousPinDeleted = deliciousPinDeleted;
		this.deliciousPinOrder = deliciousPinOrder;
		this.deliciousMapNum = deliciousMapNum;
	}

	

	public int getDeliciousPinNum() {
		return deliciousPinNum;
	}



	public void setDeliciousPinNum(int deliciousPinNum) {
		this.deliciousPinNum = deliciousPinNum;
	}



	public String getDeliciousPinName() {
		return deliciousPinName;
	}



	public void setDeliciousPinName(String deliciousPinName) {
		this.deliciousPinName = deliciousPinName;
	}



	public String getDeliciousPinAddress() {
		return deliciousPinAddress;
	}



	public void setDeliciousPinAddress(String deliciousPinAddress) {
		this.deliciousPinAddress = deliciousPinAddress;
	}



	public String getDeliciousPinPhone() {
		return deliciousPinPhone;
	}



	public void setDeliciousPinPhone(String deliciousPinPhone) {
		this.deliciousPinPhone = deliciousPinPhone;
	}



	public String getDeliciousPinCategory() {
		return deliciousPinCategory;
	}



	public void setDeliciousPinCategory(String deliciousPinCategory) {
		this.deliciousPinCategory = deliciousPinCategory;
	}



	public double getDeliciousPinGrade() {
		return deliciousPinGrade;
	}



	public void setDeliciousPinGrade(double deliciousPinGrade) {
		this.deliciousPinGrade = deliciousPinGrade;
	}



	public String getDeliciousPinDetail() {
		return deliciousPinDetail;
	}



	public void setDeliciousPinDetail(String deliciousPinDetail) {
		this.deliciousPinDetail = deliciousPinDetail;
	}



	public String getDeliciousPinImg() {
		return deliciousPinImg;
	}



	public void setDeliciousPinImg(String deliciousPinImg) {
		this.deliciousPinImg = deliciousPinImg;
	}



	public MultipartFile getDelciousPinFile() {
		return delciousPinFile;
	}



	public void setDelciousPinFile(MultipartFile delciousPinFile) {
		this.delciousPinFile = delciousPinFile;
	}



	public boolean isDeliciousPinDeleted() {
		return deliciousPinDeleted;
	}



	public void setDeliciousPinDeleted(boolean deliciousPinDeleted) {
		this.deliciousPinDeleted = deliciousPinDeleted;
	}



	public int getDeliciousPinOrder() {
		return deliciousPinOrder;
	}



	public void setDeliciousPinOrder(int deliciousPinOrder) {
		this.deliciousPinOrder = deliciousPinOrder;
	}



	public int getDeliciousMapNum() {
		return deliciousMapNum;
	}



	public void setDeliciousMapNum(int deliciousMapNum) {
		this.deliciousMapNum = deliciousMapNum;
	}



	@Override
	public String toString() {
		return "DeliciousPinVO [deliciousPinNum=" + deliciousPinNum + ", deliciousPinName=" + deliciousPinName
				+ ", deliciousPinAddress=" + deliciousPinAddress + ", deliciousPinPhone=" + deliciousPinPhone
				+ ", deliciousPinCategory=" + deliciousPinCategory + ", deliciousPinGrade=" + deliciousPinGrade
				+ ", deliciousPinDetail=" + deliciousPinDetail + ", deliciousPinImg=" + deliciousPinImg
				+ ", delciousPinFile=" + delciousPinFile + ", deliciousPinDeleted=" + deliciousPinDeleted
				+ ", deliciousPinOrder=" + deliciousPinOrder + ", deliciousMapNum=" + deliciousMapNum + "]";
	}
	
	
	
}