package com.bit.emoji.model;

import java.util.List;

public class RouteVO {
	private int routeNum;
	private int memberNum;
	private String routName;
	private int possibleNum;
	private String startDate;
	private String spendTime;
	private int budget;
	private String rule;
	private String routeTage;
	private int encore;
	private String routeCreateDate;
	private double routeGrade;
	private List<DeliciousPinVO> deliciousList;
	private List<JoinVO> joinList;	
	
	public RouteVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public RouteVO(int routeNum, int memberNum, String routName, int possibleNum, String startDate, String spendTime,
			int budget, String rule, String routeTage, int encore, String routeCreateDate, double routeGrade,
			List<DeliciousPinVO> deliciousList, List<JoinVO> joinList) {
		super();
		this.routeNum = routeNum;
		this.memberNum = memberNum;
		this.routName = routName;
		this.possibleNum = possibleNum;
		this.startDate = startDate;
		this.spendTime = spendTime;
		this.budget = budget;
		this.rule = rule;
		this.routeTage = routeTage;
		this.encore = encore;
		this.routeCreateDate = routeCreateDate;
		this.routeGrade = routeGrade;
		this.deliciousList = deliciousList;
		this.joinList = joinList;
	}
	
	public int getRouteNum() {
		return routeNum;
	}
	public void setRouteNum(int routeNum) {
		this.routeNum = routeNum;
	}
	public int getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}
	public String getRoutName() {
		return routName;
	}
	public void setRoutName(String routName) {
		this.routName = routName;
	}
	public int getPossibleNum() {
		return possibleNum;
	}
	public void setPossibleNum(int possibleNum) {
		this.possibleNum = possibleNum;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getSpendTime() {
		return spendTime;
	}
	public void setSpendTime(String spendTime) {
		this.spendTime = spendTime;
	}
	public int getBudget() {
		return budget;
	}
	public void setBudget(int budget) {
		this.budget = budget;
	}
	public String getRule() {
		return rule;
	}
	public void setRule(String rule) {
		this.rule = rule;
	}
	public String getRouteTage() {
		return routeTage;
	}
	public void setRouteTage(String routeTage) {
		this.routeTage = routeTage;
	}
	public int getEncore() {
		return encore;
	}
	public void setEncore(int encore) {
		this.encore = encore;
	}
	public String getRouteCreateDate() {
		return routeCreateDate;
	}
	public void setRouteCreateDate(String routeCreateDate) {
		this.routeCreateDate = routeCreateDate;
	}
	public double getRouteGrade() {
		return routeGrade;
	}
	public void setRouteGrade(double routeGrade) {
		this.routeGrade = routeGrade;
	}
	public List<DeliciousPinVO> getDeliciousList() {
		return deliciousList;
	}
	public void setDeliciousList(List<DeliciousPinVO> deliciousList) {
		this.deliciousList = deliciousList;
	}
	public List<JoinVO> getJoinList() {
		return joinList;
	}
	public void setJoinList(List<JoinVO> joinList) {
		this.joinList = joinList;
	}

	@Override
	public String toString() {
		return "RouteVO [routeNum=" + routeNum + ", memberNum=" + memberNum + ", routName=" + routName
				+ ", possibleNum=" + possibleNum + ", startDate=" + startDate + ", spendTime=" + spendTime + ", budget="
				+ budget + ", rule=" + rule + ", routeTage=" + routeTage + ", encore=" + encore + ", routeCreateDate="
				+ routeCreateDate + ", routeGrade=" + routeGrade + ", deliciousList=" + deliciousList + ", joinList="
				+ joinList + "]";
	}
	
	
	
	
}
