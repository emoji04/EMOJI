<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<body>
<!-- /////////// 상단바  //////////// -->
<%@ include file="../commons/top_bar.jsp"%>
<c:forEach items="${dmDetail}" var="dmDetail" varStatus="status">
${dmDetail.deliciousMapName }
${dmDetail.deliciousMapDetail }
${dmDetail.deliciousMapCreateDate }
<!-- 	private String memberEmail; -->
<!-- 	private String deliciousPinImg; -->
</c:forEach>
<script>
function searchFunction(){
	
	 window.location.href="<%=request.getContextPath()%>/mainsearch?"
	       +'search3='
		 +$("#mainsearch").val()
		 +'&dbchoice='
		 +$('#dbchoice').val();
}
</script>
</body>
</html>

