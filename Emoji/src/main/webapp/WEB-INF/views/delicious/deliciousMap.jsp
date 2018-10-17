<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
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
	 
	.boxSize {
 		width: 100%;
 		height: calc(2.25rem + 2px);
 		padding-left: 5px;
 		border: 1px solid #ced4da;
   		border-radius: 0.25rem;
 	}
 	
 	.btnStyle {
 		margin-top: 5px; 
 		height: calc(2.25rem + 2px); 
 		border: 1px solid #ced4da; 
 		border-radius: 0.25rem;
 	}
 	
/*  	input[type=text], select, #makePinBtn {
 		width: 100%;
 		padding-left: 5px;
 	} */
 	
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
 	
 	.focus {
 		color: red;
 	}
 	
    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -140px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info { width: 286px;height: 125px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff; }
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .wrap .title {padding: 2px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .close { float: right; margin-top: 1%; margin-right: 5%; }
    .contentBox {position: relative; float: left; width: 100%; }
    .desc  { overflow:hidden; position: relative; float: left; margin-top: 5%; width: 50%; margin-left: 35%;}
    .desc .address { overflow:hidden; text-overflow: ellipsis; white-space: nowrap;}
    .desc .phone {font-size: 13px;color: #888; margin-top: -2px;}
    .desc .detail {color: #5085BB; margin-top: 3px;}
    .imageInfo {position: absolute;top: 10px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden; margin-left: 3%;}
</style>
</head>
<body>
<%@ include file="../commons/top_bar.jsp"%>
	
<div id="left">
	<div id="container">
		<ul class="tab">
			<li class="active click" id="makePin_li">핀 만들기</li>
<!-- 			<li class="active" id="checkPinList_li">핀 리스트 확인</li> -->
		</ul>
		
		<div class="tab_container">
			<!-- 핀 만들기 탭 -->
			<div id="makePin" class="tab_content" style="display: block;">
				<div id="pinContent">
					<form id="pinInfo" action="<c:url value='/deliciousPinInfo' />" method="post" enctype="multipart/form-data">
 						<input type="hidden" id="deliciousMapNum" name="deliciousMapNum" value="${ deliciousMapNum }">
						
						<label>주소</label>
							<div class="textBox">
    							<input type="text" id="deliciousAddress" name="deliciousAddress" class="boxSize">
    							<input type="button" id="addrSearchBtn" value="주소검색" class="btnStyle">
    							<div id="address_output"></div>
    						</div>
    						  						
    					<label>상호명</label>
							<div class="textBox">
    							<input type="text" id="deliciousName" name="deliciousName" class="boxSize">
<!--     							<input type="button" id="nameSearchBtn" value="상호검색" class="btnStyle"> -->
    						</div>
    						
    					<label>카테고리</label>
    						<div class="textBox">
    							<select id="deliciousCategory" name="deliciousCategory" class="boxSize">
									<option value="한식">한식</option>
									<option value="중식">중식</option>
									<option value="일식">일식</option>
									<option value="양식">양식</option>
								</select><br>
    						</div>
    						
    					<label>평점</label>
    						<div class="textBox">
    							<input type="text" name="deliciousGrade" class="boxSize">
    						</div>
    						
    					<label>전화번호</label>
    						<div class="textBox">
    							<input type="text" name="deliciousPhone" class="boxSize">
    						</div>
    						
    					<label>상세설명</label>
    						<div class="textBox">
    						    <input type="text" id="deliciousDetail" name="deliciousDetail" class="boxSize">
								<span id="textCnt">0</span>/20
							</div>
							
						<label>사진첨부</label>
    						<div class="textBox">
    							<input type="file" name="deliciousFile">
							</div>

						<input type="button" id="makePinBtn" value="핀 생성" class="boxSize">
					</form>
    			</div>
    		</div>
    		
    		<!-- 핀 리스트 확인 탭 -->
    		<div id="checkPinList" class="tab_content" style="display: none;">
				<div id="pinListContent"></div>
			</div>
		</div>
 	</div>
</div>

<div id="right">
	<c:forEach var="deliciousMapList" items="${ deliciousMapList }">
		<span class="title" style="font-size: 24px;">${ deliciousMapList.deliciousMapName }</span><br>
		<span class="title" style="font-size: 16px;">${ deliciousMapList.deliciousMapTag }</span><br>
	</c:forEach>
	
	<div id="map"></div>
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
		
		//현재 위치 표시 - HTML5의 geolocation으로 사용할 수 있는지 확인
		if(navigator.geolocation) {
			//GeoLocation을 이용해 접속 위치 얻어오기
			navigator.geolocation.getCurrentPosition(function(position) {
				var lat = position.coords.latitude,  //위도
					lon = position.coords.longitude; //경도
				
				var locPosition = new daum.maps.LatLng(lat, lon);  //마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성

				//지도의 중심을 결과값으로 받은 위치로 이동
				map.setCenter(locPosition);
			});
		}
	
		var imgSrc = 'resources/img/deliciousPin.png', //마커 이미지 주소
			imgSize = new daum.maps.Size(30, 30);  //마커 이미지 크기
	
		var markerImg = new daum.maps.MarkerImage(imgSrc, imgSize);
	
		//지도에 클릭한 위치에 표출할 마커 생성
		var marker = new daum.maps.Marker({
			image: markerImg     //마커 이미지 설정
		}); 
	
		marker.setMap(map);   //지도에 마커 표시 
	
		var geocoder = new daum.maps.services.Geocoder();    //주소-좌표 변환 객체 생성
		
		//핀 만들기 주소검색
		$('#deliciousAddress').keyup(function() {
			var address = $('#deliciousAddress').val();
		
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
					
					//마커 위치를 클릭한 위치로 이동
					marker.setPosition(latlng);    
 					
 					$('#deliciousAddress').val(detailAddr);
 				}
 			});
 		});
	
		//핀 만들기 상세설명 입력크기 지정
		$('#deliciousDetail').keyup(function() {
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
		$('#deliciousAddress').focusout(function() {
			var address = $(this).val();
		
			if(address.length > 0)
				$('#address_output').empty().removeClass('focus');
			else 
				$('#address_output').text('필수 정보입니다.').addClass('focus');
		});
 			
		//2. 지도 생성 버튼을 클릭했을 때
 		$('#makePinBtn').click(function() {
 			var address = $('#deliciousAddress').val();
 			var formData = new FormData($('#pinInfo')[0]);  //form 데이터 객체
 			
 			if(address.length == 0)
				$('#address_output').text('필수 정보입니다.').addClass('focus');
 			
 			else {
 				$.ajax({
 					type: 'POST',
 					url: '<c:url value='/deliciousPinInfo' />',
 					data: formData,
 					processData: false,
 					contentType: false,
 					dataType: 'json',
 					success: function(data) {
 						var deliciousPinList = data.deliciousPinInfo;  //select한 결과 데이터
 						var addressList = [];  //주소를 담기 위한 배열		
 						var pinNameList = [];  //핀 이름을 담기 위한 배열		
 						var phoneList = [];    //전화번호를 담기 위한 배열		
 						var detailList = [];   //상세정보를 담기 위한 배열		
 						var photoList = [];    //사진이름을 담기 위한 배열			
	 					
	 					//주소, 핀 이름, 전화번호, 상세정보, 사진이름을 배열에 담기
	 					$(deliciousPinList).each(function(index, deliciousPin) {
	 						addressList.push(deliciousPin.deliciousAddress);
	 						pinNameList.push(deliciousPin.deliciousName);
	 						phoneList.push(deliciousPin.deliciousPhone);
	 						detailList.push(deliciousPin.deliciousDetail);
	 						photoList.push(deliciousPin.deliciousImg);
	 	 				});
	 					
	 					addressList.forEach(function(address, index) {
	 						//주소로 좌표 검색
	 						geocoder.addressSearch(address, function(result, status) {
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
	 								image.src = 'resources/img/deliciousPin/' + photoList[index];
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
	 					
	 					//form 데이터 입력창 리셋
	 					$('#pinInfo')[0].reset();
	 				},
	 				error: function(request, status) {
	 					alert('처리 실패!' + request.status);
	 				}
	 			});
 			}
 		});
		
 		//핀 만들기 클릭시
 		$('#makePin_li').click(function() {
 			$('#makePin').show();
 			$('#checkPinList').hide();
 		 
 			$('#makePin_li').addClass('click');
 			$('#checkPinList_li').removeClass('click');
 		});

 		//핀 리스트 확인 클릭시
  		$('#checkPinList_li').click(function() {
 			$('#makePin').hide();
 			$('#checkPinList').show();
 			
 			$('#checkPinList_li').addClass('click');
 			$('#makePin_li').removeClass('click');
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
   		$('#addrSearchBtn').click(function() {
   			//윈도우 창 크기
   			var width = 500;
   			var height = 600;
   			
   			daum.postcode.load(function() {
   				new daum.Postcode({
   					//주소 검색이 완료됐으면
   					oncomplete: function(data) {
   						$('#deliciousAddress').val(data.address);
   						
   						var address = $('#deliciousAddress').val();
   						
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
   		}); 
  		
  		//상호검색 창 open
  		$('#nameSearchBtn').click(function() {
  			var deliciousName = $('#deliciousName').val();
  		});
	});
</script>
</body>
</html>