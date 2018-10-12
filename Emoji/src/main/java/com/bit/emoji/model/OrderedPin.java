package com.bit.emoji.model;

public class OrderedPin {
	private int routeNum;
	private int deliciousNum;
	private int order;
	
	public OrderedPin(int routeNum, int deliciousNum, int order) {
		super();
		this.routeNum = routeNum;
		this.deliciousNum = deliciousNum;
		this.order = order;
	}

	public OrderedPin() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getRouteNum() {
		return routeNum;
	}

	public void setRouteNum(int routeNum) {
		this.routeNum = routeNum;
	}

	public int getDeliciousNum() {
		return deliciousNum;
	}

	public void setDeliciousNum(int deliciousNum) {
		this.deliciousNum = deliciousNum;
	}

	public int getOrder() {
		return order;
	}

	public void setOrder(int order) {
		this.order = order;
	}

	@Override
	public String toString() {
		return "OrderedPins [routeNum=" + routeNum + ", deliciousNum=" + deliciousNum + ", order=" + order + "]";
	}
	
	
	
}
