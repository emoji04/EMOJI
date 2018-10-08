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
		/* border-top: none; */
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
 	
 	#mapContent {
	 	margin-top: 30px;
 	}
 	
 	.textBox {
	 	padding-left: 5px; 
	 	margin-bottom: 20px;
	 }
 	
 	input[type=text], input[type=button] {
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
 	}
 	
 	.focus {
 		color: red;
 	}
</style>
</head>
<body>
<%@ include file="../commons/top_bar.jsp"%>

<div id="left">
	<div id="container">
		<ul class="tab">
			<li class="active click" id="makeMap_li" onclick="viewMake()">맛집지도 만들기</li>
			<li class="active" id="searchMap_li" onclick="viewSearch()">맛집지도 검색</li>
		</ul>
		
		<div class="tab_container">
			<div id="makeMap" class="tab_content" style="display: block;">
				<div id="mapContent">
					<form action="<c:url value='/deliciousMapInfo' />" method="post" id="deliciousMap">
						<label>지도이름</label>
						<div class="textBox">
    						<input type="text" id="deliciousMapName" name="deliciousMapName"><br>
    						<div id="name_output"></div>
    					</div>
    						
    					<label>해시태그</label>
    					<div class="textBox">
    						<input type="text" id="deliciousMapTag" name="deliciousMapTag" placeholder="5개까지 입력 가능합니다."><br>
    						<div id="tag_output"></div>
    					</div>
    					
    					<label>상세설명</label>
    					<div class="textBox">
    						<input type="text" id="deliciousMapDetail" name="deliciousMapDetail">
							<span id="textCnt">0</span>/20
							<div id="detail_output"></div>
						</div>
						
						<input type="hidden" name="deliciousMapOpen" value="open">
					
						<jsp:useBean id="now" class="java.util.Date" />
						<input type="hidden" name="deliciousMapCreateDate" value="<fmt:formatDate value='${now}' pattern='yyyy-MM-dd' />">
					
						<input type="hidden" name="memberNum" value="4">
						
						<input type="button" id="makeMapBtn" value="지도 생성">
					
						<!-- <input type="image" src="resources/img/saveBtn.png" id="save" onclick="submit(); return false;" style="float:right; margin-bottom:3%;"> -->
					</form>
    			</div>
    		</div>
		</div>
			
		<div id="searchMap" class="tab_content" style="display: none;">
			<div id="mapContent">
				<div class="textBox">
    				<input type="text" id="search" placeholder="맛집이름, 맛집지도이름, 해시태그"><br>
    			</div>
    		</div>
		</div>
	</div>
</div>

<div id="right">
	<div id="map"></div>
	<div id="clickLatlng"></div>
</div>

<script>
	//맛집지도 만들기 클릭시
	function viewMake(){
		$('#makeMap').show();
		$('#searchMap').hide();
		
		$('#makeMap_li').addClass('click');
		$('#searchMap_li').removeClass('click');
	}
	
	//맛집지도 검색 클릭시
	function viewSearch(){
		$('#makeMap').hide();
		$('#searchMap').show();
		
		$('#makeMap_li').removeClass('click');
		$('#searchMap_li').addClass('click');
	}
	
	$(document).ready(function(){
/*  		//만들기, 검색 탭 이동
		$('.tab_content').hide();
		$('ul.tab li:first').addClass('active').show();
		$('.tab_content:first').show();
		
		$('ul.tab li').click(function(){
			$('ul.tab li').removeClass('active');
			$(this).addClass('active');
			alert($(this));
			$('.tab_content').hide();
 			$(this).show();
  			$('.tab_content').hide(); 
			
 			var activeTab = $(this).find('a').attr('href');
			$(activeTab).fadeIn();  
		});  */
		
		
		//지도 만들기 상세설명 입력크기 지정
		$('#deliciousMapDetail').keyup(function() {
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
		
		/* textbox 유효성 검사 */
		
		//1. textbox에서 마우스를 뗐을 때
		$('#deliciousMapName').focusout(function() {
			var name = $(this).val();
			
			if(name.length > 0)
				$('#name_output').empty().removeClass('focus');
			else 
				$('#name_output').text('필수 정보입니다.').addClass('focus');
		});
		
		$('#deliciousMapTag').focusout(function() {
			var tag = $(this).val();
			var count = (tag.match(/#/g) || []).length;  //#의 갯수 추출
			
			if(tag.length > 0) {
				$('#tag_output').empty().removeClass('focus');
				
				if(count > 5) 
					$('#tag_output').text('5개까지만 입력 가능합니다.').addClass('focus');
			}			
			else
				$('#tag_output').text('필수 정보입니다.').addClass('focus');
		});
		
		$('#deliciousMapDetail').focusout(function() {
			var detail = $(this).val();
			
			if(detail.length > 0)
				$('#detail_output').empty().removeClass('focus');
			else 
				$('#detail_output').text('필수 정보입니다.').addClass('focus');
		});
		
		//2. 지도 생성 버튼을 클릭했을 때
		$('#makeMapBtn').click(function() {
			var name = $('#deliciousMapName').val();
			var tag = $('#deliciousMapTag').val();
			var detail = $('#deliciousMapDetail').val();
			
			var count = (tag.match(/#/g) || []).length;
			
			if(name.length == 0)
				$('#name_output').text('필수 정보입니다.').addClass('focus');
							
			if(tag.length == 0) 
				$('#tag_output').text('필수 정보입니다.').addClass('focus');
				
			if(detail.length == 0) 
				$('#detail_output').text('필수 정보입니다.').addClass('focus');
			
			else if(count > 5) 
				$('#tag_output').text('5개까지만 입력 가능합니다.').addClass('focus');
			
			else 
				$('#deliciousMap').submit();
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
</html>