<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@page import="com.bit.emoji.service.ScrapCheckService"%>
<%@page import="com.bit.emoji.model.DeliciousMapScrapVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	int deliciousMapNum = Integer.parseInt(request.getParameter("deliciousMapNum"));
	int memberNum = Integer.parseInt(request.getParameter("memberNum"));
	String turn = request.getParameter("turn");
	
System.out.print(deliciousMapNum+ memberNum+turn);
	
	DeliciousMapScrapVO deliciousMapScrapVO = null;
	
	deliciousMapScrapVO.setDeliciousMapNum(deliciousMapNum);
	deliciousMapScrapVO.setMemberNum(memberNum);
	
	ScrapCheckService scrapCheckService = null;
	
	String str = "";
	
	if(turn.equals("0")){
		scrapCheckService.insertScrap(deliciousMapScrapVO);
		str = "I";
		out.print(str);
	} else {
		scrapCheckService.deleteScrap(deliciousMapScrapVO);
		str = "D";
		out.print(str);
	}

	
%>
