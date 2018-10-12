package com.bit.emoji.model;

public class DeliciousPinVO {
	private int deliciousNum;
	private int deliciousMapNum;

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

	@Override
	public String toString() {
		return "DeliciousPinVO [deliciousNum=" + deliciousNum + ", deliciousMapNum=" + deliciousMapNum + "]";
	}
}