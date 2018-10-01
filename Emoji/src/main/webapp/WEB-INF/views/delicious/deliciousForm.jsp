<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<<<<<<< HEAD
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#map {
		border: 1px solid black;
	}
</style>
</head>
<body>
	<div id="map" style="width:100%;height:350px;">
		<form>
			<input type="text">
		</form>
	
	</div>
	<div id="clickLatlng"></div>
	
<script type="text/javascript" src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=377fa9901a70a356db9e8b6e1ab1a3a9&libraries=services"></script>
<script>
	var mapContainer = document.getElementById('map'),   //지도 담을 영역
			//지도 생성 시, 필요한 기본 옵션
			mapOptions = { 
				center: new daum.maps.LatLng(37.5706073, 126.9853092), //지도 중심좌표
				level: 3   //지도 레벨(확대, 축소)
			};

	var map = new daum.maps.Map(mapContainer, mapOptions);   //지도 생성, 객체 리턴
	
	//지도에 클릭 이벤트 등록
	daum.maps.event.addListener(map, 'click', function(mouseEvent) {
		var marker = new daum.maps.Marker({});   //지도에 클릭한 위치에 표출할 마커
		
		marker.setMap(map);   //지도에 마커 표시
		
		var latlng = mouseEvent.latLng;  //클릭한 위도, 경도 정보 가져오기
		
		marker.setPosition(latlng);    //마커 위치를 클릭한 위치로 이동
		
		var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ', 경도는 ' + latlng.getLng() + '입니다.'; 
		
		var resultDiv = document.getElementById('clickLatlng');
		resultDiv.innerHTML = message;
	});
	
	var markers = [];   //마커를 담을 배열
	
	var ps = new daum.maps.services.Places();   //장소 검색 객체 생성
	
	var infoWindow = new daum.maps.InfoWindow({zIndex:1});    //검색 결과 목록이나 마케를 장소명을 표출할 인포 윈도우 생성
	
	searchPlaces();    //키워드로 장소 검색
	
	//키워드 검색 요청하는 함수
	function searchPlaces() {
		var keyword = document.getElementById('keyword').value;
		
		if(!keyword.replace(/^\s+|\s+$/g, '')) {
			alert('키워드를 입력해주세요!');
			return false;
		}
		
		ps.keywordSearch(keyword, placesSearchCB);    //장소 검색 객체를 통해 키워드로 장소 검색 요청
	}
	
	//장소 검색 완료 시, 호출되는 콜백함수
	function placesSearchCB(data, status) {
		//검색 정상적 완료
		if(status == daum.maps.services.Status.OK) {
			displayPlaces(data);   //검색 목록과 마커 표줄
		}
		
		else if(status == daum.maps.services.Status.ZERO_RESULT) {
			alert('검색 결과가 존재하지 않습니다.');
			return;
		}
		
		else if(status == daum.maps.services.Status.ERROR) {
			alert('검색 결과 중 오류가 발생했습니다.');
			return;
		}
	}
	
	//검색 결과 목록, 마커 표출
	function displayPlaces(places) {
		var listEl = document.getElementById('placesList'),
			menuEl = document.getElementById('menu_wrap'),
			fragment = document.createDocumentFragment(),
			bounds = new daum.maps.LatLngBounds(),
			listStr = '';
		
		//검색 결과 목록에 추가된 항목 제거
	}
	
</script>
</body>

=======
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript" src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=377fa9901a70a356db9e8b6e1ab1a3a9&libraries=services"></script>
<style>
	html, body{
		width: 100%; height: 100%;
	}
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
 	 	width:100%;
 	 	height:100%;
 	 	float:inherit;
 	}
 	
 	#map {
 		position: inherit;
 		top: 0;
 		left: 0;
 		width: 100%;
 		height: 100%;
 	}
</style>
</head>
<body>
<div id="left">
	<div id="container">
		<ul class="tab">
			<li class="active"><a href="#makeMap">맛집지도 만들기</a></li>
			<li><a href="#searchMap">맛집지도 검색</a></li>
		</ul>
		
		<div class="tab_container">
			<div id="makeMap" class="tab_content" style="display: block;">
				<form action="<c:url value='/deliciousMapInsert' />" method="post">
					<table>
						<tr>
							<td>지도이름</td>
							<td><input type="text" id="deliciousMapName" name="deliciousMapName"></td>
						</tr>
						<tr>
							<td>해시태그</td>
							<td><input type="text" id="deliciousMapTag" name="deliciousMapTag" placeholder="5개까지 입력 가능합니다."></td>
						</tr>
						<tr>
							<td>상세설명</td>
							<td>
								<textarea rows="5" id="deliciousMapDetail" name="deliciousMapDetail"></textarea>
								<span id="textCnt">0</span>/20
							</td>
						</tr>
					</table>
					
					<input type="hidden" name="deliciousMapOpen" value="open">
					
					<jsp:useBean id="now" class="java.util.Date" />
					<input type="hidden" name="deliciousMapCreateDate" value="<fmt:formatDate value='${now}' pattern='yyyy-MM-dd' />">
					
					<input type="hidden" name="memberNum" value="2">
					
					<input type="image" src="resources/img/saveBtn.png" style="float:right;">
				</form>
			</div>
			
			<div id="searchMap" class="tab_content" style="display: none;">
				<input type="text" id="search" placeholder="맛집이름, 맛집지도이름, 해시태그"><br>
			</div>
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
	
	var geocoder = new daum.maps.services.Geocoder();    //주소-좌표 변환 객체 생성
	
	//주소로 좌표 검색
	geocoder.addressSearch('서울 종로구 종로 69', function(result, status) {
		var imgSrc = 'resources/img/deliciousPin.png', //마커 이미지 주소
			imgSize = new daum.maps.Size(30, 30);  //마커 이미지 크기
		
		var markerImg = new daum.maps.MarkerImage(imgSrc, imgSize);
		
		//정상적으로 검색이 완료됐으면
		if(status == daum.maps.services.Status.OK) {
			var coords = new daum.maps.LatLng(result[0].y, result[0].x);
			
			//결과값으로 받은 위치 마커 표시
			var marker = new daum.maps.Marker({
				map: map,
				position: coords,
				image: markerImg     //마커 이미지 설정
			});
				
			//지도의 중심을 결과값으로 받은 위치로 이동
			map.setCenter(coords);
		}
	});
</script>
</body>
>>>>>>> branch 'route' of https://github.com/emoji04/EMOJI.git
</html>