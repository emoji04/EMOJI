<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
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
	
	#container {
		border: 1px solid #999;
		border-top: none;
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
 	 	padding-left: 2%;
 		width:30%;
 	}
 	
 	 #right {
 	 	padding-left: 2%;
 	 	width:63%;
 	 	float: left;
 	}
 	
 	#map {
 		width: 100%;
 		height: 500px;
 	}
 	
 	.title {
 		font-weight: bold;
 		display: block;
 	}
 	
 	.bAddr {
 		padding: 5px;
 		text-overflow: ellipsis;
 		overflow: hidden;
 		white-space: nowrap;
 	}
</style>
</head>
<body>
<div id="left">
	<div id="container">
		<ul class="tab">
<<<<<<< HEAD
			<li class="active"><a href="#makePin">맛집지도 만들기</a></li>
			<li><a href="#searchMap">맛집지도 검색</a></li>
		</ul>
		
		<div class="tab_container">
			<div id="makePin" class="tab_content" style="display: block;">
				<form id="pinInfo" action="<c:url value='/deliciousPinInfo.json' />" method="post" enctype="multipart/form-data">
					<input type="hidden" name="deliciousMapNum" value="7">
					<input type="text" id="deliciousPinAddress" name="deliciousPinAddress" placeholder="주소"><input type="button" id="addrSearchBtn" value="주소검색" onclick="searchAddr()"><br>
					<input type="text" id="deliciousPinRestaurant" name="deliciousPinRestaurant" placeholder="상호명"><br>
					<input type="text" name="deliciousPinName" placeholder="핀이름"><br>
					
					<select id="deliciousPinCategory" name="deliciousPinCategory">
						<option value="한식">한식</option>
						<option value="중식">중식</option>
						<option value="일식">일식</option>
						<option value="양식">양식</option>
					</select><br>
					
					<input type="text" name="deliciousPinGrade" placeholder="평점"><br>
					<input type="text" name="deliciousPinPhone" placeholder="전화번호"><br>
					<input type="text" name="deliciousPinDetail" placeholder="상세설명"><br>
					<input type="file" name="deliciousPinFile">
					
					<input type="image" id="pinSave" src="resources/img/saveBtn.png" style="float:right;">
				</form>
			</div>
			
			<div id="searchMap" class="tab_content" style="display: none;">
				<div class="input-group stylish-input-group">
					<input type="text" id="search" class="form-control" placeholder="맛집이름, 맛집지도이름, 해시태그">
	                    <span class="input-group-addon">
	                        <button type="submit">
	                            <span class="glyphicon glyphicon-search"></span>
	                        </button>  
	                    </span>
	            </div>
			</div>
		</div>
 	</div>
 	
	<input type="submit" value="최종 저장">
</div>

<div id="right">
	<c:forEach var="deliciousMapList" items="${ deliciousMapList }">
		<h2>${ deliciousMapList.deliciousMapName }</h2>
		<h3>${ deliciousMapList.deliciousMapTag }</h3>
		
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
		
		var markers = [];   //지도에 표시한 마커 객체를 가지고 있을 배열
		var geocoder = new daum.maps.services.Geocoder();    //주소-좌표 변환 객체 생성

		//만들기, 검색 탭 이동
		$('.tab_content').hide();
		$('ul.tab li:first').addClass('active').show();
		$('.tab_content:first').show();
		
		$('ul.tab li').click(function(){
			$('ul.tab li').removeClass('active');
			$(this).addClass('active');
			$('.tab_content').hide();
			
			var activeTab = $(this).find('a').attr('href');
			$(activeTab).fadeIn();
		});
		
		//지도 만들기 상세설명 입력크기 지정
		$('textarea').keyup(function() {
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
		
 		$('#pinSave').click(function() {
 			var formData = new FormData($('#pinInfo')[0]);
 			
			$.ajax({
				type: 'POST',
				url: '<c:url value='/deliciousPinInfo.json' />',
				data: formData,
				dataType: 'json',
				success: function(data) {
					var deliciousPinAddress = data.deliciousPinInfo.deliciousPinAddress;
					
			 		//주소로 좌표 검색
					geocoder.addressSearch(deliciousPinAddress, function(result, status) {
						
						//정상적으로 검색이 완료됐으면
						if(status == daum.maps.services.Status.OK) {
							var coords = new daum.maps.LatLng(result[0].y, result[0].x);
			 				
			 				//지도의 중심을 결과값으로 받은 위치로 이동
							map.setCenter(coords);
							marker.setPosition(coords);
						}
					}); 
				},
				error: function(request, status) {
					alert('처리 실패!' + request.status);
				}
			});
		}); 
	});
	
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
		
	//좌표로 행정동 주소 정보 요청
	function searchAddrFromCoords(coords, callback) {
		geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);
	}
	
	//좌표로 법정동 상세 주소 정보 요청
	function searchDetailAddrFromCoords(coords, callback) {
		geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
	}	
	
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
		for(var i=0; i<markers.length; i++) {
			markers[i].setMap(map);
		}
	}
=======
			<li class="active"><a href="#makeMap">맛집지도 만들기</a></li>
			<li><a href="#searchMap">맛집지도 검색</a></li>
		</ul>
		
		<div class="tab_container">
			<div id="makeMap" class="tab_content" style="display: block;">
				<form method="post">
					<table>
						<c:forEach var="deliciousMapList" items="${ deliciousMapList }">
							<tr>
								<td>지도이름</td>
								<td><input type="text" id="deliciousMapName" name="deliciousMapName" value="${ deliciousMapList.deliciousMapName }"></td>
							</tr>
							<tr>
								<td>해시태그</td>
								<td><input type="text" id="deliciousMapTag" name="deliciousMapTag" value="${ deliciousMapList.deliciousMapTag }"></td>
							</tr>
							<tr>
								<td>상세설명</td>
								<td>
									<textarea rows="5" id="deliciousMapDetail" name="deliciousMapDetail">${ deliciousMapList.deliciousMapDetail }</textarea>
									<span id="textCnt">0</span>/20
								</td>
							</tr>
						
							<input type="hidden" name="deliciousMapOpen">
					
							<jsp:useBean id="now" class="java.util.Date" />
							<input type="hidden" name="deliciousMapCreateDate">
					
							<input type="hidden" name="memberNum">
						</c:forEach>
					</table>
				</form>
				
				<div id="makePin">
					<form>
						<input type="text" id="address" placeholder="주소"><input type="button" id="addrSearchBtn" value="주소검색" onclick="searchAddr()"><br>
						<input type="text" id="restaurantName" placeholder="상호명"><br>
						<input type="text" placeholder="핀이름"><br>
		
						<select id="category">
							<option>한식</option>
							<option>중식</option>
							<option>일식</option>
							<option>양식</option>
						</select><br>
		
						<input type="text" placeholder="평점"><br>
						<input type="text" placeholder="전화번호"><br>
						<input type="text" placeholder="상세설명"><br>
						<input type="file">
						
						<input type="image" src="resources/img/saveBtn.png" style="float:right;">
					
					</form>
					
				</div>
			</div>
			
			<div id="searchMap" class="tab_content" style="display: none;">
				<input type="text" id="search" placeholder="맛집이름, 맛집지도이름, 해시태그"><br>
			</div>
			<input type="submit" value="최종 저장">
		</div>
	</div>
</div>

<div id="right">
	<div id="map"></div>
	<div id="clickLatlng"></div>
</div>

<script>
	$(document).ready(function(){
		$('textarea').keyup(function() {
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
		
		$('.tab_content').hide();
		$('ul.tab li:first').addClass('active').show();
		$('.tab_content:first').show();
		
		$('ul.tab li').click(function(){
			$('ul.tab li').removeClass('active');
			$(this).addClass('active');
			$('.tab_content').hide();
			
			var activeTab = $(this).find('a').attr('href');
			$(activeTab).fadeIn();
		});
	});
	
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
		//markerPosition = new daum.maps.LatLng(latlng);
		
	//지도에 클릭한 위치에 표출할 마커 생성
	var marker = new daum.maps.Marker({
		//position: markerPosition,
		image: markerImg     //마커 이미지 설정
	}); 
		
	marker.setMap(map);   //지도에 마커 표시
		
	var markers = [];   //지도에 표시한 마커 객체를 가지고 있을 배열
	
	var geocoder = new daum.maps.services.Geocoder();    //주소-좌표 변환 객체 생성
	
 	$('#address').keyup(function() {
		var address = $('#address').val();
		
 		//주소로 좌표 검색
		geocoder.addressSearch(address, function(result, status) {
			
			//정상적으로 검색이 완료됐으면
			if(status == daum.maps.services.Status.OK) {
				var coords = new daum.maps.LatLng(result[0].y, result[0].x);
				
/*  				//결과값으로 받은 위치 마커 표시
 				var marker = new daum.maps.Marker({
					map: map,
					position: coords
				}); */
 				
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
				//marker.setMap(map);   
				
				$('#address').val(detailAddr);
			}
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
	
	function searchAddr() {
		//윈도우 창 크기
		var width = 500;
		var height = 600;
		
		daum.postcode.load(function() {
			new daum.Postcode({
				//주소 검색이 완료 되었을 때
				oncomplete: function(data) {
					$('#address').val(data.address);
					
					//검색된 주소로 좌표 검색
					var address = $('#address').val();
					
			 		//주소로 좌표 검색
					geocoder.addressSearch(address, function(result, status) {
						
						//정상적으로 검색이 완료됐으면
						if(status == daum.maps.services.Status.OK) {
							var coords = new daum.maps.LatLng(result[0].y, result[0].x);
							
			/*  				//결과값으로 받은 위치 마커 표시
			 				var marker = new daum.maps.Marker({
								map: map,
								position: coords
							}); */
			 				
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
		for(var i=0; i<markers.length; i++) {
			markers[i].setMap(map);
		}
	}
/* 		var latlng = mouseEvent.latLng;  //클릭한 위도, 경도 정보 가져오기
				
		var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ', 경도는 ' + latlng.getLng() + '입니다.'; 
		
		var resultDiv = document.getElementById('clickLatlng');
		resultDiv.innerHTML = message; */
>>>>>>> branch 'master' of https://github.com/emoji04/EMOJI.git
</script>
</body>

</html>