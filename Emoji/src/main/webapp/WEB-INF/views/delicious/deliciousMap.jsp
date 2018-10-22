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
		/* border-bottom: 1px solid #999; */
		/* border-left: 1px solid #999; */
		width: 100%;	}
	
	ul.tab li {
		float: left;
		margin: 0;
		padding: 0;
		width:170px;
		height: 33px;
		line-height: 31px;
		border: 1px solid #999;
		text-align:center;
		border-radius: 10px 10px 0 0;
		/* margin-bottom: -1px; */
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
		height:33px;
		/* border-bottom: 1px solid #fff; */
	}
	
	.active{
		cursor: pointer;
	}
	
	.click {
		font-weight: bold;
	}
	
	#container {
		/* border: 1px solid #999; */
		/* border-top: none; */
		overflow: hidden;
		clear: both;
		float: left;
		width: 100%;
	}
	
	.tab_content {
		margin-top:32px;
		border: 1px solid #999;
		border-radius: 0 0 0 10px;
		padding-top:0px;
		padding: 20px;
	}
	
 	#left {
 		margin-top: 150px;
 	 	padding-left: 50px;
 		width:30%;
 	}
 	
 	#pinContent {
	 	/* margin-top: 30px; */
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
 	
 	.keyword {
 	 	width: 70%;
 		height: calc(2.25rem + 2px);
 		padding-left: 5px;
 		border: 1px solid #ced4da;
   		border-radius: 0.25rem;
   		font-size: 16px;
 	}
 	
 	.searchBtn {
 		width: 20%;
 		height: calc(2.25rem + 2px);
 		margin-top: 10px;
 		margin-bottom: 10px;
 		padding-left: 5px;
 		border: 1px solid #ced4da;
   		border-radius: 0.25rem;
 		font-size: 16px;
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
 	 	width:68%;
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

    .map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
	.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
	.map_wrap {position:relative;width:100%;height:500px;}
	#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.9);z-index: 1;font-size:12px;border-radius: 10px;}
	.bg_white {background:#fff;}
	#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
	#menu_wrap .option{text-align: center;}
	#menu_wrap .option p {margin:10px 0;}  
	#menu_wrap .option button {margin-left:5px;}
	#placesList li {list-style: none;}
	#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
	#placesList .item span {display: block;margin-top:4px;}
	#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
	#placesList .item .info {padding:10px 0 10px 5px;}
	#placesList .info .gray {color:#8a8a8a;}
	#placesList .info .jibun {padding-left:5px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
	#placesList .info .tel {color:#009900;}
	#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
	#placesList .item .marker_1 {background-position: 0 -10px;}
	#placesList .item .marker_2 {background-position: 0 -56px;}
	#placesList .item .marker_3 {background-position: 0 -102px}
	#placesList .item .marker_4 {background-position: 0 -148px;}
	#placesList .item .marker_5 {background-position: 0 -194px;}
	#placesList .item .marker_6 {background-position: 0 -240px;}
	#placesList .item .marker_7 {background-position: 0 -286px;}
	#placesList .item .marker_8 {background-position: 0 -332px;}
	#placesList .item .marker_9 {background-position: 0 -378px;}
	#placesList .item .marker_10 {background-position: 0 -423px;}
	#placesList .item .marker_11 {background-position: 0 -470px;}
	#placesList .item .marker_12 {background-position: 0 -516px;}
	#placesList .item .marker_13 {background-position: 0 -562px;}
	#placesList .item .marker_14 {background-position: 0 -608px;}
	#placesList .item .marker_15 {background-position: 0 -654px;}
	#pagination {margin:10px auto;text-align: center;}
	#pagination a {display:inline-block;margin-right:10px;}
	#pagination .on {font-weight: bold; cursor: default;color:#777;}
	#searchList {cursor: pointer;}
    
    
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
<!--      							<input type="button" id="nameSearchBtn" value="상호검색" class="btnStyle"> -->
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
    							<input type="text" id="deliciousGrade" name="deliciousGrade" class="boxSize" placeholder="0.0/5.0">
    							<div id="grade_output"></div>
    						</div>
    						
    					<label>전화번호</label>
    						<div class="textBox">
    							<input type="text" id="deliciousPhone" name="deliciousPhone" class="boxSize" placeholder="(-)포함 입력입니다.">
    							<div id="phone_output"></div>
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

<div id="right" style="position:relative;">
	<c:forEach var="deliciousMapList" items="${ deliciousMapList }">
		<span class="title" style="font-size: 24px;">${ deliciousMapList.deliciousMapName }</span><br>
		<span class="title" style="font-size: 16px;">${ deliciousMapList.deliciousMapTag }</span><br>
	</c:forEach>
	
	<div id="map" style="width:100%; height:100%; position:relative;overflow:hidden;"></div>
		<div id="menu_wrap" class="bg_white" style="margin-top: 100px; width:30%; height:85%; position:absolute; left: 30px;">
	        <div class="option">
	            <div>
	                <form id="searchPlaces">
	                    <input type="text" id="keyword" class="keyword" placeholder="키워드"> 
	                    <input type="button" id="searchBtn" class="searchBtn" value="검색">
	                </form>
	            </div>
	        </div>
	        <hr>
	        <ul id="placesList" style="padding-left: 5px"></ul>
	        <div id="pagination"></div>
    	</div>
</div>

<script>
	$(document).ready(function(){
		var mapContainer = document.getElementById('map');   //지도 담을 영역
			mapContainer.style.width = '100%';
			mapContainer.style.height = '650px',
		
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

		var geocoder = new daum.maps.services.Geocoder();    //주소-좌표 변환 객체 생성
	
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
	
		//마커를 담을 배열입니다
		var markers = [];

		//장소 검색 객체 생성
		var ps = new daum.maps.services.Places();  
		
		//키워드 검색 요청
		$('#searchBtn').click(function() {
			var keyword = document.getElementById('keyword').value;
			
			if (!keyword.replace(/^\s+|\s+$/g, ''))
		        //alert('키워드를 입력해주세요!');
		        return false;
		    else
			 	//장소검색 객체를 통해 키워드로 장소 검색 요청 
		    	ps.keywordSearch(keyword, placesSearchCB);
		});
	
		//장소검색이 완료됐을 때 호출되는 콜백함수
		function placesSearchCB(data, status, pagination) {
		    if (status === daum.maps.services.Status.OK) {
		        // 정상적으로 검색이 완료됐으면 검색 목록과 마커를 표출
		        displayPlaces(data);

		        // 페이지 번호 표출
		        displayPagination(pagination);
		    } 
		    else if (status === daum.maps.services.Status.ZERO_RESULT) {
		        alert('검색 결과가 존재하지 않습니다.');
		        return;

		    } 
		    else if (status === daum.maps.services.Status.ERROR) {
		        alert('검색 결과 중 오류가 발생했습니다.');
		        return;
		    }
		}
		
		//검색 결과 목록  표출
		function displayPlaces(places) {
			var listEl = document.getElementById('placesList'), 
		    menuEl = document.getElementById('menu_wrap'),
		    fragment = document.createDocumentFragment(), 
		    bounds = new daum.maps.LatLngBounds(), 
		    listStr = '';
		    
		    //검색 결과 목록에 추가된 항목들 제거
		    removeAllChildNods(listEl);
		    
		    for(var i=0; i<places.length; i++) {
		        var placePosition = new daum.maps.LatLng(places[i].y, places[i].x),
		      		//검색 결과 항목 Element를 생성
		            itemEl = getListItem(i, places[i]); 
		        
		        //검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
		        //LatLngBounds 객체에 좌표 추가
		        bounds.extend(placePosition);
		        
		        //검색결과 항목을 클릭했을때, form 데이터 입력
		        (function(name, addr1, addr2, tel) {
		            itemEl.onclick =  function () {
		            	$('#deliciousName').val(name);
		            	
		            	if(addr1)
		            		$('#deliciousAddress').val(addr1);
		            	else
		            		$('#deliciousAddress').val(addr2);
		            	
		            	$('#deliciousPhone').val(tel);
		            	
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
		            };
		        })(places[i].place_name, places[i].road_address_name, places[i].address_name, places[i].phone);

		        fragment.appendChild(itemEl);
			}
		    
		    //검색결과 항목들을 검색결과 목록 Elemnet에 추가
		    listEl.appendChild(fragment);
		    menuEl.scrollTop = 0;

		    //검색된 장소 위치를 기준으로 지도 범위를 재설정
		    map.setBounds(bounds);
		}
		
		//검색결과 항목을 Element로 반환하는 함수
		function getListItem(index, places) {
			var el = document.createElement('li'),
			itemStr = '<div id="searchList" class="info" value="' + index + '">' 
					+ '<h5>' + places.place_name + '</h5>';

		    if (places.road_address_name) 
		    	itemStr += '<span>' + places.road_address_name + '</span>';
		    else 
		    	itemStr += '<span>' +  places.address_name + '</span>'; 
		    
		    itemStr += '<span class="tel">' + places.phone + '</span></div>';           
		    
		    el.innerHTML = itemStr;
		    el.className = 'item';

		    return el;
		}
		
	    $('#searchList').click(function() {
	    	var i = $(this).attr('value');
	    	
	    	document.getElementById('deliciousName').value = name[i];
	    	document.getElementById('deliciousAddress').value = addr[i];
	    	document.getElementById('deliciousName').value = tel[i];
	    });
		
		//검색결과 목록 하단에 페이지번호 표시
		function displayPagination(pagination) {
		    var paginationEl = document.getElementById('pagination'),
		        fragment = document.createDocumentFragment(),
		        i; 

		    //기존에 추가된 페이지번호 삭제
		    while (paginationEl.hasChildNodes()) {
		        paginationEl.removeChild (paginationEl.lastChild);
		    }

		    for (i=1; i<=pagination.last; i++) {
		        var el = document.createElement('a');
		        el.href = "#";
		        el.innerHTML = i;

		        if (i===pagination.current) {
		            el.className = 'on';
		        } else {
		            el.onclick = (function(i) {
		                return function() {
		                    pagination.gotoPage(i);
		                }
		            })(i);
		        }

		        fragment.appendChild(el);
		    }
		    paginationEl.appendChild(fragment);
		}

		 //검색결과 목록의 자식 Element를 제거
		function removeAllChildNods(el) {   
		    while (el.hasChildNodes())
		        el.removeChild (el.lastChild);
		} 
		
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
		
		$('#deliciousGrade').focusout(function() {
			var deliciousGrade = $(this).val();
 			var reg = /^[0-9]+\.?[0-9]*$/;  //소수점 1자리까지 허용
 			
 			//평점 값이 입력되었을 때
			if(deliciousGrade.length > 0) {
				if(reg.test(deliciousGrade)) {
					if(deliciousGrade > 5.0)
						$('#grade_output').text('최대 5점입니다.').addClass('focus');
					else
						$('#grade_output').empty().removeClass('focus');
				}
				else
					$('#grade_output').text('올바른 형식으로 입력해주세요.').addClass('focus');
 			}
			else
				$('#grade_output').empty().removeClass('focus');
		});
		
		$('#deliciousPhone').focusout(function() {
			var deliciousPhone = $(this).val();
			var reg = /^\d{2,3}-\d{3,4}-\d{4}$/;   //전화번호
			
			//전화번호가 입력되었을 때
 			if(deliciousPhone.length > 0) {
 				if(reg.test(deliciousPhone)) 
 					$('#phone_output').empty().removeClass('focus');
 				else
 					$('#phone_output').text('(-)포함 입력입니다.').addClass('focus');
 			}
			else
				$('#phone_output').empty().removeClass('focus');
		});
 			
		//2. 지도 생성 버튼을 클릭했을 때
 		$('#makePinBtn').click(function() {
 			var address = $('#deliciousAddress').val();
 			var deliciousGrade = $('#deliciousGrade').val();
 			var deliciousPhone = $('#deliciousPhone').val();
 			
	 		var regGrade = /^[0-9]+\.?[0-9]*$/;  //소수점 1자리까지 허용
			var regPhone = /^\d{2,3}-\d{3,4}-\d{4}$/;   //전화번호
 			
 			var formData = new FormData($('#pinInfo')[0]);  //form 데이터 객체

 			if(address.length == 0) 
 				$('#address_output').text('필수 정보입니다.').addClass('focus');
 				
 			else {
 		 		//평점 값이 입력되었을 때
 				if(deliciousGrade.length > 0) {
 					if(regGrade.test(deliciousGrade)) {
 						if(deliciousGrade > 5.0)
 							$('#grade_output').text('최대 5점입니다.').addClass('focus');
 						else
 							$('#grade_output').empty().removeClass('focus');
 					}
 					else
 						$('#grade_output').text('올바른 형식으로 입력해주세요.').addClass('focus');
 		 		}
 			 			
 				//전화번호가 입력되었을 때
 				if(deliciousPhone.length > 0) {
 					if(regPhone.test(deliciousPhone)) 
 		 				$('#phone_output').empty().removeClass('focus');
 		 			else
 		 				$('#phone_output').text('(-)포함 입력입니다.').addClass('focus');
 		 		}
 				
 				var gradeResult = $('#grade_output').hasClass('focus');
 				var phoneResult = $('#phone_output').hasClass('focus');
 				
 				if(!gradeResult && !phoneResult) {
 					$.ajax({
 		 				type: 'POST',
 		 				url: '<c:url value='/deliciousPinInfo' />',
 		 				data: formData,
 		 				processData: false,
 		 				contentType: false,
 		 				dataType: 'json',
 		 				success: function(data) {
 		 					alert('핀 생성이 완료되었습니다.');
 		 						
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
 				else
 					alert('값을 올바르게 입력해주세요.');
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
	});
</script>
</body>
</html>