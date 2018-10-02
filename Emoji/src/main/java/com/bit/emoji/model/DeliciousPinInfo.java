package com.bit.emoji.model;

import java.util.List;

public class DeliciousPinInfo {
	private List<DeliciousPinVO> deliciousPinInfo;
	
	public DeliciousPinInfo() { }

	public DeliciousPinInfo(List<DeliciousPinVO> deliciousPinInfo) {
		super();
		this.deliciousPinInfo = deliciousPinInfo;
	}

	public List<DeliciousPinVO> getDeliciousPinInfo() {
		return deliciousPinInfo;
	}

	public void setDeliciousPinInfo(List<DeliciousPinVO> deliciousPinInfo) {
		this.deliciousPinInfo = deliciousPinInfo;
	}
}