<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
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
				<form>
					<table>
						<tr>
							<td>지도이름</td>
							<td><input type="text"></td>
						</tr>
						<tr>
							<td>해시태그</td>
							<td><input type="text"></td>
						</tr>
						<tr>
							<td>상세설명</td>
							<td>
								<textarea rows="20"></textarea>
								<span id="textCnt">0</span>/20
							</td>
						</tr>
					</table>
					
					<input type="hidden" name="deliciousMapOpen" value="open">
					<input type="hidden" name="memberId" value="m20180919001">
					
					<input type="image" src="resources/img/saveBtn.png">
				</form>
			</div>
			
			<div id="searchMap" class="tab_content" style="display: none;">
				<input type="text" id="address" placeholder="주소검색"><br>
					<input type="text" placeholder="상호명"><br>
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
	
/* 	//주소-좌표 변환 객체 생성
	var geocoder = new daum.maps.services.Geocoder();
	
	//주소로 좌표 검색
	geocoder.addressSearch(document.getElementById('address').value, function(result, status){
		//정상적으로 검색 완료
		if(status == daum.maps.services.Status.OK) {
			var coords = new daum.maps.LatLng(result[0].y, result[0].x);
			
			var mark = new daum.maps.Marker({
				map: map,
				position: coords
			});
		}
		map.setCenter(coords);     //지도의 중심을 결과값으로 받은 위치로 이동
	});  */
	
	//지도에 클릭 이벤트 등록
	daum.maps.event.addListener(map, 'click', function(mouseEvent) {
		var imgSrc = 'resources/img/deliciousPin.png', //마커 이미지 주소
			imgSize = new daum.maps.Size(30, 30);  //마커 이미지 크기
			
		var latlng = mouseEvent.latLng;  //클릭한 위도, 경도 정보 가져오기
			
		var markerImg = new daum.maps.MarkerImage(imgSrc, imgSize),
			markerPosition = new daum.maps.LatLng(latlng);
		
		//지도에 클릭한 위치에 표출할 마커 생성
		var marker = new daum.maps.Marker({
			position: markerPosition,
			image: markerImg     //마커 이미지 설정
		});   
		
		marker.setMap(map);   //지도에 마커 표시
		
		var latlng = mouseEvent.latLng;  //클릭한 위도, 경도 정보 가져오기
		
		marker.setPosition(latlng);    //마커 위치를 클릭한 위치로 이동
		
		var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ', 경도는 ' + latlng.getLng() + '입니다.'; 
		
		var resultDiv = document.getElementById('clickLatlng');
		resultDiv.innerHTML = message;
	});
</script>
</body>

</html>