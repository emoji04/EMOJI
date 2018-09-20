package com.bit.emoji.model;
public class JoinVO {
	private int joinNum;
	private int memberNum;
	private int routeNum;
	private String state;
	private double joinGrade;
	
	
	
	public JoinVO(int joinNum, int memberNum, int routeNum, String state, double joinGrade) {
		super();
		this.joinNum = joinNum;
		this.memberNum = memberNum;
		this.routeNum = routeNum;
		this.state = state;
		this.joinGrade = joinGrade;
	}
	
	public JoinVO() {	}

	public int getJoinNum() {
		return joinNum;
	}

	public void setJoinNum(int joinNum) {
		this.joinNum = joinNum;
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

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public double getJoinGrade() {
		return joinGrade;
	}

	public void setJoinGrade(double joinGrade) {
		this.joinGrade = joinGrade;
	}

	@Override
	public String toString() {
		return "JoinVO [joinNum=" + joinNum + ", memberNum=" + memberNum + ", routeNum=" + routeNum + ", state=" + state
				+ ", joinGrade=" + joinGrade + "]";
	}
	
	
	
	
}
