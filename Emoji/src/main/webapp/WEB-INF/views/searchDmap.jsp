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
				<td><a href="javascript:clickFunction(${search.deliciousMapNum});"><img src="${search.deliciousImg }"></a></td>
				<td><a href="javascript:clickFunction(${search.deliciousMapNum});" id="lsittitle" >${search.deliciousMapName}</a><br>
					<br> ${search.deliciousMapDetail}<br> <br> 스크랩수 
					by <a href="javascript:memberFunction(${search.memberNum});">${search.memberEmail }</a> 작성일
					${search.deliciousMapCreateDate }</td>
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
	
	function clickFunction(deliciousMapNum){
		window.location.href="<%=request.getContextPath()%>/deliciousDetail?"
		       +'deliciousMapNum='
			 +deliciousMapNum;
	}
	
	function memberFunction(memberNum){
		window.location.href="<%=request.getContextPath()%>/MydmForm?"
		       +'memberNum='
			 +memberNum;
	}
</script>
</body>
</html>


