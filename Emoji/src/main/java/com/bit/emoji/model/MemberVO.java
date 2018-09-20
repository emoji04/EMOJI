package com.bit.emoji.model;
public class MemberVO {
    private String memeberNum;
    private String memeberEmail;
    private String memeberName;
    private String memeberPw;
    private String memeberGender;
    private String memeberPhoneNum;
    private String memeberRegDate;
    private double memeberJoinGrade;
    private double memeberCapGrade;
    
    
    
	public MemberVO(String memeberNum, String memeberEmail, String memeberName, String memeberPw, String memeberGender,
			String memeberPhoneNum, String memeberRegDate, double memeberJoinGrade, double memeberCapGrade) {
		super();
		this.memeberNum = memeberNum;
		this.memeberEmail = memeberEmail;
		this.memeberName = memeberName;
		this.memeberPw = memeberPw;
		this.memeberGender = memeberGender;
		this.memeberPhoneNum = memeberPhoneNum;
		this.memeberRegDate = memeberRegDate;
		this.memeberJoinGrade = memeberJoinGrade;
		this.memeberCapGrade = memeberCapGrade;
	}
	public MemberVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getMemeberNum() {
		return memeberNum;
	}
	public void setMemeberNum(String memeberNum) {
		this.memeberNum = memeberNum;
	}
	public String getMemeberEmail() {
		return memeberEmail;
	}
	public void setMemeberEmail(String memeberEmail) {
		this.memeberEmail = memeberEmail;
	}
	public String getMemeberName() {
		return memeberName;
	}
	public void setMemeberName(String memeberName) {
		this.memeberName = memeberName;
	}
	public String getMemeberPw() {
		return memeberPw;
	}
	public void setMemeberPw(String memeberPw) {
		this.memeberPw = memeberPw;
	}
	public String getMemeberGender() {
		return memeberGender;
	}
	public void setMemeberGender(String memeberGender) {
		this.memeberGender = memeberGender;
	}
	public String getMemeberPhoneNum() {
		return memeberPhoneNum;
	}
	public void setMemeberPhoneNum(String memeberPhoneNum) {
		this.memeberPhoneNum = memeberPhoneNum;
	}
	public String getMemeberRegDate() {
		return memeberRegDate;
	}
	public void setMemeberRegDate(String memeberRegDate) {
		this.memeberRegDate = memeberRegDate;
	}
	public double getMemeberJoinGrade() {
		return memeberJoinGrade;
	}
	public void setMemeberJoinGrade(double memeberJoinGrade) {
		this.memeberJoinGrade = memeberJoinGrade;
	}
	public double getMemeberCapGrade() {
		return memeberCapGrade;
	}
	public void setMemeberCapGrade(double memeberCapGrade) {
		this.memeberCapGrade = memeberCapGrade;
	}
	
	@Override
	public String toString() {
		return "MemberVO [memeberNum=" + memeberNum + ", memeberEmail=" + memeberEmail + ", memeberName=" + memeberName
				+ ", memeberPw=" + memeberPw + ", memeberGender=" + memeberGender + ", memeberPhoneNum="
				+ memeberPhoneNum + ", memeberRegDate=" + memeberRegDate + ", memeberJoinGrade=" + memeberJoinGrade
				+ ", memeberCapGrade=" + memeberCapGrade + "]";
	}
    
    
    

}
