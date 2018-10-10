<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=377fa9901a70a356db9e8b6e1ab1a3a9&libraries=services"></script>
<style>
 	ul.tab {
		margin: 0;
		padding: 0;
		float: left;
		list-style: none;
		height: 32px;
		border-bottom: 1px solid #999;
		border-left: 1px solid #999;
		width: 100%;
	}
	
	ul.tab li {
		float: left;
		margin: 0;
		padding: 0;
		height: 31px;
		line-height: 31px;
		border: 1px solid #999;
		border-left: none;
		margin-bottom: -1px;
		overflow: hidden;
		position: relative;
		background: #e0e0e0;
	}
	
	ul.tab li a {
		text-decoration: none;
		color: #000;
		display: block;
		padding: 0 20px;
		border: 1px solid #fff;
		outline: none;
	}
	
	ul.tab li a:hover {
		background: #ccc;
	}
	
	html ul.tab li.active, html ul.tab li.active a:hover {
		backgroud: #fff;
		border-bottom: 1px solid #fff;
	}
	
	.active{
		cursor: pointer;
	}
	
	.click {
		font-weight: bold;
	}
	
	#container {
		border: 1px solid #999;
/* 		border-top: none; */
		overflow: hidden;
		clear: both;
		float: left;
		width: 100%;
		background: #fff;
	}
	
	.tab_content {
		padding: 20px;
	}
	
 	#left {
 		margin-top: 150px;
 	 	padding-left: 50px;
 		width:30%;
 	}
 	
 	#pinContent {
	 	margin-top: 30px;
 	}
 	
 	.textBox {
	 	padding-left: 5px; 
	 	margin-bottom: 20px;
	 }
 	
 	input[type=text], select, #makePinBtn {
 		width: 100%;
 		padding-left: 5px;
 	}
 	
 	 #right {
 	 	padding-left: 2%;
 	 	width:63%;
 	 	float: left;
 	}
 	
 	#map {
 		width: 100%;
 		height: 500px;
 		margin-top: 7px;
 	}
</style>
</head>
<body>
<%@ include file="../commons/top_bar.jsp"%>
	
<div id="left">
	<div id="container">
		<ul class="tab">
			<li class="active click" id="makePin_li" onclick="viewMake()">핀 만들기</li>
			<li class="active" id="checkPinList_li" onclick="viewCheck()">핀 리스트 확인</li>
		</ul>
		
		<div class="tab_container">
			<!-- 핀 만들기 탭 -->
			<div id="makePin" class="tab_content" style="display: block;">
				<div id="pinContent">
					<form id="pinInfo" action="<c:url value='/deliciousPinInfo' />" method="post" enctype="multipart/form-data" onsubmit="return save($(this));">
						<input type="hidden" name="deliciousMapNum" value="8">
						
						<label>주소</label>
							<div class="textBox">
    							<input type="text" id="deliciousPinAddress" name="deliciousPinAddress">
    							<input type="button" id="addrSearchBtn" value="주소검색" onclick="searchAddr()" style="margin-top: 5px;">
    						</div>
    						
    					<label>상호명</label>
							<div class="textBox">
    							<input type="text" id="deliciousPinRestaurant" name="deliciousPinRestaurant">
    						</div>
    						
    					<label>핀이름</label>
							<div class="textBox">
    							<input type="text" name="deliciousPinName">
    						</div>
    						
    					<label>카테고리</label>
    						<div class="textBox">
    							<select id="deliciousPinCategory" name="deliciousPinCategory">
									<option value="한식">한식</option>
									<option value="중식">중식</option>
									<option value="일식">일식</option>
									<option value="양식">양식</option>
								</select><br>
    						</div>
    						
    					<label>평점</label>
    						<div class="textBox">
    							<input type="text" name="deliciousPinGrade">
    						</div>
    						
    					<label>전화번호</label>
    						<div class="textBox">
    							<input type="text" name="deliciousPinPhone">
    						</div>
    						
    					<label>상세설명</label>
    						<div class="textBox">
    						    <input type="text" id="deliciousPinDetail" name="deliciousPinDetail">
								<span id="textCnt">0</span>/20
							</div>
							
						<label>사진첨부</label>
    						<div class="textBox">
    							<input type="file" name="deliciousPinFile">
							</div>
							
<!-- 						<input type="image" src="resources/img/saveBtn.png" style="float:right; margin-bottom:3%;"> -->
						<input type="button" id="makePinBtn" value="핀 생성">

						<input type="hidden" id="pinDatas" name="">
<!--  						<input type="button" value="확인" id="check"> -->
					</form>
    			</div>
    		</div>
    		
    		<!-- 핀 리스트 확인 탭 -->
    		<div id="checkPinList" class="tab_content" style="display: none;">
				<div id="mapContent">
					<div class="textBox">
    					<input type="text" id="search" placeholder="맛집이름, 맛집지도이름, 해시태그"><br>
    				</div>
    			</div>
			</div>
		</div>
 	</div>
</div>

<div id="right">
	<c:forEach var="deliciousMapList" items="${ deliciousMapList }">
		<span class="title" style="font-size: 24px;">${ deliciousMapList.deliciousMapName }</span><br>
		<span class="title" style="font-size: 16px;">${ deliciousMapList.deliciousMapTag }</span><br>
		
		<input type="hidden" name="deliciousMapDetail" value="${ deliciousMapList.deliciousMapDetail }">
		<input type="hidden" name="deliciousMapOpen">
		<jsp:useBean id="now" class="java.util.Date" />
		<input type="hidden" name="deliciousMapCreateDate">
		<input type="hidden" name="memberNum">
	</c:forEach>
	
	<div id="map"></div>
	<div id="clickLatlng"></div>
</div>

<script>
	//핀 만들기 클릭시
	function viewMake(){
		$('#makePin').show();
		$('#checkPinList').hide();
	
		$('#makePin_li').addClass('click');
		$('#checkPinList_li').removeClass('click');
	}
	//핀 리스트 확인 클릭시
	function viewCheck(){
		$('#makePin').hide();
		$('#checkPinList').show();
		
		$('#checkPinList_li').addClass('click');
		$('#makePin_li').removeClass('click');
	}
	$(document).ready(function(){
		var mapContainer = document.getElementById('map'),   //지도 담을 영역
		
		//지도 생성 시, 필요한 기본 옵션
		mapOptions = { 
			center: new daum.maps.LatLng(37.5706073, 126.9853092), //지도 중심좌표
			level: 3   //지도 레벨(확대, 축소)
		};
		
		var map = new daum.maps.Map(mapContainer, mapOptions);   //지도 생성, 객체 리턴
		
		var imgSrc = 'resources/img/deliciousPin.png', //마커 이미지 주소
			imgSize = new daum.maps.Size(30, 30);  //마커 이미지 크기
	
		var markerImg = new daum.maps.MarkerImage(imgSrc, imgSize);
			
		//지도에 클릭한 위치에 표출할 마커 생성
		var marker = new daum.maps.Marker({
			image: markerImg     //마커 이미지 설정
		}); 
		
		marker.setMap(map);   //지도에 마커 표시
		
		var markers = [];  //지도에 표시할 마커 객체를 가지고 있을 배열
		var geocoder = new daum.maps.services.Geocoder();    //주소-좌표 변환 객체 생성
		
/* 		//만들기, 검색 탭 이동
		$('.tab_content').hide();
		$('ul.tab li:first').addClass('active').show();
		$('.tab_content:first').show();
		
		$('ul.tab li').click(function(){
			$('ul.tab li').removeClass('active');
			$(this).addClass('active');
			$('.tab_content').hide();
			
			var activeTab = $(this).find('a').attr('href');
			$(activeTab).fadeIn();
		}); */
		
		//핀 만들기 상세설명 입력크기 지정
		$('#deliciousPinDetail').keyup(function() {
			var text = $(this).val();
			var textlength = text.length;
	
			var remain = 20 - textlength;
			
			if(remain < 0) {
				var newText = text.substr(0,20);
				$(this).val(newText);
			}
			else
				$('#textCnt').text(remain);
		});
 		
		
		//핀 만들기 주소검색
 		$('#deliciousPinAddress').keyup(function() {
 			var address = $('#deliciousPinAddress').val();
 			
 			//주소로 좌표 검색
 			geocoder.addressSearch(address, function(result, status) {
			
				//정상적으로 검색이 완료됐으면
				if(status == daum.maps.services.Status.OK) {
					var coords = new daum.maps.LatLng(result[0].y, result[0].x);
 				
 					//지도의 중심을 결과값으로 받은 위치로 이동
					map.setCenter(coords);
					marker.setPosition(coords);
				}
			}); 
 		}); 
 		
 		//지도에 클릭 이벤트 등록
 		daum.maps.event.addListener(map, 'click', function(mouseEvent) {
 			var latlng = mouseEvent.latLng;    //클릭한 위도, 경도 정보 가져오기
 			
 			//지도를 클릭했을 때, 클릭 위치 좌표에 대한 주소 정보 표시
 			searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
 				//정상적으로 검색이 완료됐으면
 				if(status == daum.maps.services.Status.OK) {
 					var detailAddr = result[0].address.address_name;
 					marker.setPosition(latlng);    //마커 위치를 클릭한 위치로 이동
 					
 					$('#deliciousPinAddress').val(detailAddr);
 				}
 			});
 		});
 		
  		//핀 생성 버튼 클릭 시
 		$('#makePinBtn').click(function() {
 			//주소값 배열에 저장
 			markers.push($('#deliciousPinAddress').val());
 			
 			//$('#pinInfo').submit();
  	 		//var formData = new FormData($('#pinInfo')[0]);
  	 		//var formData = $('#pinInfo').serialize();
 	 		
/*  	 		$.ajax({
 				type: 'POST',
 				url: '<c:url value='/deliciousPinInfo' />',
 				data: formData,
  	 			processData: false,
 				contentType: false, 
 				dataType: 'text', 
 				success: function(data) {
 					
 					alert(data);
 				},
 				error: function(request, status) {
 					alert('처리 실패!' + request.status);
 				}
 			}); */
 		}); 
	}); 
		
	//좌표로 행정동 주소 정보 요청
	function searchAddrFromCoords(coords, callback) {
		geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);
	}
	
	//좌표로 법정동 상세 주소 정보 요청
	function searchDetailAddrFromCoords(coords, callback) {
		geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
	}	
	
	//주소검색 창 open
	function searchAddr() {
		//윈도우 창 크기
		var width = 500;
		var height = 600;
		
		daum.postcode.load(function() {
			new daum.Postcode({
				//주소 검색이 완료됐으면
				oncomplete: function(data) {
					$('#deliciousPinAddress').val(data.address);
					
					var address = $('#deliciousPinAddress').val();
					
			 		//주소로 좌표 검색
					geocoder.addressSearch(address, function(result, status) {
						
						//정상적으로 검색이 완료됐으면
						if(status == daum.maps.services.Status.OK) {
							var coords = new daum.maps.LatLng(result[0].y, result[0].x);
			 				
			 				//지도의 중심을 결과값으로 받은 위치로 이동
							map.setCenter(coords);
							marker.setPosition(coords);
						}
					}); 
				}
			}).open({
				left: (window.screen.width/2)-(width/2),
				top: (window.screen.height/2)-(height/2)
			});
		});
	}
	
	//지도에서 마커 삭제
	function hideMarkers() {
		setMarkers(null);
	}
	
	//배열에 추가된 마커 표시/삭제
	function setMarkers(map) {
		for(var i=0; i<markers.length; i++) 
			markers[i].setMap(map);
	}
	
	function save(e) {
		$().val();
		//$('#markers').val(pinInfo);
		//return false;
		
		//var formData = $('#pinInfo').serialize();
		
/* 		var formData = new FormData($('#pinInfo')[0]);
		
		$.ajax({
			type: 'POST',
			url: '<c:url value='/deliciousPinInfo' />',
			data: formData,
			processData: false,
			contentType: false,
			dataType: 'text',
			success: function(data) {
				makers.push(data);
				
				$.each(makers, function(index, item) {
					//주소로 좌표 검색
					geocoder.addressSearch(item, function(result, status) {
						
						//정상적으로 검색이 완료됐으면
						if(status == daum.maps.services.Status.OK) {
							var coords = new daum.maps.LatLng(result[0].y, result[0].x);
							
							//지도에 클릭한 위치에 표출할 마커 생성
							var marker = new daum.maps.Marker({
								image: markerImg     //마커 이미지 설정
							}); 
							
							//지도의 중심을 결과값으로 받은 위치로 이동
							map.setCenter(coords);
							marker.setPosition(coords);
						}
					}); 
				})
			},
			error: function(request, status) {
				alert('처리 실패!' + request.status);
			}
		}); */
	}		
</script>
</body>
</html>