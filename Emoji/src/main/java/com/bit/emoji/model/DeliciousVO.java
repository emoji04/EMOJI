package com.bit.emoji.model;

import org.springframework.web.multipart.MultipartFile;

public class DeliciousVO {
	private int deliciousNum;
	private int deliciousMapNum;
	private String deliciousName;
	private String deliciousAddress;
	private String deliciousPhone;
	private String deliciousCategory;
	private double deliciousGrade;
	private String deliciousDetail;
	private String deliciousImg;
	private MultipartFile deliciousFile;
	
	public int getDeliciousNum() {
		return deliciousNum;
	}
	
	public void setDeliciousNum(int deliciousNum) {
		this.deliciousNum = deliciousNum;
	}
	
	public int getDeliciousMapNum() {
		return deliciousMapNum;
	}
	
	public void setDeliciousMapNum(int deliciousMapNum) {
		this.deliciousMapNum = deliciousMapNum;
	}
	
	public String getDeliciousName() {
		return deliciousName;
	}
	
	public void setDeliciousName(String deliciousName) {
		this.deliciousName = deliciousName;
	}
	
	public String getDeliciousAddress() {
		return deliciousAddress;
	}
	
	public void setDeliciousAddress(String deliciousAddress) {
		this.deliciousAddress = deliciousAddress;
	}
	
	public String getDeliciousPhone() {
		return deliciousPhone;
	}
	
	public void setDeliciousPhone(String deliciousPhone) {
		this.deliciousPhone = deliciousPhone;
	}
	
	public String getDeliciousCategory() {
		return deliciousCategory;
	}
	
	public void setDeliciousCategory(String deliciousCategory) {
		this.deliciousCategory = deliciousCategory;
	}
	
	public double getDeliciousGrade() {
		return deliciousGrade;
	}
	
	public void setDeliciousGrade(double deliciousGrade) {
		this.deliciousGrade = deliciousGrade;
	}
	
	public String getDeliciousDetail() {
		return deliciousDetail;
	}
	
	public void setDeliciousDetail(String deliciousDetail) {
		this.deliciousDetail = deliciousDetail;
	}
	
	public String getDeliciousImg() {
		return deliciousImg;
	}
	
	public void setDeliciousImg(String deliciousImg) {
		this.deliciousImg = deliciousImg;
	}
	
	public MultipartFile getDeliciousFile() {
		return deliciousFile;
	}
	
	public void setDeliciousFile(MultipartFile deliciousFile) {
		this.deliciousFile = deliciousFile;
	}

	@Override
	public String toString() {
		return "DeliciousVO [deliciousNum=" + deliciousNum + ", deliciousMapNum=" + deliciousMapNum + ", deliciousName="
				+ deliciousName + ", deliciousAddress=" + deliciousAddress + ", deliciousPhone=" + deliciousPhone
				+ ", deliciousCategory=" + deliciousCategory + ", deliciousGrade=" + deliciousGrade
				+ ", deliciousDetail=" + deliciousDetail + ", deliciousImg=" + deliciousImg + ", deliciousFile="
				+ deliciousFile + "]";
	}
}