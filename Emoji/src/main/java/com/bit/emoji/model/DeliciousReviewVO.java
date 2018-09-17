package com.bit.emoji.model;

import org.springframework.web.multipart.MultipartFile;

public class DeliciousReviewVO {
	private int deliciousReviewNum;
	private String deliciousReviewTitle;
	private String deliciousReviewContent;
	private String deliciousReviewWriteDate;
	private String deliciousReviewImg;
	private MultipartFile deliciousReviewFile;
	private double deliciousReviewGrade;
	private int deliciousPinNum;
	private int memberNum;
}