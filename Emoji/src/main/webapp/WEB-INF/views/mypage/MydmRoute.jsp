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
<style>
/*전체 테두리*/
#all {
	margin: 10%;
}
/*탭 스타일*/
/*상세정보 전체 창*/
#myDmBox {
	/* border: 1px solid black; */
	width: 1000px;
	height: auto;
	padding: 15px;
	margin: 0 auto;
	background-color: white;
	border-radius: 20px;
}

.input_button {
	color: black;
	padding: 10px 20px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 3px 2px;
	cursor: pointer;
	background-color: white;
	border: #e7e7e7 1px solid;
	border-radius: 10px;
}

.tap {
	padding: 5px;
	margin: 20px;
	margin-left: 0px;
	margin-right: 0px;
	font-size: 18px;
	border: #999999 solid 1px;
	border-bottom: none;
	border-radius: 10px 10px 0 0;
}

.taponly {
	background-color: #E7E7E7;
}

.the_tap {
	border: #999999 solid 1px;
	border-radius: 0 10px 10px 10px;
	padding: 10px;
}

/* 하위항목숨김처리 */
.subClass { /* 큰 지도 */
	display: none;
}

.routeName {
	width: 300px;
}

.detailDmbox {
	margin: 5px;
	height: auto;
	border: #BEBEBE solid 1px;
	border-bottom: none;
	border-radius: 10px 10px 0 0;
	padding: 10px;
}

input[type=text] {
	border: none;
	/* border-bottom: 1px solid #F3F3F3; */
}

/* 지도 크기  */
.map {
	width: 100%;
	height: 500px;
}

.Retable td {
	width: auto;
	border: 1px solid black;
}

wrap {
	position: absolute;
	left: 0;
	bottom: 40px;
	width: 288px;
	height: 132px;
	margin-left: -140px;
	text-align: left;
	overflow: hidden;
	font-size: 12px;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	line-height: 1.5;
}

.wrap * {
	padding: 0;
	margin: 0;
}

.wrap .info {
	width: 286px;
	height: 125px;
	border-radius: 5px;
	border-bottom: 2px solid #ccc;
	border-right: 1px solid #ccc;
	overflow: hidden;
	background: #fff;
}

.wrap .info:nth-child(1) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.wrap .title {
	padding: 2px 0 0 10px;
	height: 30px;
	background: #eee;
	border-bottom: 1px solid #ddd;
	font-size: 18px;
	font-weight: bold;
}

.close {
	float: right;
	margin-top: 1%;
	margin-right: 5%;
}

.contentBox {
	position: relative;
	float: left;
	width: 100%;
}

.desc {
	overflow: hidden;
	position: relative;
	float: left;
	margin-top: 5%;
	width: 50%;
	margin-left: 35%;
}

.desc .address {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.desc .phone {
	font-size: 13px;
	color: #888;
	margin-top: -2px;
}

.desc .detail {
	color: #5085BB;
	margin-top: 3px;
}

.imageInfo {
	position: absolute;
	top: 10px;
	left: 5px;
	width: 73px;
	height: 71px;
	border: 1px solid #ddd;
	color: #888;
	overflow: hidden;
	margin-left: 3%;
}

.selectbox {
	text-align: left;
}

#routeTag {
	text-align: center;
	margin: 5px;
}

.routeTag {
	border: hidden;
}

.img {
	left: 0;
	width: 50px;
	height: 50px;
	border: 1px solid red;
	float: left;
	margin: 5px 0px 0px 10px;
}

.title {
	margin: 5px 30px 0px 10px;
	width: 130px;
	height: 50px;
	border: 1px solid blue;
	float: left;
}

.content {
	border: 1px solid green;
	width: 75%;
	height: auto;
	float: left;
	margin: 5px 0px 30px 10px;
}

.left_bt {
	display: inline-block;
	position: relative;
	left: 120px;
}
</style>


</head>

<body style="background-color: #F3F3F3">
	<%@ include file="../commons/top_bar.jsp"%>


	<div id="all">
		<!-- 전체를 묶는 Div 위 아래 여백  -->
		
			<div id="myDmBox">
				<div>
					<!-- <내 등록원정대/ 내 관심 원정대 tap> -->
					<span id="taponly" class="taponly"><a
						href='<c:url value="MydmRoute" />'>나의 원정대 </a></span> 
				</div>
		
				<div class="the_tap">
					<!-- 내 등록 지도 화면 가운데 상자 넓이/크기  -->
					<c:forEach items="${myRouteList}" var="RouteVO" varStatus="status">
					<div class="detailDmbox">
						<!-- 내 등록 지도 List -->
						<input type="text" class="routeName" name="routeName"
							value="${RouteVO.routeName}"
							onclick="CallmyDmList(${RouteVO.routeNum}, ${status.count})">
						<input type="text" name="routeCreateDate"
							value="${RouteVO.routeCreateDate}" readonly="readyonly">
						<div class="left_bt">
						 <input	type="button" class="input_button" value="삭제"
								onclick="deleteDeliciousMap(${DeliciousMapVO.deliciousMapNum})">
						</div>
						<br>
						<div class="subClass" id="accordian${status.count}">
							<div id="routeTag">
								<input class="routeTag" name="routeTag"
									value="${RouteVO.routeTag}" readonly="readyonly">
							</div>
							<div id="map${status.count}" class="map"></div>

						</div>
					</div>
					</c:forEach>
				</div>
				
			</div>
	</div>
</body>

<script> 


//지도 
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		level : 3
	// 지도의 확대 레벨
	};
	//지도를 생성합니다    
	var map = new daum.maps.Map(mapContainer, mapOption);
	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new daum.maps.ZoomControl();
	map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
	// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
	if (navigator.geolocation) {
		// GeoLocation을 이용해서 접속 위치를 얻어옵니다
		navigator.geolocation.getCurrentPosition(function(position) {
			var lat = position.coords.latitude, // 위도
			lon = position.coords.longitude; // 경도
			var locPosition = new daum.maps.LatLng(lat, lon) // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다	
			map.setCenter(locPosition);
		});
	}


// 나의 원정대 삭제 
function deleteDeliciousMap(value) {
	$.ajax({
		type : "POST",
		url : "<c:url value='/DeliciousMapDelete'/>",
		data: "deliciousMapNum=" + value,
		dataType:"text",
		success: function(data){
			console.log(data);

			$.each(data, function(i,DeliciousMapReviewVO){
				console.log(DeliciousMapReviewVO.deliciousMapContent); 
				document.getElementById("deliciousMapTitle" + value1).innerHTML += "<td class='title'>" +DeliciousMapReviewVO.deliciousMapTitle+ "<br>"+"</td>";
				document.getElementById("deliciousMapContent" + value1).innerHTML += "<td class='content'>" +DeliciousMapReviewVO.deliciousMapContent+ "<br>"+"</td>";
				document.getElementById("deliciousMapWriteDate"+ value1).innerHTML += "<td>" +DeliciousMapReviewVO.deliciousMapWriteDate+ "<br>"+"</td>";
				document.getElementById("deliciousMapImg" + value1).innerHTML +="<td class='img'>" + DeliciousMapReviewVO.deliciousMapImg+ "<br>"+"</td>";
				document.getElementById("deliciousMapGrade" + value1).innerHTML += "<td>" +DeliciousMapReviewVO.deliciousMapGrade+ "<br>"+"</td>";
			});
			},
	error : function(xhr, status, error){
		alert("에러발생");
	}
		
});
}


// 아코디언 Function 
	function CallmyDmList(value, value1) {
		//현재 열려있는 항목 모두 닫음
		$(".subClass").slideUp(); 
		
		//선택항목 열림 
		$("#accordian"+value1).slideDown();
}
			
	
</script>
</html>