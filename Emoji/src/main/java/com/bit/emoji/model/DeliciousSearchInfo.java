package com.bit.emoji.model;

import java.util.List;

public class DeliciousSearchInfo {
	private List<DeliciousSearchVO> deliciousSearchInfo;
	
	public DeliciousSearchInfo() {}

	public DeliciousSearchInfo(List<DeliciousSearchVO> deliciousSearchInfo) {
		super();
		this.deliciousSearchInfo = deliciousSearchInfo;
	}

	public List<DeliciousSearchVO> getDeliciousSearchInfo() {
		return deliciousSearchInfo;
	}

	public void setDeliciousSearchInfo(List<DeliciousSearchVO> deliciousSearchInfo) {
		this.deliciousSearchInfo = deliciousSearchInfo;
	}
}