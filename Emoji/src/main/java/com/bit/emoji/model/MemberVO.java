package com.bit.emoji.model;

public class MemberVO {
    private int memberNum;
    private String memberEmail;
    private String memberName;
    private String memberPassword;
    private String memberGender;
    private String memberPhoneNum;
    private String memberRegDate;
    private double memberJoinGrade;
    private double memberCapGrade;
    
	public int getMemberNum() {
		return memberNum;
	}
	
	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}
	
	public String getMemberEmail() {
		return memberEmail;
	}
	
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	
	public String getMemberName() {
		return memberName;
	}
	
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	
	public String getMemberPassword() {
		return memberPassword;
	}
	
	public void setMemberPassword(String memberPassword) {
		this.memberPassword = memberPassword;
	}
	
	public String getMemberGender() {
		return memberGender;
	}
	
	public void setMemberGender(String memberGender) {
		this.memberGender = memberGender;
	}
	
	public String getMemberPhoneNum() {
		return memberPhoneNum;
	}
	
	public void setMemberPhoneNum(String memberPhoneNum) {
		this.memberPhoneNum = memberPhoneNum;
	}
	
	public String getMemberRegDate() {
		return memberRegDate;
	}
	
	public void setMemberRegDate(String memberRegDate) {
		this.memberRegDate = memberRegDate;
	}
	
	public double getMemberJoinGrade() {
		return memberJoinGrade;
	}
	
	public void setMemberJoinGrade(double memberJoinGrade) {
		this.memberJoinGrade = memberJoinGrade;
	}
	
	public double getMemberCapGrade() {
		return memberCapGrade;
	}
	
	public void setMemberCapGrade(double memberCapGrade) {
		this.memberCapGrade = memberCapGrade;
	}
	
	@Override
	public String toString() {
		return "MemberVO [memberNum=" + memberNum + ", memberEmail=" + memberEmail + ", memberName=" + memberName
				+ ", memberPassword=" + memberPassword + ", memberGender=" + memberGender + ", memberPhoneNum="
				+ memberPhoneNum + ", memberRegDate=" + memberRegDate + ", memberJoinGrade=" + memberJoinGrade
				+ ", memberCapGrade=" + memberCapGrade + "]";
	}
}