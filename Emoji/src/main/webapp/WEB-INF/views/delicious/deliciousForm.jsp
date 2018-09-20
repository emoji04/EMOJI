<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
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

</html>