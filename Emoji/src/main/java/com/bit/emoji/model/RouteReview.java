package com.bit.emoji.model;

public class RouteReview {
	
	private int routeReviewNum;
	private int joinNum;
	private String routeTitle;
	private String routeContent;
	private String routeWriteDate;
	private String routeImg;
	private double routeReviewGarde;
	private double routeCapReviewGrade;
	public int getRouteReviewNum() {
		return routeReviewNum;
	}
	public void setRouteReviewNum(int routeReviewNum) {
		this.routeReviewNum = routeReviewNum;
	}
	public int getJoinNum() {
		return joinNum;
	}
	public void setJoinNum(int joinNum) {
		this.joinNum = joinNum;
	}
	public String getRouteTitle() {
		return routeTitle;
	}
	public void setRouteTitle(String routeTitle) {
		this.routeTitle = routeTitle;
	}
	public String getRouteContent() {
		return routeContent;
	}
	public void setRouteContent(String routeContent) {
		this.routeContent = routeContent;
	}
	public String getRouteWriteDate() {
		return routeWriteDate;
	}
	public void setRouteWriteDate(String routeWriteDate) {
		this.routeWriteDate = routeWriteDate;
	}
	public String getRouteImg() {
		return routeImg;
	}
	public void setRouteImg(String routeImg) {
		this.routeImg = routeImg;
	}
	public double getRouteReviewGarde() {
		return routeReviewGarde;
	}
	public void setRouteReviewGarde(double routeReviewGarde) {
		this.routeReviewGarde = routeReviewGarde;
	}
	public double getRouteCapReviewGrade() {
		return routeCapReviewGrade;
	}
	public void setRouteCapReviewGrade(double routeCapReviewGrade) {
		this.routeCapReviewGrade = routeCapReviewGrade;
	}
	@Override
	public String toString() {
		return "RouteReview [routeReviewNum=" + routeReviewNum + ", joinNum=" + joinNum + ", routeTitle=" + routeTitle
				+ ", routeContent=" + routeContent + ", routeWriteDate=" + routeWriteDate + ", routeImg=" + routeImg
				+ ", routeReviewGarde=" + routeReviewGarde + ", routeCapReviewGrade=" + routeCapReviewGrade + "]";
	}
	
	
	

}
