package com.bit.emoji.model;

public class RouteSearchVO {
	
	private String from;
	private String to;
	private String routeWord;
	
	public RouteSearchVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public RouteSearchVO(String from, String to, String routeWord) {
		super();
		this.from = from;
		this.to = to;
		this.routeWord = routeWord;
	}

	public String getFrom() {
		return from;
	}

	public void setFrom(String from) {
		this.from = from;
	}

	public String getTo() {
		return to;
	}

	public void setTo(String to) {
		this.to = to;
	}

	public String getRouteWord() {
		return routeWord;
	}

	public void setRouteWord(String routeWord) {
		this.routeWord = routeWord;
	}

	@Override
	public String toString() {
		return "RouteSearchVO [from=" + from + ", to=" + to + ", routeWord=" + routeWord + "]";
	}
	
	
}
