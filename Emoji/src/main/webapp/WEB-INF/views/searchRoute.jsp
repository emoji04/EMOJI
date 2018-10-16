<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
#listtable {
	margin: 10% auto;
}

#lsittitle {
	font-size: 30px;
}
</style>
<body>
<!-- /////////// 상단바  //////////// -->
<%@ include file="commons/top_bar.jsp"%>
<div id="list">
	<table id="listtable" style="border: 1px solid black;">
		<c:forEach items="${Search}" var="search" varStatus="status">
			<tr style="border: 1px solid black; display: none" class="lastlist"
				name="${status.last}" id="${status.index }">
				<td><a href="javascript:clickFunction(${search.routeNum });" id="lsittitle">${search.routeName}</a><br>
				주최자 : <a href="javascript:memberFunction(${search.memberNum });">${search.memberName }</a><br>
				참여인원 : ${search.possibleNum }<br>
				제한사항 : ${search.rule}<br>
				스크랩수 작성일 ${search.routeCreateDate }</td>
			</tr>
		</c:forEach>

		<tr>
			<td style="border: 1px solid black;"><a
				href="javascript:addFunction();">더보기</a></td>
		</tr>
	</table>
</div>

<script>
	var itemCount = 0;
	$(document).ready(function() {
		for (var i = 0; i < 5; i++) {
			$('#' + i).css('display', 'block');
		}
		itemCount = 5;
	});

	function addFunction() {
		var name_by_class = $('.lastlist').attr('name');

		for (var i = itemCount; i < itemCount + 5; i++) {
			$('#' + i).css('display', 'block');
		}
		itemCount += 5;
		if (name_by_class) {
			alert('모든 리스트가 출력되었습니다.');
		}
	}
	function clickFunction(routeNum){
		window.location.href="<%=request.getContextPath()%>/routeDetail?"
		       +'routeNum='
			 +routeNum;
	}
	
	function memberFunction(memberNum){
		window.location.href="<%=request.getContextPath()%>/MyrmForm?"
		       +'memberNum='
			 +memberNum;
	}
</script>
	
</body>
</html>
