<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
#list {
	margin: 20%;
}

#listDetail {
	border: 1px solid black;
	font-size: 45px;
	position: relative;
}

#dmSumnail {
	width: 200px;
	hight: 200px;
	margin: 10px;
}

#circle {
    font-size:13px;
    text-align:center;
    line-height: 45px;
    color: hotpink;
	width: 60px;
	height: 60px;
	border: 5px solid hotpink;
	border-radius: 50%;
}

#posi {
	position: absolute;
	right: 5px;
	top: 5px;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<body>
	<!-- /////////// 상단바  //////////// -->
	<%@ include file="../commons/top_bar.jsp"%>
	<div id="list">
		<c:forEach items="${dmDetail}" var="dmDetail" varStatus="status">
			<div id="listDetail">${dmDetail.deliciousMapName }
				<div id="posi"> 
					<a href="javascript:scrapFunction(${dmDetail.deliciousMapNum},${memberNum});">
						<div id="circle">스크랩</div>
					</a>
				</div>
			</div>
			<table>
			<tr>
			<td><img id="dmSumnail" src='${pageContext.request.contextPath}/resources/img/deliciousPin/${deliciousImg}'></td>
			<td>작성자 : <a href="javascript:memberFunction(${dmDetail.memberNum});">${dmDetail.memberEmail }</a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
설명 :${dmDetail.deliciousMapDetail }<br>
등록일자 :${dmDetail.deliciousMapCreateDate }<br>
평점 : ${gradeAvg}/5 
</td>
</tr>
</table>
</c:forEach>

		<hr>
		<c:forEach items="${deliciousDetail}" var="dDetail" varStatus="status">
${dDetail.deliciousName } 
${dDetail.deliciousAddress }
</c:forEach>
		<hr>
		<c:forEach items="${reviewDetail}" var="rvDetail" varStatus="status">
${rvDetail.deliciousMapTitle } 
${rvDetail.deliciousMapContent }
${rvDetail.deliciousMapWriteDate }
${rvDetail.deliciousMapImg }
${rvDetail.deliciousMapGrade }
</c:forEach>

<input type="hidden" id="scrapCheck" value="${scrapCheck}"/>

	</div>
	
	
	<script>	
	
	var turn = $('#scrapCheck').val(); // 1 or 0 스크랩 체크
	
	$(document).ready(function() {
		
		if(turn==1){ // 스크랩 되어있으면 배경색 변경
			$('#circle').css('background', 'red');
		}
		
	});
	function scrapFunction(deliciousMapNum,memberNum) {
			$.ajax({
				type : 'post',
				url : 'scrapCheck.do',
				data : {
					deliciousMapNum : deliciousMapNum,
					memberNum : memberNum,
					scrapCheck : turn
				},
				success : function(data) {
					if (turn == 0) {
						$('#circle').css('background', 'red');
						turn = 1;
					
					} else {
						$('#circle').css('background', 'white');
						turn = 0;
					}
				},
				error: function() {
					alert("ajax 에러");					
				}

			});
		}
		
function searchFunction(){
	 window.location.href="${pageContext.request.contextPath}/mainsearch?"
	       +'search3='
		 +$("#mainsearch").val()
		 +'&dbchoice='
		 +$('#dbchoice').val();
}

function memberFunction(memberNum){
	window.location.href="${pageContext.request.contextPath}/MydmForm?"
					+ 'memberNum=' + memberNum;
		}
	</script>
</body>
</html>

