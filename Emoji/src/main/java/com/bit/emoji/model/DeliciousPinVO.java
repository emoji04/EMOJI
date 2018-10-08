
package com.bit.emoji.model;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class DeliciousPinVO {
	private int deliciousPinNum;
	private String deliciousPinName;
	private String deliciousPinRestaurant;
	private String deliciousPinAddress;
	private String deliciousPinPhone;
	private String deliciousPinCategory;
	private double deliciousPinGrade;
	private String deliciousPinDetail;
	private String deliciousPinImg;
	private MultipartFile deliciousPinFile;
	private int deliciousMapNum;
/*	private boolean deliciousPinDeleted;
	private int deliciousPinOrder;
	private int deliciousMapNum;*/
	
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
	
	public String getDeliciousPinRestaurant() {
		return deliciousPinRestaurant;
	}

	public void setDeliciousPinRestaurant(String deliciousPinRestaurant) {
		this.deliciousPinRestaurant = deliciousPinRestaurant;
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
	
	public MultipartFile getDeliciousPinFile() {
		return deliciousPinFile;
	}
	
	public void setDeliciousPinFile(MultipartFile deliciousPinFile) {
		this.deliciousPinFile = deliciousPinFile;
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
				+ ", deliciousPinRestaurant=" + deliciousPinRestaurant + ", deliciousPinAddress=" + deliciousPinAddress
				+ ", deliciousPinPhone=" + deliciousPinPhone + ", deliciousPinCategory=" + deliciousPinCategory
				+ ", deliciousPinGrade=" + deliciousPinGrade + ", deliciousPinDetail=" + deliciousPinDetail
				+ ", deliciousPinImg=" + deliciousPinImg + ", deliciousPinFile=" + deliciousPinFile + ", deliciousMapNum="
				+ deliciousMapNum + "]";
	}
}