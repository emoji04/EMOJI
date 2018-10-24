<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
body {
	margin: 3px;
	padding: 0px;
}
#page {
	width: 1500px;
	margin: 0 auto;
	margin-top: 10px;
	height: 100%;
	background: white;
}
/* #header {
	margin: 0px auto;
	text-align: center;
}
#logout {
	float: right;
	display: inline;
}
#headerImg {
	display: inline
} */
#leftside {
	width: 400px;
	height: 100%;
	border: 1px solid #eee;
	display: inline;
	float: left;
}
#rightside {
	width: 1090px;
	height: 100%;
	display: inline;
	float: right;
	border-left: 1px solid lightgrey;
	border-bottom: 1px solid #eee;
}
#righttop {
	/*         	border-bottom:1px solid #eee; */
	width: 1090px;
	border-bottom: 1px solid #eee;
	height: 50%;
}
#rightbottom {
	width: 1090px;
	height: 100%;
	overflow: hidden;
}
#smallLeft {
	width: 400px;
	height: 100%;
	border-right: 1px solid #eee;
	float: left;
	overflow: hidden;
}
#smallright {
	width: 687px;
	height: 100%;
	float: right;
}
#container {
	display: block;
	width: 400px;
	height: 150px;
	margin: 0 auto;
}
#searched {
	height: 710px;
	border-right: 1px solid #eee;
	overflow: auto;
}
#smallLeftLeft {
	width: 50px;
	height: 420px;
	border-right: 1px solid #eee;
	float: left;
}
#smallLeftRight {
	width: 348px;
	height: 420px;
	float: right;
	overflow: auto;
}
div {
	border-radius: 10px;
}
table {
	width: 100%;
	height: 420px;
	border: 1px solid #eee;
	border-collapse: collapse;
	border-radius: 25px;
}
td {
	border: 1px solid #eee;
}
.deliciousList {
	height: 50px;
	line-height: 50px;
	text-align: center;
	padding: 20px;
	border: 2px solid white;
	background: aliceblue;
}
.delicious {
	height: 50px;
	background: #f7f8f9;
	padding: 20px;
	border: 2px solid white;
	overflow: hidden;
}
.imgcss {
	float: left;
	width: 90px;
	height: 60px;
}
.imgcssright {
	float: right;
	width: 180px;
	height: 60px;
}
ul.tabs {
	margin: 0;
	padding: 0;
	float: left;
	list-style: none;
	height: 32px;
	border-bottom: 1px solid #eee;
	border-left: 1px solid #eee;
	font-family: "dotum";
	font-size: 12px;
	width: 400px;
	display: block;
}
ul.tabs li {
	float: left;
	text-align: center;
	cursor: pointer;
	width: 82px;
	height: 31px;
	line-height: 31px;
	border: 1px solid #eee;
	border-left: none;
	font-weight: bold;
	background: #fafafa;
	overflow: hidden;
	position: relative;
}
ul.tabs li.active {
	background: #FFFFFF;
	border-bottom: 1px solid #FFFFFF;
}
.tab_container {
	border-bottom: 1px solid #eee;
	clear: both;
	float: left;
	width: 400px;
	background: #FFFFFF;
}
.tab_content {
	padding: 5px;
	font-size: 14px;
	display: none;
}
.tab_container .tab_content ul {
	width: 100%;
	margin: 0px;
	padding: 0px;
}
.tab_container .tab_content ul li {
	padding: 5px;
	list-style: none
}
#map {
	width: 1090px;
	height: 450px;
}
input[type=radio] {
	margin: 5px;
}
input[type=text] {
	margin: 5px;
	width: 300px;
	border: 1px solid #ccc;
	-moz-border-radius: 10px;
	-webkit-border-radius: 10px;
	border-radius: 8px;
	-moz-box-shadow: 2px 2px 3px #b5b5b5;
	-webkit-box-shadow: 2px 2px 3px #b5b5b5;
	box-shadow: 2px 2px 3px #b5b5b5;
	font-size: 12px;
	padding: 4px 7px;
	outline: 0;
	-webkit-appearance: none;
}
input[type=date] {
	line-height: 25px;
	margin: 5px;
	width: 130px;
	border: 1px solid #ccc;
	-moz-border-radius: 10px;
	-webkit-border-radius: 10px;
	border-radius: 8px;
	-moz-box-shadow: 2px 2px 3px #b5b5b5;
	-webkit-box-shadow: 2px 2px 3px #b5b5b5;
	box-shadow: 2px 2px 3px #b5b5b5;
	font-size: 12px;
	outline: 0;
	-webkit-appearance: none;
}
input:focus {
	background-color: #f2fafc;
}
#HomeLogo {
	width: 100px; \
	height: 60px;
	border-radius: 5px;
}
img {
	width: 70px;
	height: 60px;
}
th:nth-child(2n+1), td:nth-child(2n+1) {
	background: aliceblue;
}
th:nth-child(2n), td:nth-child(2n) {
	background: #f7f8f9;
}
#container div {
	line-height: 20px;
	text-align: center;
	padding: 3px;
}
button {
	border: none;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	cursor: pointer;
	padding: 8px;
	font-size: 13px;
	background-color: lightgrey;
	border-radius: 4px;
}
.headers {
	overflow: hidden;
	background-color: white;
	border: 2px solid;
}
.header {
	overflow: hidden;
	float: left;
	margin-top: 5px;
	margin-left: 5px;
}
.header a {
	color: black;
	text-align: center;
	padding: 12px;
	text-decoration: none;
	font-size: 18px;
	line-height: 25px;
	border-radius: 4px;
}
.header2 {
	overflow: hidden;
	float: right;
	margin-top: 10px;
}
.header2 a {
	float: left;
	color: black;
	text-align: center;
	padding: 12px;
	text-decoration: none;
	font-size: 18px;
	line-height: 25px;
	border-radius: 4px;
}
.header a.logo {
	font-size: 25px;
	font-weight: bold;
}
.headers a:hover {
	background-color: #ddd;
	color: black;
}
.headers a.active {
	color: black;
}
.header-right {
	float: right;
}
@media screen and (max-width: 500px) {
	.header a {
		float: none;
		display: block;
		text-align: left;
	}
	.header-right {
		float: none;
	}
}
</style>

</head>

<body>

	<div id="page">
		<div class="headers">
			<div class="header">

				<a href='<c:url value="/" />' class="logo"><img id='HomeLogo'
					src="<c:url value='/resources/img/Logo.jpg' />" /></a>
			</div>
			<div class="header2">
				<div class="header-right">
					<a href='<c:url value="deliciousForm" />'>맛집지도</a> <a
						href='<c:url value="/goRoute" />'>식신원정대</a> <a
						href='<c:url value="/memberUpdateForm" />'>마이페이지</a>




					<c:if test="${loginInfo eq null }">
						<a href="<c:url value='/loginForm' />">LOGIN</a>
					</c:if>
					<c:if test="${loginInfo ne null }">
						<a href="<c:url value='/logOut' />">LOGOUT</a>
					</c:if>

				</div>
			</div>
		</div>
		<div id="leftside">
			<div id="container">
				<ul class="tabs">
					<li class="active" rel="tab1" onclick="resetSearch(this)">원정대
						검색</li>
					<li rel="tab2" onclick="resetMake(this)">원정대 만들기</li>
				</ul>
				<div class="tab_container">
					<div id="tab1" class="tab_content">
						<div>
							<label><input type="date" name="searchDateFrom"
								id="fromDate"></label>~ <label><input type="date"
								name="searchDateTo" id="toDate"></label>
						</div>
						<div>
							<label><input type="text" placeholder="원정대이름,해시태그,예산"
								id="routeWord">
								<button onclick="routeSearch()">검색</button></label>
						</div>

					</div>
					<!-- #tab1 -->
					<div id="tab2" class="tab_content">
						<div>
							<!-- 							<label><input type="radio" name="searchPool"
								id="kakaoDelicious" class="searchPool" />맛집 검색하기</label> -->
						</div>
						<div>
							<div>
								<!-- <input type="radio" name="searchPool"
								id="myDelicious" class="searchPool" /> -->
								맛집 검색으로 원정대만들기
							</div>
						</div>
						<div>
							<label><input type="text" placeholder="맛집이름,카테고리,상세정보"
								name="search">
								<button onclick="search()">검색</button></label>
						</div>
					</div>
					<!-- #tab2 -->

				</div>
				<div id="cssResult">검색 결과</div>

				<!-- .tab_container -->

			</div>
			<div id="searched" ondragover="allowDrop(event)"></div>

			<!-- #container -->
		</div>
		<div id="rightside">
			<div id="righttop">
				<div id="map"></div>
			</div>
			<div id="rightbottom">
				<div id="smallLeft">
					<div id="smallLeftLeft">
						<%--                         	<c:forEach var="i" begin="1" end="20">
                        	<div class='deliciousList ListOrder'>${i}</div>
                        	</c:forEach> --%>
					</div>
					<div id="smallLeftRight" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
				</div>
				<div id="smallright">
					<form action='<c:url value="/makeRoute"/>' id="form1"
						onsubmit="return save($(this));">
						<table border=1>
							<tr>
								<td>원정대이름</td>
								<td><input type="text" name="routeName"
									placeholder="필수 입력 정보입니다." /></td>
							</tr>
							<tr>
								<td>주최자</td>
								<td><input type="text" name="memeberName"
									placeholder="필수 입력 정보입니다." /></td>
							</tr>
							<tr>
								<td>참여가능인원</td>
<<<<<<< HEAD
								<td><input type="text" name="possibleNum"
									placeholder="필수 입력 정보입니다. ex) 5" /></td>
=======
>>>>>>> branch 'master' of https://github.com/emoji04/EMOJI.git
								<td><input type="text" name="possibleNum"
									placeholder="필수 입력 정보입니다. ex) 5명" /></td>
							</tr>
							<tr>
								<td>시작시간</td>
								<td><input type="text" name="startDate"
									placeholder="필수 입력 정보입니다. ex) 2018-01-11 18:00" /></td>
							</tr>
							<tr>
								<td>예상 소요시간</td>
								<td><input type="text" name="spendTime"
									placeholder="필수 입력 정보입니다. ex) 5시간" /></td>
							</tr>
							<tr>
								<td>예상 금액</td>
								<td><input type="text" name="budget"
									placeholder="ex) 50000" /></td>
							</tr>
							<tr>
								<td>제한 사항</td>
								<td><input type="text" name="rule"
									placeholder="ex) 하얀 옷 입어주세요" /></td>
							</tr>
							<tr>
								<td>해시 태그</td>
								<td><input type="text" name="routeTag"
									placeholder="ex) #종로, #안녕" /></td>
							</tr>
							<tr>
								<td colspan="2"><button id="button1">원정대 만들기</button>
								<td><input type="hidden" id="add" name="order" /> <input
									type="hidden" id="searchedRouteNum" /></td>

							</tr>
						</table>

					</form>
				</div>
			</div>
		</div>
	</div>
</body>
<c:url var="search1" value="/search"></c:url>
<c:url var="search2" value="/routeSearch"></c:url>
<c:url var="getRouteInfo" value="/clickRoute"></c:url>
<c:url var="insertJoin" value="/clickJoin"></c:url>
<c:url var="cancelJoin" value="/cancelJoin"></c:url>

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=377fa9901a70a356db9e8b6e1ab1a3a9&libraries=services"></script>
<script>
	//경로를 만들기 위해서 주소들을 배열에 저장해 놓음
	var addresses = new Array();
	var orderedPins = [];
	var order = 1;
	var markers = [];
	var polylines = [];
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		level : 3
	// 지도의 확대 레벨
	};
	//지도를 생성합니다    
	var map = new daum.maps.Map(mapContainer, mapOption);
	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new daum.maps.ZoomControl();
	map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
	// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
	if (navigator.geolocation) {
		// GeoLocation을 이용해서 접속 위치를 얻어옵니다
		navigator.geolocation.getCurrentPosition(function(position) {
			var lat = position.coords.latitude, // 위도
			lon = position.coords.longitude; // 경도
			var locPosition = new daum.maps.LatLng(lat, lon) // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다	
			map.setCenter(locPosition);
		});
	}
	//드래그앤 드롭
	function drag(drag) {
		//드래그 된 타겟의 아이디를 delicious라는 이름으로 저장해 놓음
		drag.dataTransfer.setData("delicious", drag.target.id);
		drag.dataTransfer.setData("info", drag.target.innerHTML);
	}
	function drop(drop) {
		var cnt = 0;
		//delicious로 저장된 데이터를 가지고옴
		var data = drop.dataTransfer.getData("delicious");
		var info = drop.dataTransfer.getData("info");
		drop.preventDefault();
		//중복으로 옮겨지지 않도록 방지
		//이미 옮겨져 있는 맛집과 비교
		//이미 옮겨져 있는 맛집의 경우 순서가 바뀌도록 할것
		if (data.substring(0, 13) == 'deliciousCopy') {
			for (var k = 0; k < addresses.length; k++) {
				if (addresses[k] != $('input[name=' + data.chatAt(14) + ']')
						.val()) {
					cnt++;
				}
			}
		} else { //검색되어있는 맛집과 비교
			for (var k = 0; k < addresses.length; k++) {
				if (addresses[k] != $('input[name=' + data + ']').val()) {
					cnt++;
				}
			}
		}
		if (cnt == addresses.length) {
			//해당 데이터의 노드를 카피해서 복사되서 움직일 수 있도록 함
			var copy = document.getElementById(data).cloneNode(true);
			//새로 만든 노드의 아이디는 달라야함
			copy.id = "deliciousCopy" + data + "";
			//복사해서 지정해놓은 곳으로 저장해놓음
			drop.target.appendChild(copy);
			$('#smallLeftLeft')
					.append(
							"<div class='deliciousList listOrder' >" + order
									+ "</div>")
			//data의 값은 1부터 들어가도록 설정해놓았기 때문에 배열안에는 -1을 해서 값을 넣는다.
			addresses[order - 1] = $('input[name=' + data + ']').val();
			console.log(addresses[order - 1]);
			//주소-좌표 변환 객체를 생성합니다
			var geocoder = new daum.maps.services.Geocoder();
			//주소를 좌표로 변환합니다
			geocoder
					.addressSearch(
							addresses[order - 1],
							function(result, status) {
								// 정상적으로 검색이 완료됐으면 
								if (status === daum.maps.services.Status.OK) {
									var coords = new daum.maps.LatLng(
											result[0].y, result[0].x);
									// 결과값으로 받은 위치를 마커로 표시합니다
									var imageSrc = '${pageContext.request.contextPath}/resources/img/orderedPin/marker'
											+ order + '.png', // 마커이미지의 주소입니다    
									imageSize = new daum.maps.Size(30, 35); // 마커이미지의 크기입니다
									var markerImage = new daum.maps.MarkerImage(
											imageSrc, imageSize);
									var marker = new daum.maps.Marker({
										map : map,
										position : coords,
										image : markerImage
									});
									markers.push(marker);
									map.panTo(coords);
								}
								//그 바로 직전의 주소를 변환하기 시작
								if (order - 2 >= 0) {
									geocoder
											.addressSearch(
													addresses[order - 2],
													function(result2, status2) {
														// 정상적으로 검색이 완료됐으면 
														if (status2 === daum.maps.services.Status.OK) {
															var coords2 = new daum.maps.LatLng(
																	result2[0].y,
																	result2[0].x);
														}
														// 선을 구성하는 좌표 배열입니다. 이 좌표들을 이어서 선을 표시합니다
														var linePath = [
																coords2, coords ];
														// 지도에 표시할 선을 생성합니다
														var polyline = new daum.maps.Polyline(
																{
																	path : linePath, // 선을 구성하는 좌표배열 입니다
																	strokeWeight : 5, // 선의 두께 입니다
																	strokeColor : '#FFAE00', // 선의 색깔입니다
																	strokeOpacity : 0.7,
																	// 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
																	strokeStyle : 'solid' // 선의 스타일입니다
																});
														// 지도에 선을 표시합니다 
														polyline.setMap(map);
														polylines
																.push(polyline);
													});
								}
								order++;
							});
			reorder();
		}
	}
	function allowDrop(data) {
		data.preventDefault();
	}
	function search() {
		$("#searched").text("");
		//검색된 맛집 데이터의 이름과 상세정보를 저장할 배열 두개
		var name = new Array();
		var detail = new Array();
		//id를 다르게 하기 위한 변수를 선언
		var i = 1;
		if ($("#kakaoDelicious").prop('checked') == true) {
			var places = new daum.maps.services.Places();
			var keyword = $('input[name=search]').val();
			var callback = function(result, status, pagination) {
				if (status === daum.maps.services.Status.OK) {
					$
							.each(
									result,
									function(key, value) {
										name = value.place_name;
										detail = value.category_group_name;
										$('#searched')
												.append(
														"<div class='delicious' id='"
																+ i
																+ "' draggable='true' ondragstart='drag(event)'><div>"
																+ name
																+ "</div>"
																+ "<div>"
																+ detail
																+ "</div><input name='" + i + "'  type='hidden' value='" + value.address_name + "' /></div>");
										if (i % 15 == 0
												&& pagination.hasNextPage == true) {
											$('#searched')
													.append(
															"<button class='nextButton'>다음</button>");
										}
										$('.nextButton').click(function() {
											// 속성 값으로 다음 페이지가 있는지 확인하고
											if (pagination.hasNextPage) {
												// 있으면 다음 페이지를 검색한다.
												pagination.nextPage();
												$(this).remove();
											}
										})
										i++;
									});
				}
			};
			places.keywordSearch(keyword, callback);
		} else {
			//내 맛집지도 불러오기 
			var search2 = $('input[name=search]').val();
			if (search2 != "") {
				//검색을 눌렀을 때 비동기 시작            	
				$
						.ajax({
							type : "get",
							url : "${search1}",
							contentType : "application/x-www-form-urlencoded; charset=UTF-8",
							data : {
								"ajaxSearch" : search2
							},
							dataType : "json", //json형태로 데이터를 받아옴
							success : function(data) {
								console.log(data);
								$('#cssResult').val("검색 결과");
								//검색된 맛집이 여러개 일 수 있으므로
								$
										.each(
												data,
												function(key, value) {
													//데이터 가져오기
													name = value.deliciousName;
													detail = value.deliciousDetail;
													//검색 결과 영역에 각각 div 형태로 붙여넣기
													$('#searched')
															.append(
																	"<div class='delicious' id='"
																			+ i
																			+ "' draggable='true' ondragstart='drag(event)'><div class='imgcss'><img src='"
																			+ getContextPath()
																			+ "/resources/img/deliciousPin/"
																			+ value.deliciousImg
																			+ "' alt='등록된 이미지가 없습니다.'/></div><div class='imgcssright'><div>이름 : "
																			+ name
																			+ "</div>"
																			+ "<div>상세 정보 : "
																			+ detail
																			+ "</div><input class='address' name='" + i + "'  type='hidden' value='" + value.deliciousAddress + "' /><input name='pinNumber'  type='hidden' value='" + value.deliciousNum + "' /></div></div>");
													i++;
												});
							}
						});
			} else {
				alert("검색어를 입력해주세요.");
			}
		}
	}
	//마커 재정렬
	function reorder() {
		//순서대로 정렬 해보기
		/*     //편의를 위해 이미지파일의 이름과 맞추기위해서 숫자에 0이 나오지 않도록 함
		 spos++;
		 epos++; */
		//원래 있던 마커를 삭제
		setMarkers(null);
		//마커배열 비우기
		markers = [];
		//마커와 폴리라인 배열 비우기
		//setPolylines(null);
		//전체적으로 새로운 이름 및 아이디 부여
		$('#smallLeftRight').children().each(
				function(index) {
					$(this).attr('id', 'deliciousCopy' + index + '');
					$(this).find('.address').attr('name',
							'addressOrder' + index);
					$(this).find('input[name=pinNumber]').attr('name',
							'orderedPinNumber');
				});
		//children 함수로 바꿔보기
		$.each(addresses, function(i) {
			addresses[i] = $("input[name=addressOrder" + i + "]").val();
		});
		//다 지우고 다시 만들기
		//재정렬된 주소로 새로운 선 만들어내기 및 순서대로 새로운 마커 배열 만들어내기
		//주소-좌표 변환 객체를 생성합니다
		$
				.each(
						addresses,
						function(index) {
							var geocoder = new daum.maps.services.Geocoder();
							geocoder
									.addressSearch(
											addresses[index],
											function(result, status) {
												// 정상적으로 검색이 완료됐으면
												if (status === daum.maps.services.Status.OK) {
													var coords = new daum.maps.LatLng(
															result[0].y,
															result[0].x);
													var imageSrc = '${pageContext.request.contextPath}/resources/img/orderedPin/marker'
															+ (index + 1)
															+ '.png', // 마커이미지의 주소입니다
													imageSize = new daum.maps.Size(
															30, 35); // 마커이미지의 크기입니다
													var markerImage = new daum.maps.MarkerImage(
															imageSrc, imageSize);
													var marker = new daum.maps.Marker(
															{
																map : map,
																position : coords,
																image : markerImage
															});
													markers.push(marker);
													if (index - 1 >= 0) {
														geocoder
																.addressSearch(
																		addresses[index - 1],
																		function(
																				result2,
																				status2) {
																			// 정상적으로 검색이 완료됐으면
																			if (status2 === daum.maps.services.Status.OK) {
																				var coords2 = new daum.maps.LatLng(
																						result2[0].y,
																						result2[0].x);
																			}
																			// 선을 구성하는 좌표 배열입니다. 이 좌표들을 이어서 선을 표시합니다
																			var linePath = [
																					coords2,
																					coords ];
																			/*                     
																			 // 지도에 표시할 선을 생성합니다
																			 var polyline = new daum.maps.Polyline({
																			 path: linePath, // 선을 구성하는 좌표배열 입니다
																			 strokeWeight: 5, // 선의 두께 입니다
																			 strokeColor: '#FFAE00', // 선의 색깔입니다
																			 strokeOpacity: 0.7,
																			 // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
																			 strokeStyle: 'solid' // 선의 스타일입니다
																			 }); */
																			//원래있던 배열의 값을 새로바꿈
																			polylines[index - 1]
																					.setPath(linePath);
																		});
													}
													//좌표 중심을 마지막 마커로 설정
													if (index == (addresses.length - 1)) {
														map.panTo(coords);
													}
												}
											});
						});
	}
	function setMarkers(map) {
		for (var i = 0; i < markers.length; i++) {
			markers[i].setMap(map);
		}
	}
	function setPolylines(map) {
		$.each(polylines, function(index) {
			polylines[index].setMap(map);
		})
	}

	function save(e) {
<<<<<<< HEAD

=======
>>>>>>> branch 'master' of https://github.com/emoji04/EMOJI.git
		var name = $('input[name=memeberName]').val();
		var routeName = $('input[name=routeName]').val();
		var possible = $('input[name=possibleNum]').val();
		var date = $('input[name=startDate]').val();
		var time = $('input[name=spendTime]').val();
		if (name === "" || routeName === "" || possible === "" || date === ""
				|| time === "") {
			alert("입력되지 않은 정보가 있습니다.");
			return false;
		}
<<<<<<< HEAD

=======
		/* $('#add').val(addresses); */
>>>>>>> branch 'master' of https://github.com/emoji04/EMOJI.git
		routeNum = $('#searchedRouteNum').val();
		if ($('#button1').text() === '참여가능') {
<<<<<<< HEAD
			$.ajax({
				type : "get",
				url : "${insertJoin}",
				data : {
					"routeNum" : routeNum
				},
				success : function(data) {
					if (data == "참여가 완료되었습니다.") {
						$('#button1').text("승인 중");
					}
					return false;
				}

			});

		} else if ($('#button1').text() === '참여가능') {
=======
>>>>>>> branch 'master' of https://github.com/emoji04/EMOJI.git
			event.preventDefault();
<<<<<<< HEAD

=======
>>>>>>> branch 'master' of https://github.com/emoji04/EMOJI.git
			//폼의 주소로만 가서 makeRoute컨트롤러로간다
			//ajax를 가지않음			
			$.ajax({
				type : "get",
				url : "${insertJoin}",
				data : {
					"routeNum" : routeNum
				},
				success : function(data) {
					if (data == "참여가 완료되었습니다.") {
						$('#button1').text("승인 중");
					}
					return false;
				}
<<<<<<< HEAD

			});

=======
			})
>>>>>>> branch 'master' of https://github.com/emoji04/EMOJI.git
		} else if ($('#button1').text() === '원정대 대장으로 참여중') {
			alert("참여하실 수 없습니다.")
			return false;
		} else if ($('#button1').text() === '승인 중') {
			event.preventDefault();
			//다시 누르면 취소하는 ajax하기
			$.ajax({
				type : "get",
				url : "${cancelJoin}",
				data : {
					"routeNum" : routeNum
				},
				success : function(data) {
					alert("참여가 취소되었습니다.");
					$('#button1').text("참여가능")
				}
<<<<<<< HEAD
			});
		}

		/* 			break;
		default: */
		var name = $('input[name=memeberName]').val();
		var routeName = $('input[name=routeName]').val();
		var possible = $('input[name=possibleNum]').val();
		var date = $('input[name=startDate]').val();
		var time = $('input[name=spendTime]').val();

		if (name === "" || routeName === "" || possible === "" || date === ""
				|| time === "") {
			alert("입력되지 않은 정보가 있습니다.");
			return false;
		}
		var size = document.getElementsByName("orderedPinNumber").length;
		for (var i = 0; i < size; i++) {
			orderedPins.push(document.getElementsByName("orderedPinNumber")[i].value);
		}
		$('#add').val(orderedPins);
		return true;
=======
			})
		} else {
			var size = document.getElementsByName("orderedPinNumber").length;
			for (var i = 0; i < size; i++) {
				orderedPins
						.push(document.getElementsByName("orderedPinNumber")[i].value);
			}
			$('#add').val(orderedPins);
			return true;
		}
>>>>>>> branch 'master' of https://github.com/emoji04/EMOJI.git
	}

	
</script>
<script>
	//탭메뉴 만들기
	$(function() {
		$(".tab_content").hide();
		$(".tab_content:first").show();
		/*      $("ul.tabs li").click(function() {
		 });  */
		$('#smallLeftRight').sortable({
			start : function(event, ui) {
				ui.item.data('start', ui.item.index());
			},
			stop : function(event, ui) {
				var spos = ui.item.data('start');
				var epos = ui.item.index();
				reorder();
			}
		});
	});
	//탭메뉴 바꾸기
	function tabChange(e) {
		$("ul.tabs li").removeClass("active").css("color", "#333");
		$(e).addClass("active").css("color", "darkred");
		$(".tab_content").hide();
		var activeTab = $(e).attr("rel");
		$("#" + activeTab).fadeIn();
		$("#searched").text("");
	}
	//원정대 검색 초기화
	function resetSearch(e) {
		var check = confirm("원정대 만들기를 취소하시겠습니까?");
		if (check) {
			tabChange(e);
			$('#form1').children('input').attr('readonly', true);
			erase();
			//원정대 폼은 검색된 원정대 정보에 따라서 참여취소와 참여하기 스크랩하기 만들것.
		}
	}
	function resetMake(e) {
		tabChange(e);
		$('#form1').children('input').removeAttr('readonly');
		$('#button1').text("원정대 만들기");
		erase();
	}
	function erase() {
		//화면 초기화
		$("#searched").text("");
		//경로안의 맛집들 다 지우기
		$('#smallLeftLeft').text("");
		$('#smallLeftRight').text("");
		//지도의 마커 지우기
		setMarkers(null);
		markers = [];
		//지도의 선지우기
		setPolylines(null);
		polylines = [];
		//드래그 막기
		/* 		$('#smallLeftRight'). removeAttr("ondrop");
		 $('#smallLeftRight'). removeAttr("ondragover"); */
		//원정대이름 다 지우기
		$('input[type=text]').each(function() {
			$(this).val("");
		});
	}
	function routeSearch() {
		var from = $('#fromDate').val();
		var to = $('#toDate').val();
		var routeWord = $('#routeWord').val();
		erase();
		if (routeWord != "") {
			$
					.ajax({
						type : "get",
						url : "${search2}",
						contentType : "application/x-www-form-urlencoded; charset=UTF-8",
						data : {
							"from" : from,
							"to" : to,
							"routeWord" : routeWord
						},
						dataType : "json",
						success : function(data) {
							$
									.each(
											data,
											function(key, value) {
												$('#searched')
														.append(
																"<div class='delicious' style='' onclick='show(this)'><div class='routeName' 이름 : >"
																		+ value.routeName
																		+ "</div><div> 태그 : "
																		+ value.routeTag
																		+ "</div><input type='hidden' class='routeNum' value='"+value.routeNum+"' /></div>")
											})
						}
					});
		} else {
			alert("검색어를 입력해주세요.");
		}
	}
	function show(e) {
		//경로안의 맛집들 다 지우기
		$('#smallLeftLeft').text("");
		$('#smallLeftRight').text("");
		//지도의 마커 지우기
		setMarkers(null);
		markers = [];
		//지도의 선지우기
		setPolylines(null);
		polylines = [];
		//클릭된 원정대의 지도상의 뜰 마커의 주소 초기화
		searchAddresses = [];
		var routeNum = 0;
		$(e).each(function() {
			routeNum = $(this).find('.routeNum').val();
		});
		$
				.ajax({
					type : "get",
					url : "${getRouteInfo}",
					contentType : "application/x-www-form-urlencoded; charset=UTF-8",
					data : {
						"routeNum" : routeNum
					},
					dataType : "json",
					success : function(data) {
						//참여상태 출력
						console.log(data);
						console.log(data.joinState);
						$('#button1').text(data.joinState);
						$('input[name=memeberName]').val(data.memberName);
						$
								.each(
										data,
										function(key, value) {
											//원정대 상세정보 출력
											if (value == data.routeInfo) {
												$('input[name=routeName]').val(
														value.routeName);
												$('input[name=possibleNum]')
														.val(value.possibleNum);
												$('input[name=startDate]').val(
														value.startDate);
												$('input[name=spendTime]').val(
														value.spendTime);
												$('input[name=budget]').val(
														value.budget);
												$('input[name=rule]').val(
														value.rule);
												$('input[name=routeTag]').val(
														value.routeTag);
												$('#searchedRouteNum').val(
														value.routeNum);
												/* 						console.log(value);							
												 console.log("value.possibleNum : "+value.possibleNum); */
											}
											if (value != data.joinState
													&& value != data.routeInfo
													&& value != data.memberName) {
												//원정대 경로 출력
												$
														.each(
																value,
																function(key,
																		vvalue) {
																	if (value == data.routeDelicious) {
																		$(
																				'#smallLeftLeft')
																				.append(
																						"<div class='deliciousList listOrder'>"
																								+ (key + 1)
																								+ "</div>");
																		$(
																				'#smallLeftRight')
																				.append(
																						"<div class='delicious'><div class='imgcss'><img src='"
																								+ getContextPath()
																								+ "/resources/img/deliciousPin/"
																								+ vvalue.deliciousImg
																								+ "' alt='등록된 이미지가 없습니다.'/></div><div class='imgcssright'><div>이름 : "
																								+ vvalue.deliciousName
																								+ "</div><div>상세 정보 : "
																								+ vvalue.deliciousDetail
																								+ "</div></div></div>");
																		//주소저장
																		searchAddresses
																				.push(vvalue.deliciousAddress);
																	}
																})
											}
										});
						//주소로 마커, 선생성
						$
								.each(
										searchAddresses,
										function(index) {
											var geocoder = new daum.maps.services.Geocoder();
											geocoder
													.addressSearch(
															searchAddresses[index],
															function(result,
																	status) {
																// 정상적으로 검색이 완료됐으면
																if (status === daum.maps.services.Status.OK) {
																	var coords = new daum.maps.LatLng(
																			result[0].y,
																			result[0].x);
																	var imageSrc = '${pageContext.request.contextPath}/resources/img/orderedPin/marker'
																			+ (index + 1)
																			+ '.png', // 마커이미지의 주소입니다
																	imageSize = new daum.maps.Size(
																			30,
																			35); // 마커이미지의 크기입니다
																	var markerImage = new daum.maps.MarkerImage(
																			imageSrc,
																			imageSize);
																	var marker = new daum.maps.Marker(
																			{
																				map : map,
																				position : coords,
																				image : markerImage
																			});
																	markers
																			.push(marker);
																	map
																			.panTo(coords);
																	if (index - 1 >= 0) {
																		geocoder
																				.addressSearch(
																						searchAddresses[index - 1],
																						function(
																								result2,
																								status2) {
																							// 정상적으로 검색이 완료됐으면
																							if (status2 === daum.maps.services.Status.OK) {
																								var coords2 = new daum.maps.LatLng(
																										result2[0].y,
																										result2[0].x);
																							}
																							// 선을 구성하는 좌표 배열입니다. 이 좌표들을 이어서 선을 표시합니다
																							var linePath = [
																									coords2,
																									coords ];
																							// 지도에 표시할 선을 생성합니다
																							var polyline = new daum.maps.Polyline(
																									{
																										path : linePath, // 선을 구성하는 좌표배열 입니다
																										strokeWeight : 5, // 선의 두께 입니다
																										strokeColor : '#FFAE00', // 선의 색깔입니다
																										strokeOpacity : 0.7,
																										// 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
																										strokeStyle : 'solid' // 선의 스타일입니다
																									});
																							polyline
																									.setMap(map);
																							polylines
																									.push(polyline);
																							//원래있던 배열의 값을 새로바꿈
																							/* polylines[index - 1]
																									.setPath(linePath); */
																						});
																	}
																	//좌표 중심을 마지막 마커로 설정
																	if (index == (addresses.length - 1)) {
																		map
																				.panTo(coords);
																	}
																}
															});
										});
					}
				})
	}
	function getContextPath() {
		var hostIndex = location.href.indexOf(location.host)
				+ location.host.length;
		return location.href.substring(hostIndex, location.href.indexOf('/',
				hostIndex + 1));
	};
</script>
</html>