package com.bit.emoji.model;
public class MemberVO {
    private int memeberNum;
    private String memeberEmail;
    private String memeberName;
    private String memeberPassword;
    private String memeberGender;
    private String memeberPhoneNum;
    private String memeberRegDate;
    private double memeberJoinGrade;
    private double memeberCapGrade;
    
	public MemberVO() { }  
    
	public MemberVO(int memeberNum, String memeberEmail, String memeberName, String memeberPassword,
			String memeberGender, String memeberPhoneNum, String memeberRegDate, double memeberJoinGrade,
			double memeberCapGrade) {
		super();
		this.memeberNum = memeberNum;
		this.memeberEmail = memeberEmail;
		this.memeberName = memeberName;
		this.memeberPassword = memeberPassword;
		this.memeberGender = memeberGender;
		this.memeberPhoneNum = memeberPhoneNum;
		this.memeberRegDate = memeberRegDate;
		this.memeberJoinGrade = memeberJoinGrade;
		this.memeberCapGrade = memeberCapGrade;
	}

	public int getMemeberNum() {
		return memeberNum;
	}
	
	public void setMemeberNum(int memeberNum) {
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
	
	public String getMemeberPassword() {
		return memeberPassword;
	}
	
	public void setMemeberPassword(String memeberPassword) {
		this.memeberPassword = memeberPassword;
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
				+ ", memeberPassword=" + memeberPassword + ", memeberGender=" + memeberGender + ", memeberPhoneNum="
				+ memeberPhoneNum + ", memeberRegDate=" + memeberRegDate + ", memeberJoinGrade=" + memeberJoinGrade
				+ ", memeberCapGrade=" + memeberCapGrade + "]";
	}
}