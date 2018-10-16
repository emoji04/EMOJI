package com.bit.emoji.model;

public class DeliciousMapScrapVO {
	private int memberNum;
	private int deliciousMapNum;
	
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
		return "DeliciousMapScrapVO [memberNum=" + memberNum + ", deliciousMapNum=" + deliciousMapNum + "]";
	}	
}