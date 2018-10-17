<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	width: 100px;
	hight: 100px;
}

#circle {
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<body>
	<!-- /////////// 상단바  //////////// -->
	<%@ include file="../commons/top_bar.jsp"%>
	<div id="list">
		<c:forEach items="${dmDetail}" var="dmDetail" varStatus="status">
			<div id="listDetail">${dmDetail.deliciousMapName }
				<div id="posi">
					<a
						href="javascript:scrapFunction(${dmDetail.deliciousMapNum},${dmDetail.memberNum} );">
						<div id="circle"></div>
					</a>
				</div>
			</div>

			<img id="dmSumnail" src="${deliciousImg }">작성자 :
			<a href="javascript:memberFunction(${dmDetail.memberNum});">${dmDetail.memberEmail }</a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
설명 :${dmDetail.deliciousMapDetail }<br>
등록일자 :${dmDetail.deliciousMapCreateDate }<br>
평점 : ${gradeAvg}/5
</c:forEach>

		<hr>
		<c:forEach items="${deliciousDetail}" var="dDetail" varStatus="status">
${dDetail.deliciousName }
${dDetail.deliciousAddress }
</c:forEach>
		<hr>
		<c:forEach items="${reviewDetail}" var="rvDetail" varStatus="status">
${rvDetail.deliciousMapReviewTitle }
${rvDetail.deliciousMapReviewContent }
${rvDetail.deliciousMapReviewWriteDate }
${rvDetail.deliciousMapReviewImg }
${rvDetail.deliciousMapReviewGrade }
</c:forEach>
	</div>
	
	<script>	
	$(document).ready(function() {
		
		var turn = 0;
	});
	
	function scrapFunction(deliciousMapNum,memberNum ) {
			
		
		
			
			$.ajax({
				type : 'post',
				url : 'scrapCheck.do',
				data : {
					deliciousMapNum : deliciousMapNum,
					memberNum : memberNum,
					turn : trun
				},
				success : function(data) {
					if ($.trim(data) == "I") {
						$('#circle').css('background', 'red');
						turn = 1;
					
					} else {
						$('#circle').css('background', 'white');
						turn = 0;
					}
				}

			
			});
		}
		
function searchFunction(){
	 window.location.href="<%=request.getContextPath()%>/mainsearch?"
	       +'search3='
		 +$("#mainsearch").val()
		 +'&dbchoice='
		 +$('#dbchoice').val();
}

function memberFunction(memberNum){
	window.location.href="<%=request.getContextPath()%>/MydmForm?"
					+ 'memberNum=' + memberNum;
		}
	</script>
</body>
</html>

