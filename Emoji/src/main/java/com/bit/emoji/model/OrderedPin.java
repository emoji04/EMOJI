package com.bit.emoji.model;

public class OrderedPin {
	private int routeNum;
	private int deliciousNum;
	private int deliciousOrder;//order로 바꿔야함
	
	public OrderedPin(int routeNum, int deliciousNum, int deliciousOrder) {
		super();
		this.routeNum = routeNum;
		this.deliciousNum = deliciousNum;
		this.deliciousOrder = deliciousOrder;
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

	public int getDeliciousOrder() {
		return deliciousOrder;
	}

	public void setDeliciousOrder(int deliciousOrder) {
		this.deliciousOrder = deliciousOrder;
	}

	@Override
	public String toString() {
		return "OrderedPin [routeNum=" + routeNum + ", deliciousNum=" + deliciousNum + ", deliciousOrder="
				+ deliciousOrder + "]";
	}
	
	
	
}
