package com.bit.emoji.model;

public class RouteScrapVO {
	private int memberNum;
	private int routeNum;
	
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

	@Override
	public String toString() {
		return "RouteScrapVO [memberNum=" + memberNum + ", routeNum=" + routeNum + "]";
	}
}