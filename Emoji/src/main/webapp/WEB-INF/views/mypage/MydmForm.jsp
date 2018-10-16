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
.subClass { /* 큰 지도 */
	display: none;
}
/* .Resub { 
display: none;
}
 */
/* 테이블 */
table {
	border: 1px solid black;
}

/* 지도 크기  */
.map {
	width: 100%;
	height: 500px;
}

.Retable td{
width : auto ;
border : 1px solid black;
}

/* 드랍다운 */

.dropdown {
    position: relative;
    display: inline-block;
}

.dropdown-content {
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    padding: 12px 16px;
    z-index: 1;
}
.dropdown:hover .dropdown-content {
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
				href='<c:url value="MydmForm" />'>내 등록 지도 </a></span> <span id="tap_2"
				class="tap"><a href='<c:url value="MydmForm" />'>내 관심 지도</a></span>
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
					<!-- 내 등록 지도 List -->
					<input type="checkbox"> <input type="text"
						name="DeliciousMapName" value="${DeliciousMapVO.deliciousMapName}"
						onclick="CallmyDmList(${DeliciousMapVO.deliciousMapNum}, ${status.count})">
					<input name="DeliciousMapCreateDate"
						value="${DeliciousMapVO.deliciousMapCreateDate}"
						readonly="readyonly"> <input type="button" value="비공개">
					<input type="button" value="수정"> <input type="button"
						value="삭제"> <br>
					<div class="subClass" id="accordian${status.count}">
						<input name="DeliciousMapTag"
							value="${DeliciousMapVO.deliciousMapTag}">
						<div id="map${status.count}" class="map"></div>
						<br>
								<!-- 리뷰 상세목록 -->
							<div class="dropdown">
							<p id="deliciousMapReviewTitle${status.count}"></p>
							</div>
							<div class="dropdown-content" onclick = "dropdown()">
							<p id="deliciousMapReviewContent${status.count}"></p>
							<p id="deliciousMapReviewWriteDate${status.count}"></p>
							<p id="deliciousMapReviewImg${status.count}"></p>
							<p id="deliciousMapGrade${status.count}"></p>
							</div>

					</div>
				</div>
			</c:forEach>


		</div>

	</div>



</body>

<script> 

/* 리뷰 클릭이벤트 */
 
//지도 


$(function() {
	
 	$(".map").each(function(value1){
		
		var mapContainer = document.getElementById('map'+(value1+1)); // 지도를 표시할 div 
		var mapOption = {
			center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level: 3 // 지도의 확대 레벨
		};  
		var map= new daum.maps.Map(mapContainer, mapOption);   //지도 생성, 객체 리턴
	}); 
	


});


// 아코디언 Function 
	function CallmyDmList(value, value1) {
		//현재 열려있는 항목 모두 닫음
		$(".subClass").slideUp(); 
		
		//선택항목 열림 
		$("#accordian"+value1).slideDown();

		
		
		//Ajax 통신 
		$.ajax({
			type : "POST",
			url : "<c:url value='myDmReview'/>",
			data: "deliciousMapNum=" + value,
			dataType:"JSON",
			success: function(data){
				
				console.log(data);

				//앞전 데이터 삭제
				document.getElementById("deliciousMapReviewTitle" + value1).innerHTML = '';
				document.getElementById("deliciousMapReviewContent" + value1).innerHTML = '';
				document.getElementById("deliciousMapReviewWriteDate" + value1).innerHTML = '';
				document.getElementById("deliciousMapReviewImg" + value1).innerHTML = '';
				document.getElementById("deliciousMapGrade" + value1).innerHTML = '';
				
				//데이터 삽입
				
				$.each(data, function(i,DeliciousMapReviewVO){
				console.log(DeliciousMapReviewVO.deliciousMapReviewContent); 
				document.getElementById("deliciousMapReviewTitle" + value1).innerHTML += "<p>" +DeliciousMapReviewVO.deliciousMapReviewTitle+ "<br>"+"</p>";
				document.getElementById("deliciousMapReviewContent" + value1).innerHTML += "<p>" +DeliciousMapReviewVO.deliciousMapReviewContent+ "<br>"+"</p>";
				document.getElementById("deliciousMapReviewWriteDate"+ value1).innerHTML += "<p>" +DeliciousMapReviewVO.deliciousMapReviewWriteDate+ "<br>"+"</p>";
				document.getElementById("deliciousMapReviewImg" + value1).innerHTML +="<p>" + DeliciousMapReviewVO.deliciousMapReviewImg+ "<br>"+"</p>";
				document.getElementById("deliciousMapGrade" + value1).innerHTML += "<p>" +DeliciousMapReviewVO.deliciousMapGrade+ "<br>"+"</p>";

				});
				 },	
			error : function(xhr, status, error){
				alert("에러발생");
			}
		});
		
	}
			
	
</script>
</html>