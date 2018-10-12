package com.bit.emoji.model;

public class DmDeliciousVO {
	private int deliciousPinNum;
	private int deliciousMapNum;
	
	public DmDeliciousVO() { }
	
	public DmDeliciousVO(int deliciousPinNum, int deliciousMapNum) {
		super();
		this.deliciousPinNum = deliciousPinNum;
		this.deliciousMapNum = deliciousMapNum;
	}

	public int getDeliciousPinNum() {
		return deliciousPinNum;
	}
	
	public void setDeliciousPinNum(int deliciousPinNum) {
		this.deliciousPinNum = deliciousPinNum;
	}
	
	public int getDeliciousMapNum() {
		return deliciousMapNum;
	}
	
	public void setDeliciousMapNum(int deliciousMapNum) {
		this.deliciousMapNum = deliciousMapNum;
	}

	@Override
	public String toString() {
		return "DmDeliciousVO [deliciousPinNum=" + deliciousPinNum + ", deliciousMapNum=" + deliciousMapNum + "]";
	}
}