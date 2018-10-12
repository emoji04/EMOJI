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
<script type="text/javascript"
	src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=377fa9901a70a356db9e8b6e1ab1a3a9&libraries=services"></script>
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
/*상세정보 전체 창*/
#myDmBox {
	border: 1px solid black;
	width: 900px;
	height: auto;
}

/* 하위항목숨김처리 */
.subClass {
	display: none;
	display: block;
}
</style>
</head>

<body>
	<%@ include file="../commons/top_bar.jsp"%>


	<div id="all">
		<!-- 전체를 묶는 Div 위 아래 여백  -->
		<div>
			<!-- <내 등록지도/ 내 관심지도 tap> -->
			<span id="tap_1" class="tap"><a
				href='<c:url value="/mypage/MydmForm" />'>내 등록 지도 </a></span> <span
				id="tap_2" class="tap"><a
				href='<c:url value="/mypage/MydmForm" />'>내 관심 지도</a></span>
		</div>
		<div id="myDmBox">
			<!-- 내 등록 지도 화면 가운데 상자 넓이/크기  -->
			<div>
				<!-- 내 등록 지도 (전체선택란) -->
				<input type="checkbox">전체선택<input type="button" value="선택공개"><input
					type="button" value="선택삭제">
			</div>
			<c:forEach items="${myDmList}" var="DeliciousMapVO"
				varStatus="status">
				<div>
					<!-- 내 등록 지도 제목 List -->

					<input type="checkbox"> <input type="text" id="accordian"
						class="${status.count}" name="DeliciousMapName"
						value="${DeliciousMapVO.deliciousMapName}"
						onclick="CallmyDmList(${status.count})"> <input
						name="DeliciousMapCreateDate"
						value="${DeliciousMapVO.deliciousMapCreateDate}"
						readonly="readyonly"> <input type="button" value="비공개">
					<input type="button" value="수정"> <input type="button"
						value="삭제"> <br> <input class="subClass"
						name="DeliciousMapTag" value="${DeliciousMapVO.deliciousMapTag}">
					<input class="subClass" id="map"
						style="width: 500px; height: 400px;">
						<table>
					<tr>
						<!-- 리뷰 상세목록 -->
						<td id="deliciousMapTitle${status.count}"></td>
						<td id="deliciousMapContent${status.count}"></td>
						<td id="deliciousMapWriteDate${status.count}"></td>
						<td id="deliciousMapImg${status.count}"></td>
						<td id="deliciousMapGrade${status.count}"></td>
						<td id="memberNum${status.count}"></td>
						<td id="deliciousMapNum${status.count}"></td>
					</tr>
				</table>
				</div>
			</c:forEach>


		</div>
	</div>



</body>


<script>
//지도 

var container = document.getElementById('map');
		var options = {
			center: new daum.maps.LatLng(33.450701, 126.570667),
			level: 3
		};

		var map = new daum.maps.Map(container, options);
		
	function CallmyDmList(value) {
		//현재 열려있는 항목 모두 닫음
		$(".subClass").slideUp(); 
		
		//선택항목 열림 
		$("#sub" + value).slideToggle();

		//Ajax 통신 
		$.ajax({
			type : "GET",
			url : "<c:url value='/myDmReview'/>",
			data: "deliciousMapNum=" + value,
			dataType:"JSON",
			success: function(data){
				
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
				document.getElementById("deliciousMapTitle"+ value).innerHTML += "<th>" + DeliciousReviewVO.deliciousMapTitle+ "<br>" + "</th>";
				document.getElementById("deliciousMapContent" + value).innerHTML += "<td>" +DeliciousReviewVO.deliciousMapContent+ "<br>"+"</td>";
				document.getElementById("deliciousMapWriteDate"+ value).innerHTML += "<td>" +DeliciousReviewVO.deliciousMapWriteDate+ "<br>"+"</td>";
				document.getElementById("deliciousMapImg" + value).innerHTML +="<td>" + DeliciousReviewVO.deliciousMapImg+ "<br>"+"</td>";
				document.getElementById("deliciousMapGrade" + value).innerHTML += "<td>" +DeliciousReviewVO.deliciousMapGrade+ "<br>"+"</td>";
				document.getElementById("memberNum" + value).innerHTML += "<td>" +DeliciousReviewVO.memberNum+ "<br>"+"</td>";
				document.getElementById("deliciousMapNum" + value).innerHTML +="<td>" + DeliciousReviewVO.deliciousMapNum+ "<br>"+"</td>";

				});
				 },	
			error : function(xhr, status, error){
				alert("에러발생");
			}
		});
		
		
		}
	
</script>
</html>