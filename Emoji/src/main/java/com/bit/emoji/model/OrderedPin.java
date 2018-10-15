package com.bit.emoji.model;

public class OrderedPin {
	private int routeNum;
	private int deliciousPinNum;
	private int deliciousPinOrder;
	
	public OrderedPin() {
		super();
		// TODO Auto-generated constructor stub
	}

	public OrderedPin(int routeNum, int deliciousPinNum, int deliciousPinOrder) {
		super();
		this.routeNum = routeNum;
		this.deliciousPinNum = deliciousPinNum;
		this.deliciousPinOrder = deliciousPinOrder;
	}

	@Override
	public String toString() {
		return "OrderedPin [routeNum=" + routeNum + ", deliciousPinNum=" + deliciousPinNum + ", deliciousPinOrder="
				+ deliciousPinOrder + "]";
	}

	public int getRouteNum() {
		return routeNum;
	}

	public void setRouteNum(int routeNum) {
		this.routeNum = routeNum;
	}

	public int getDeliciousPinNum() {
		return deliciousPinNum;
	}

	public void setDeliciousPinNum(int deliciousPinNum) {
		this.deliciousPinNum = deliciousPinNum;
	}

	public int getDeliciousPinOrder() {
		return deliciousPinOrder;
	}

	public void setDeliciousPinOrder(int deliciousPinOrder) {
		this.deliciousPinOrder = deliciousPinOrder;
	}
	
	
	
	
}
