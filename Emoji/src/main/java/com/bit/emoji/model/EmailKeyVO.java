package com.bit.emoji.model;

public class EmailKeyVO {
	private String email;
	private String emailKey;
	private String checkDate;
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getKey() {
		return emailKey;
	}
	public void setKey(String emailKey) {
		this.emailKey = emailKey;
	}
	public String getCheckDate() {
		return checkDate;
	}
	public void setCheckDate(String checkDate) {
		this.checkDate = checkDate;
	}
	@Override
	public String toString() {
		return "EmailKeyVO [email=" + email + ", emailKey=" + emailKey + ", checkDate=" + checkDate + "]";
	}

}
