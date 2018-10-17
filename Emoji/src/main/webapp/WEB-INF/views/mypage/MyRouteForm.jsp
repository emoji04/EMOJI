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
#myRouteBox {
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
</style>


</head>

<body>
	<%@ include file="../commons/top_bar.jsp"%>


	<div id="all">
		<!-- 전체를 묶는 Div 위 아래 여백  -->
		<div>
			<!-- <내 등록 원정대 / 내 관심 원정대 tap> -->
			<span id="tap_1" class="tap"><a
				href='<c:url value="MyRouteForm" />'>내 등록 원정대 </a></span> <span id="tap_2"
				class="tap"><a href='<c:url value="MyRouteForm" />'>내 관심
					원정대</a></span>
		</div>
		<div id="myRouteBox">
			<!-- 내 등록 원정대 화면 가운데 상자 넓이/크기  -->
			<div>
				<!-- 내 등록 원정대 (전체선택란) -->
				<input type="checkbox">전체선택<input type="button" value="선택공개"><input
					type="button" value="선택삭제">
			</div>
			<c:forEach items="${myRouteList}" var="RouteVO" varStatus="status">
				<div>
					<!-- 내 등록 원정대 List -->
					<input type="checkbox"> <input type="text" name="routeName"
						value="${RouteVO.routeName}"
						onclick="CallmyDmList(${RouteVO.memberNum}, ${status.count})">
					<input name="routeCreateDate" value="${RouteVO.routeCreateDate}"
						readonly="readyonly"> <input type="button" value="비공개">
					<input type="button" value="수정"> <input type="button"
						value="삭제"> <br>
					<div class="subClass" id="accordian${status.count}">
						<input name="routeTag" value="${RouteVO.routeTag}">
						<div id="map${status.count}" class="map"></div>
						<br>
						<!-- 리뷰 상세목록 -->
						<p id="startDate${status.count}"></p>
						<p id="spendTime${status.count}"></p>
						<p id="budget${status.count}"></p>
						<p id="rule${status.count}"></p>
						<p id="routeTag${status.count}"></p>
						<p id="encore${status.count}"></p>
						<p id="routeGarde${status.count}"></p>
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
	

})


// 아코디언 Function 
	function CallmyDmList(value, value1) {
		//현재 열려있는 항목 모두 닫음
		$(".subClass").slideUp(); 
		
		//선택항목 열림 
		$("#accordian"+value1).slideDown();

		
		
		//리뷰 Ajax
		$.ajax({
			type : "POST",
			url : "<c:url value='myDmReview'/>",
			data: "deliciousMapNum=" + value,
			dataType:"JSON",
			success: function(data){
				
				console.log(data);

				//앞전 데이터 삭제
				document.getElementById("deliciousMapTitle" + value1).innerHTML = '';
				document.getElementById("deliciousMapContent" + value1).innerHTML = '';
				document.getElementById("deliciousMapWriteDate" + value1).innerHTML = '';
				document.getElementById("deliciousMapImg" + value1).innerHTML = '';
				document.getElementById("deliciousMapGrade" + value1).innerHTML = '';
				
				//데이터 삽입
				
				$.each(data, function(i,DeliciousMapReviewVO){
				console.log(DeliciousMapReviewVO.deliciousMapContent); 
				document.getElementById("deliciousMapTitle" + value1).innerHTML += "<p>" +DeliciousMapReviewVO.deliciousMapTitle+ "<br>"+"</p>";
				document.getElementById("deliciousMapContent" + value1).innerHTML += "<p>" +DeliciousMapReviewVO.deliciousMapContent+ "<br>"+"</p>";
				document.getElementById("deliciousMapWriteDate"+ value1).innerHTML += "<p>" +DeliciousMapReviewVO.deliciousMapWriteDate+ "<br>"+"</p>";
				document.getElementById("deliciousMapImg" + value1).innerHTML +="<p>" + DeliciousMapReviewVO.deliciousMapImg+ "<br>"+"</p>";
				document.getElementById("deliciousMapGrade" + value1).innerHTML += "<p>" +DeliciousMapReviewVO.deliciousMapGrade+ "<br>"+"</p>";

				});
				 },	
			error : function(xhr, status, error){
				alert("에러발생");
			}
		});
		
		//지도 핀찍을 주소 정보 출력 
		$.ajax({
			type : "POST",
			url : "<c:url value='myDeliciousList'/>",
			data: "deliciousMapNum=" + value,
			dataType:"JSON",
			success: function(data){
				
				console.log(data);

				
				var addressList = [];  //주소를 담기 위한 배열
				var pinNameList = [];  //핀 이름을 담기 위한 배열	
				var phoneList = [];    //전화번호를 담기 위한 배열
				var detailList = [];   //상세정보를 담기 위한 배열
				var photoList = [];    //사진이름을 담기 위한 배열
				
				//주소, 핀 이름, 전화번호, 상세정보, 사진이름을 배열에 담기
				$(data).each(function(index, deliciousPin) {
					addressList.push(deliciousPin.deliciousAddress);
					pinNameList.push(deliciousPin.deliciousName);
					phoneList.push(deliciousPin.deliciousPhone);
					detailList.push(deliciousPin.deliciousDetail);
					photoList.push(deliciousPin.deliciousImg);
		 		});
				
				
				
			 	$(".map").each(function(value1){
					
					var mapContainer = document.getElementById('map'+(value1+1)); // 지도를 표시할 div 
					var mapOption = {
						center: new daum.maps.LatLng(37.5676184544478, 126.98855631199186), // 지도의 중심좌표
						level: 3 // 지도의 확대 레벨
					};  
					var map= new daum.maps.Map(mapContainer, mapOption);   //지도 생성, 객체 리턴
					
					var imgSrc = 'resources/img/deliciousPin.png', //마커 이미지 주소
					imgSize = new daum.maps.Size(30, 30);  //마커 이미지 크기

				var markerImg = new daum.maps.MarkerImage(imgSrc, imgSize);
				
				var geocoder = new daum.maps.services.Geocoder();    //주소-좌표 변환 객체 생성
				
				addressList.forEach(function(addressList, index) {
						//주소로 좌표 검색
						geocoder.addressSearch(addressList, function(result, status) {
							//정상적으로 검색이 완료됐으면
							if(status == daum.maps.services.Status.OK) {
								var coords = new daum.maps.LatLng(result[0].y, result[0].x);
								
								//지도의 중심을 결과값으로 받은 위치로 이동
								map.setCenter(coords);
								
								//지도에 클릭한 위치에 표출할 마커 생성
								var marker = new daum.maps.Marker({
									image: markerImg,     //마커 이미지 설정
									position: coords
								}); 
								
								marker.setMap(map);   //지도에 마커 표시 
								
								//마커 위에 커스텀 오버레이 표시
								var overlay = new daum.maps.CustomOverlay({
									position: marker.getPosition()
								});
								
								//커스텀 오버레이에 표시할 컨텐츠
								var content = document.createElement('div');
								content.className = 'wrap';
								document.body.appendChild(content);
												  
								var info = document.createElement('div');
								info.className = 'info';
								content.appendChild(info);

								var title = document.createElement('div');
								title.className = 'title';
								title.appendChild(document.createTextNode(pinNameList[index]));
								info.appendChild(title);
												  
								var closeBtn = document.createElement('button');
								closeBtn.className = 'close';
								//커스텀 오버레이 닫기
								closeBtn.appendChild(document.createTextNode('X'));
								closeBtn.onclick = function() { overlay.setMap(null); };
								title.appendChild(closeBtn);
												  
								var contentBox = document.createElement('div');
								contentBox.className = 'contentBox';
								info.appendChild(contentBox);
									
								var image = document.createElement('img');
								image.className = 'imageInfo';
								image.src = 'resources/uploadFile/deliciousPinPhoto/' + photoList[index];
								image.width = '70';
								image.height = '73';
								contentBox.appendChild(image);
												  
								var desc = document.createElement('div');
								desc.className = 'desc';
								contentBox.appendChild(desc);
												  
								var address = document.createElement('div');
								address.className = 'address';
								address.appendChild(document.createTextNode(addressList[index]));
								desc.appendChild(address);
												  
								var phone = document.createElement('div');
								phone.className = 'phone';
								phone.appendChild(document.createTextNode(phoneList[index]));
								desc.appendChild(phone);
												  
								var detail = document.createElement('div');
								detail.className = 'detail';
								detail.appendChild(document.createTextNode(detailList[index]));
								desc.appendChild(detail);
									
								//커스텀 오버레이 컨텐츠 담기
								overlay.setContent(content);
									
								//마커 클릭 시, 커스텀 오버레이 표시
								daum.maps.event.addListener(marker, 'click', function() {
									overlay.setMap(map);
								}); 
							}
						});
					});
					
				});

				//앞전 데이터 삭제
				/* document.getElementById("deliciousName" + value1).innerHTML = '';
				document.getElementById("deliciousAddress" + value1).innerHTML = '';
				document.getElementById("deliciousCategory" + value1).innerHTML = '';
				document.getElementById("deliciousPhone" + value1).innerHTML = '';
				document.getElementById("deliciousGrade" + value1).innerHTML = '';
				document.getElementById("deliciousDetail" + value1).innerHTML = '';
				document.getElementById("deliciousImg" + value1).innerHTML = ''; */

				//데이터 삽입
		/* 		$.each(data, function(i,DeliciousVO){
				document.getElementById("deliciousName" + value1).innerHTML += "<p>" +DeliciousVO.deliciousName+ "<br>"+"</p>";
				document.getElementById("deliciousAddress" + value1).innerHTML += "<p>" +DeliciousVO.deliciousAddress+ "<br>"+"</p>";
				document.getElementById("deliciousCategory"+ value1).innerHTML += "<p>" +DeliciousVO.deliciousCategory+ "<br>"+"</p>";
				document.getElementById("deliciousPhone" + value1).innerHTML +="<p>" + DeliciousVO.deliciousPhone+ "<br>"+"</p>";
				document.getElementById("deliciousGrade" + value1).innerHTML += "<p>" +DeliciousVO.deliciousGrade+ "<br>"+"</p>";
				document.getElementById("deliciousDetail" + value1).innerHTML += "<p>" +DeliciousVO.deliciousDetail+ "<br>"+"</p>";
				document.getElementById("deliciousImg" + value1).innerHTML += "<p>" +DeliciousVO.deliciousImg+ "<br>"+"</p>";

				}); */
				 },	
				 error : function(xhr, status, error){
						alert("에러발생");
					}
				});
}
			
	
</script>
</html>