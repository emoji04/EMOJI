package com.bit.emoji.model;

public class ScrapRouteVO {
	private int memberNum;
	private int routeNum;
	
	
	
	public ScrapRouteVO() {
		super();
		// TODO Auto-generated constructor stub
	}



	public ScrapRouteVO(int memberNum, int routeNum) {
		super();
		this.memberNum = memberNum;
		this.routeNum = routeNum;
	}



	public int getMemberNum() {
		return memberNum;
	}



	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}



	public int getRouteNum() {
		return routeNum;
	}



	public void setRouteNum(int routeNum) {
		this.routeNum = routeNum;
	}
	
	
	
}
