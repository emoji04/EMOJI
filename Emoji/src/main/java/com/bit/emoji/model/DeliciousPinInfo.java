package com.bit.emoji.model;

import java.util.List;

public class DeliciousPinInfo {
	private List<DeliciousVO> deliciousPinInfo;
	
	public DeliciousPinInfo() { }

	public DeliciousPinInfo(List<DeliciousVO> deliciousPinInfo) {
		super();
		this.deliciousPinInfo = deliciousPinInfo;
	}

	public List<DeliciousVO> getDeliciousPinInfo() {
		return deliciousPinInfo;
	}

	public void setDeliciousPinInfo(List<DeliciousVO> deliciousPinInfo) {
		this.deliciousPinInfo = deliciousPinInfo;
	}
}