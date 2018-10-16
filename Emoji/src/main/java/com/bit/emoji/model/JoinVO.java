package com.bit.emoji.model;

public class JoinVO {
	private int joinNum;
	private int memberNum;
	private int routeNum;
	private String joinstate;
	private double joinGrade;
	
	public JoinVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public JoinVO(int joinNum, int memberNum, int routeNum, String joinstate, double joinGrade) {
		super();
		this.joinNum = joinNum;
		this.memberNum = memberNum;
		this.routeNum = routeNum;
		this.joinstate = joinstate;
		this.joinGrade = joinGrade;
	}

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

	public String getJoinstate() {
		return joinstate;
	}

	public void setJoinstate(String joinstate) {
		this.joinstate = joinstate;
	}

	public double getJoinGrade() {
		return joinGrade;
	}

	public void setJoinGrade(double joinGrade) {
		this.joinGrade = joinGrade;
	}

	@Override
	public String toString() {
		return "JoinVO [joinNum=" + joinNum + ", memberNum=" + memberNum + ", routeNum=" + routeNum + ", joinstate="
				+ joinstate + ", joinGrade=" + joinGrade + "]";
	}
}