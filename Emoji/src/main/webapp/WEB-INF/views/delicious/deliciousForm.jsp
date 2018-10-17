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
	
	.active {
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
 	
 	.boxSize {
 		width: 100%;
 		height: calc(2.25rem + 2px);
 		padding-left: 5px;
 		border: 1px solid #ced4da;
   		border-radius: 0.25rem;
 	}
 	
 	#img_container{
    	margin-top: 2%;
	}
	
	.form-search {
   		display: block;
  		width: 100%;
 		padding: 0.375rem 0.75rem;
  		font-size: 1rem;
  		line-height: 1.5;
  		color: #495057;
  		background-color: #fff;
  		background-clip: padding-box;
  		border: 1px solid #ced4da;
   		border-radius: 0.25rem 0 0 0.25rem;
  		transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
	}
	
	.mapInfoClick {
		cursor: pointer;
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
			<li class="active click" id="makeMap_li">맛집지도 만들기</li>
			<li class="active" id="searchMap_li">맛집지도 검색</li>
		</ul>
		
		<div class="tab_container">
			<div id="makeMap" class="tab_content" style="display: block;">
				<div id="mapContent">
					<form action="<c:url value='/deliciousMapInfo' />" method="post" id="deliciousMap">
						<label>지도이름</label>
						<div class="textBox">
    						<input type="text" id="deliciousMapName" name="deliciousMapName" class="boxSize"><br>
    						<div id="name_output"></div>
    					</div>
    						
    					<label>해시태그</label>
    					<div class="textBox">
    						<input type="text" id="deliciousMapTag" name="deliciousMapTag" placeholder="5개까지 입력 가능합니다." class="boxSize"><br>
    						<div id="tag_output"></div>
    					</div>
    					
    					<label>상세설명</label>
    					<div class="textBox">
    						<input type="text" id="deliciousMapDetail" name="deliciousMapDetail" class="boxSize">
							<span id="textCnt">0</span>/20
							<div id="detail_output"></div>
						</div>
						
						<input type="hidden" name="deliciousMapOpen" value="open">
					
						<jsp:useBean id="now" class="java.util.Date" />
						<input type="hidden" name="deliciousMapCreateDate" value="<fmt:formatDate value='${now}' pattern='yyyy-MM-dd HH:mm:ss' />">
					
 						<input type="hidden" name="memberNum" value="${ loginInfo }">
						<input type="button" id="makeMapBtn" value="지도 생성" class="boxSize">
					</form>
    			</div>
    		</div>
		</div>
			
		<div id="searchMap" class="tab_content" style="display: none; overflow: hidden;">
			<div> 
				<div class="input-group stylish-input-group">
					<input type="text" id="searchKeyword" class="form-search" placeholder="맛집지도이름">
						<span class="input-group-addon">
	                        <button id="searchBtn">
	                            <span class="glyphicon glyphicon-search"></span>
	                        </button>  
	                    </span>
	            </div>
	        </div>
	        
	        <div id="searchResult"></div>
		</div>
	</div>
</div>
<div id="right">
	<div id="map"></div>
	<div id="clickLatlng"></div>
</div>

<script>
	$(document).ready(function(){
	 	//맛집지도 만들기 클릭시
	 	$('#makeMap_li').click(function() {
	 		$('#makeMap').show();
	 		$('#searchMap').hide();
	 		 
	 		$('#makeMap_li').addClass('click');
	 		$('#searchMap_li').removeClass('click');
	 	});

	 	//맛집지도 검색 클릭시
	  	$('#searchMap_li').click(function() {
	 		$('#makeMap').hide();
	 		$('#searchMap').show();
	 			
	 		$('#searchMap_li').addClass('click');
	 		$('#makeMap_li').removeClass('click');
	 	}); 
	 	
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
		
		//맛집지도 검색
		$('#searchBtn').click(function() {
			var keyword = $('#searchKeyword').val();
			
			$.ajax({
				type: 'GET',
				url: '<c:url value='/deliciousMapSearch' />',
				data: 'keyword=' + keyword,
				dataType: 'json',
				success: function(data) {
					var searchInfo = data.deliciousSearchInfo;
					
					$('#searchResult').empty();
					
 					var searchResult = document.getElementById('searchResult');
					searchResult.innerHTML = '';

					var content = '';
					
 					$.each(searchInfo, function(key, value) {
						content +='<div style="width: 100%; height: 75px; margin-top: 7%;">';
						content += 	'<div style="width: 30%; float:left; padding-left: 7%; display: inline-table;">'
						content +=		'<img src="resources/img/deliciousPin/' + value.deliciousImg + '" width=70 height=70>'
						content += 	'</div>'
						content +=	'<div class="mapInfoClick" style="width: 70%; padding-left:2%; float:left; display: inline-table;" value="' + value.deliciousMapNum + '">'
						content += 		'<span class="title" style="font-size: 18px; font-weight: bold;">'
						content += 		value.deliciousMapName
						content +=		'</span><br>'
						content += 		'<span style="font-size: 12px;">'
						content += 		value.deliciousMapTag
						content +=		'</span><br>'
						content += 		'<span>'
						content += 		value.deliciousMapDetail
						content +=		'</span><br>'
						content += 	'</div>'
						content +='</div>';
					}); 
 					
 						searchResult.innerHTML += content;
 						
 						//검색된 맛집정보 클릭 시
 						$('.mapInfoClick').click(function() {
 							var deliciousMapNum = $(this).attr('value');
 							
 							$.ajax({
 								type: 'GET',
 								url: '<c:url value='/getDeliciousPinInfo' />',
 								data: 'deliciousMapNum=' + deliciousMapNum,
 								dataType: 'json',
 								success: function(data) {
 									$('#map').empty();
 									
 									var mapContainer = document.getElementById('map'),   //지도 담을 영역
 									//지도 생성 시, 필요한 기본 옵션
 									mapOptions = { 
 										center: new daum.maps.LatLng(37.5706073, 126.9853092), //지도 중심좌표
 										level: 3   //지도 레벨(확대, 축소)
 									};
 								
 									var map = new daum.maps.Map(mapContainer, mapOptions);   //지도 생성, 객체 리턴
 								
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
								},
								error: function(request, status) {
									alert('처리 실패!' + request.status);
								}
							});
						});
					},
					error: function(request, status) {
						alert('처리 실패!' + request.status);
					}
				});
			});
		});
</script>
</body>
</html>