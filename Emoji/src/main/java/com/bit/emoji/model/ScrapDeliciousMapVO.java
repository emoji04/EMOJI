package com.bit.emoji.model;

public class ScrapDeliciousMapVO {
	private int memberNum;
	private int deliciousMemberNum;
	
	public ScrapDeliciousMapVO(int memberNum, int deliciousMemberNum) {
		super();
		this.memberNum = memberNum;
		this.deliciousMemberNum = deliciousMemberNum;
	}

	public ScrapDeliciousMapVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getMemberNum() {
		return memberNum;
	}

	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}

	public int getDeliciousMemberNum() {
		return deliciousMemberNum;
	}

	public void setDeliciousMemberNum(int deliciousMemberNum) {
		this.deliciousMemberNum = deliciousMemberNum;
	}

	@Override
	public String toString() {
		return "ScrapDeliciousMapVO [memberNum=" + memberNum + ", deliciousMemberNum=" + deliciousMemberNum + "]";
	}
	
	
	
	
}
