<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나의 맛집 지도 목록</title>
<!-- <script src="https://code.jquery.com/jquery-1.11.3.js"></script> -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원정보상세</title>
<style>
/*전체 테두리*/
#all {
	margin: 30%;
}
/*탭 스타일*/
.tap {
	display: inline-block;
	border: 1px solid black;
	width: 100px;
}
/*테이블 스타일*/
#table {
	border: 1px solid black;
	width: 760px;
	text-align: left;
}

#sub {
	text-align: left;
}

/* 테이블 하위항목 정렬 */
#table {
	
}

/* 하위항목숨김처리 */
#sub {
	display: none;
}

#sub.active sub {
	display: block;
}
/* 서브버튼 */ 

#subButton {
right : 50px; 
display: inline-block;

	
}

#accordian {
margin-right : 30%;
}
</style>
</head>

<body>
	<div id="all">
		<div>
			<div id="tap_1" class="tap">
				<a href='<c:url value="/mypage/MydmForm" />'>내 등록 지도 </a>
			</div>
			<div id="tap_2" class="tap">
				<a href='<c:url value="/mypage/MydmForm" />'>내 관심 지도</a>
			</div>

			<c:forEach items="${myDmList}" var="DeliciousMapVO"
				varStatus="status">


				<table id="table">
					<tr><div id="test">
						<th><input id="accordian" class="${status.count}"
							name="DeliciousMapName" value="${DeliciousMapVO.deliciousMapName}" onclick="test(${status.count})"
							 readonly="readyonly">
						
								<input type="button" value="공개"> <input type="button"
									value="수정"> <input type="button" value="삭제">
						
							</div>
					</tr>

					<tr id="sub" class="sub${status.count}">
						<th><input name="DeliciousMapTag"
							value="${DeliciousMapVO.deliciousMapTag}" readonly="readyonly">
							<br> <input name="DeliciousMapOpen"
							value="${DeliciousMapVO.deliciousMapOpen}" readonly="readyonly">
							<br> <input name="DeliciousMapCreateDate"
							value="${DeliciousMapVO.deliciousMapCreateDate}"
							readonly="readyonly"> <br></th>

						<th id="deliciousMapTitle${status.count}" class="sub"></th>
						<th id="deliciousMapContent${status.count}" class="sub"></th>
						<th id="deliciousMapWriteDate${status.count}" class="sub"></th>
						<th id="deliciousMapImg${status.count}" class="sub"></th>
						<th id="deliciousMapGrade${status.count}" class="sub"></th>
						<th id="memberNum${status.count}" class="sub"></th>
						<th id="deliciousMapNum${status.count}" class="sub"></th>
				</table>
				</tr>

			</c:forEach>

		</div>
</body>


<script>
	function test(value) {
	
		$(".sub" + value).slideToggle();
		$.ajax({
			type : "GET",
			url : "<c:url value='/myDmReview'/>",
			data: "deliciousMapNum=" + value,
			dataType:"JSON",
			success: function(data){
				
				status = true;
				console.log(data);

				//앞전 데이터 삭제
					document.getElementById("deliciousMapTitle" + value).innerHTML = '';
		document.getElementById("deliciousMapContent" + value).innerHTML = '';
		document.getElementById("deliciousMapWriteDate" + value).innerHTML = '';
		document.getElementById("deliciousMapImg" + value).innerHTML = '';
		document.getElementById("deliciousMapGrade" + value).innerHTML = '';
		document.getElementById("memberNum" + value).innerHTML = '';
		document.getElementById("deliciousMapNum" + value).innerHTML = '';
				
		//데이터 삽입
				
				$.each(data, function(i,DeliciousReviewVO){
					console.log(DeliciousReviewVO.deliciousMapContent); 
					document.getElementById("deliciousMapTitle"+ value).innerHTML += DeliciousReviewVO.deliciousMapTitle;
					document.getElementById("deliciousMapContent" + value).innerHTML += DeliciousReviewVO.deliciousMapContent;
					document.getElementById("deliciousMapWriteDate"+ value).innerHTML += DeliciousReviewVO.deliciousMapWriteDate;
					document.getElementById("deliciousMapImg" + value).innerHTML += DeliciousReviewVO.deliciousMapImg;
					document.getElementById("deliciousMapGrade" + value).innerHTML += DeliciousReviewVO.deliciousMapGrade;
					document.getElementById("memberNum" + value).innerHTML += DeliciousReviewVO.memberNum;
					document.getElementById("deliciousMapNum" + value).innerHTML += DeliciousReviewVO.deliciousMapNum;

				});
				$(".sub").attr("onclick", "test_delete("+value+")");
				 },	
			error : function(xhr, status, error){
				status = true;
				alert("에러발생");
			}
		});
		
		
		}
	
</script>
</html>