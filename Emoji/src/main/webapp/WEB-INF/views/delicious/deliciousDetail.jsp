<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
.tab-wrap * {
	margin: 0px;
	padding: 0px;
}

.tab-wrap {
	position: relative;
	padding-top: 30px;
}

.tab-wrap li {
	z-index: 2;
	position: absolute;
	top: 0px;
	width: 100px;
	height: 30px;
	text-indent: -9999%;
}

.tab-wrap li:nth-of-type(1) {
	left: 0px;
}

.tab-wrap li:nth-of-type(2) {
	left: 100px;
}

.tab-wrap li a {
	display: block;
	width: 100%;
	height: 100%;
}

.tab-wrap h1 {
	position: absolute;
	top: 0px;
	width: 100px;
	height: 30px;
	line-height: 30px;
	box-sizing: border-box;
	border: 1px solid #ddd;
	text-align: center;
	font-size: 12px;
}

.tab-wrap article p {
	border: 1px solid #ddd;
	padding: 30px;
}

.tab-wrap article:target h1 {
	    background: #e0e0e0;
}

.tab-wrap article:nth-of-type(1) h1 {
	left: 0px;
}

.tab-wrap article:nth-of-type(2) h1 {
	left: 100px;
}

.tab-wrap article p {
	display: none;
}

.tab-wrap article:target p {
	display: block;
}

#list {
	margin: 12% 27%;
}

#listDetail {
	border: 1px solid black;
	font-size: 45px;
	position: relative;
}

#dmSumnail {
	width: 200px;
	hight: 200px;
	margin: 10px;
}

#circle {
	font-size: 13px;
	text-align: center;
	line-height: 45px;
	color: black;
	width: 60px;
	height: 60px;
	border: 5px solid hotpink;
	border-radius: 30%;
}

#posi {
	position: absolute;
	right: 5px;
	top: 5px;
}

/* 지도 크기  */
.map {
	width: 100%;
	height: 500px;
}

.Retable td {
	width: auto;
	border: 1px solid black;
}

wrap {
	position: absolute;
	left: 0;
	bottom: 40px;
	width: 288px;
	height: 132px;
	margin-left: -140px;
	text-align: left;
	overflow: hidden;
	font-size: 12px;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	line-height: 1.5;
}

.wrap * {
	padding: 0;
	margin: 0;
}

.wrap .info {
	width: 286px;
	height: 125px;
	border-radius: 5px;
	border-bottom: 2px solid #ccc;
	border-right: 1px solid #ccc;
	overflow: hidden;
	background: #fff;
}

.wrap .info:nth-child(1) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.wrap .title {
	padding: 2px 0 0 10px;
	height: 30px;
	background: #eee;
	border-bottom: 1px solid #ddd;
	font-size: 18px;
	font-weight: bold;
}

.close {
	float: right;
	margin-top: 1%;
	margin-right: 5%;
}

.contentBox {
	position: relative;
	float: left;
	width: 100%;
}

.desc {
	overflow: hidden;
	position: relative;
	float: left;
	margin-top: 5%;
	width: 50%;
	margin-left: 35%;
}

.desc .address {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.desc .phone {
	font-size: 13px;
	color: #888;
	margin-top: -2px;
}

.desc .detail {
	color: #5085BB;
	margin-top: 3px;
}

.imageInfo {
	position: absolute;
	top: 10px;
	left: 5px;
	width: 73px;
	height: 71px;
	border: 1px solid #ddd;
	color: #888;
	overflow: hidden;
	margin-left: 3%;
}

</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript"
	src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=377fa9901a70a356db9e8b6e1ab1a3a9&libraries=services"></script>
<body>
	<!-- /////////// 상단바  //////////// -->
	<%@ include file="../commons/top_bar.jsp"%>
	<div id="list">
		<c:forEach items="${dmDetail}" var="dmDetail" varStatus="status">

			<input type="hidden" id="deliciousMapNum"
				value="${dmDetail.deliciousMapNum}" />

			<div id="listDetail">${dmDetail.deliciousMapName }
				<div id="posi">
					<a style="text-decoration:none;" href="javascript:scrapFunction(${dmDetail.deliciousMapNum},${memberNum});">
						<div id="circle">스크랩</div>
					</a>
				</div>
			</div>
			<table style="margin: 2% 0;">
				<tr>
					<td><img id="dmSumnail"
						src='resources/img/deliciousPin/${deliciousImg}'></td>
					<td>작성자 : <a
						href="javascript:memberFunction(${dmDetail.memberNum});">${dmDetail.memberEmail }</a>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						설명 :${dmDetail.deliciousMapDetail }<br> 등록일자
						:${dmDetail.deliciousMapCreateDate }<br> 평점 : ${gradeAvg}/5
					</td>
				</tr>
			</table>
		</c:forEach>

		<hr>


		<div id="Dmap" class="map"></div>


		<hr>

		<div class="tab-wrap">
			<ul>
				<li><a href="#tab1">tab1</a></li>
				<li><a href="#tab2">tab2</a></li>
			</ul>

			<div>
				<article id="tab1">
					<h1>리뷰 목록보기</h1>
					
				</article>
				<article id="tab2">
					<h1>리뷰 쓰기</h1>
					<p>리뷰 제목 : <input style="margin:3px 0; border-radius: 10px;" id="reviewTitle" type="text" maxlength="25" /> <br>
						리뷰 설명 : <input style="margin:3px 0; border-radius: 10px;" id="reviewDetail" type="text" maxlength="25" size="25"/> <br>
						리뷰 평점 : <input style="margin:3px 0; border-radius: 10px;" id="reviewGrade" type="text" onkeypress="return isNumberKey(event)" maxlength="3" size="3" />/5 <br>
						<input class="w3-btn w3-white w3-border w3-round-large" id="reviewsumit" onclick="insertReview();" style="position:absolute; bottom:10px; right:50%;" type="button" value="리뷰작성하기">
						</p>
				</article>
			</div>
		</div>



<jsp:useBean id="now" class="java.util.Date" />
<input type="hidden" id="deliciousMapWriteDate" value="<fmt:formatDate value='${now}' pattern='yyyy-MM-dd' />">

		<input type="hidden" id="scrapCheck" value="${scrapCheck}" />
		<input type="hidden" id="memberNum" value="${memberNum}" />
	</div>


	<script>
		var turn = $('#scrapCheck').val(); // 1 or 0 스크랩 체크
		var deliciousMapNum = $('#deliciousMapNum').val();
		var memberNum = $('#memberNum').val();
		
		 function isNumberKey(evt) {

		        var charCode = (evt.which) ? evt.which : event.keyCode;

		        if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57))

		            return false;

		        // Textbox value       

		        var _value = event.srcElement.value;       

		        // 소수점(.)이 두번 이상 나오지 못하게

		        var _pattern0 = /^\d*[.]\d*$/; // 현재 value값에 소수점(.) 이 있으면 . 입력불가

		        if (_pattern0.test(_value)) {

		            if (charCode == 46) {

		                return false;

		            }

		        }

		        // 10 이하의 숫자만 입력가능

		        var _pattern1 = /^\d{1}$/; // 현재 value값이 1자리 숫자이면 . 만 입력가능

		        if (_pattern1.test(_value)) {

		            if (charCode != 46) {

		                alert("5 이하의 숫자만 입력가능합니다");

		                return false;

		            }

		        }

		        // 소수점 첫째자리까지만 입력가능

		        var _pattern2 = /^\d*[.]\d{1}$/; // 현재 value값이 소수점 첫째짜리 숫자이면 더이상 입력 불가

		        if (_pattern2.test(_value)) {

		            alert("소수점 첫째자리까지만 입력가능합니다.");

		            return false;

		        }     

		        return true;
		    }
		 
		 
		 $('a[href="#tab1"]').click(function(){
			//리뷰 Ajax
				$.ajax({
					type : "POST",
					url : "<c:url value='myDmReview'/>",
					data: "deliciousMapNum=" + deliciousMapNum,
					dataType:"JSON",
					success: function(data){
						
                    $('.remove').remove();
						
						//데이터 삽입
						$.each(data, function(i,DeliciousMapReviewVO){
						document.getElementById("tab1").innerHTML += "<p class='remove' id='"+ i+"'><strong style='width:100px; padding:10px; border:0.5px solid black;'>"+DeliciousMapReviewVO.deliciousMapTitle+ "</strong>&nbsp;&nbsp;&nbsp;"+
						'<i>'+DeliciousMapReviewVO.deliciousMapContent+ "</i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
						"<small>작성일 :" +DeliciousMapReviewVO.deliciousMapWriteDate+ "&nbsp;&nbsp;"+"평점 :"+DeliciousMapReviewVO.deliciousMapGrade+"/5 &nbsp;</small></p>";
						
						if(DeliciousMapReviewVO.memberNum==memberNum){
						document.getElementById(i).innerHTML += '<input class="w3-btn w3-white w3-border w3-round-large" type="button" onclick="deleteReview('+DeliciousMapReviewVO.deliciousMapReviewNum+');" id="reviewdelete" value="삭제" />';
						}
						
						});
						 },	
					error : function(xhr, status, error){
						alert("에러발생");
					}
				});
		 });
		
		 
		 function deleteReview(deliciousMapReviewNum){
			 $.ajax({
					type : "POST",
					url : 'deleteReview.do',
					data: {
					   deliciousMapNum : deliciousMapNum,
					   deliciousMapReviewNum : deliciousMapReviewNum,
					},
					dataType:"JSON",
					success: function(data){
						
						$('.remove').remove();
						
						//데이터 삽입
						$.each(data, function(i,DeliciousMapReviewVO){
							
						document.getElementById("tab1").innerHTML += "<p class='remove' id='"+ i+"'><strong style='padding:10px; border:0.5px solid black;'>"+DeliciousMapReviewVO.deliciousMapTitle+ "</strong>&nbsp;&nbsp;&nbsp;"+
						'<i>'+DeliciousMapReviewVO.deliciousMapContent+ "</i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
						"<small>작성일 :" +DeliciousMapReviewVO.deliciousMapWriteDate+ "&nbsp;&nbsp;"+"평점 :"+DeliciousMapReviewVO.deliciousMapGrade+"/5 &nbsp;</small></p>";
						
						if(DeliciousMapReviewVO.memberNum==memberNum){
						document.getElementById(i).innerHTML +=  '<input class="w3-btn w3-white w3-border w3-round-large" type="button" onclick="deleteReview('+DeliciousMapReviewVO.deliciousMapReviewNum+');" id="reviewdelete" value="삭제" />';
						}
						
						});
						 },	
					error : function(){
						alert("에러발생");
					}
				});
			}
		 
		function insertReview(){
			$.ajax({
				type : 'post',
				url : 'insertReview.do',
				data : {
					reviewTitle : $('#reviewTitle').val(),
					reviewDetail : $('#reviewDetail').val(),
					reviewGrade : $('#reviewGrade').val(),
					deliciousMapWriteDate : $('#deliciousMapWriteDate').val(),
					deliciousMapNum : deliciousMapNum,
					memberNum : memberNum,
				},
				success : function() {
					alert('리뷰 작성완료');
					
				},
				error : function() {
					alert("ajax 에러");
				}

			});
		}

		$(document).ready(function() {
			

							if (turn == 1) { // 스크랩 되어있으면 배경색 변경
								$('#circle').css('background', 'hotpink');
							}
							
// 							//리뷰 Ajax
// 							$.ajax({
// 								type : "POST",
// 								url : "<c:url value='myDmReview'/>",
// 								data: "deliciousMapNum=" + deliciousMapNum,
// 								dataType:"JSON",
// 								success: function(data){
									
// // 									$('.remove').remove();
									
// 									//데이터 삽입
// 									$.each(data, function(i,DeliciousMapReviewVO){
// 									document.getElementById("tab1").innerHTML += "<p class='remove' id='"+ i+"'><strong style='width:100px; padding:10px; border:0.5px solid black;'>"+DeliciousMapReviewVO.deliciousMapTitle+ "</strong>&nbsp;&nbsp;&nbsp;"+
// 									'<i>'+DeliciousMapReviewVO.deliciousMapContent+ "</i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
// 									"<small>작성일 :" +DeliciousMapReviewVO.deliciousMapWriteDate+ "&nbsp;&nbsp;"+"평점 :"+DeliciousMapReviewVO.deliciousMapGrade+"/5 &nbsp;</small></p>";
									
// 									if(DeliciousMapReviewVO.memberNum==memberNum){
// 									document.getElementById(i).innerHTML += '<input type="button" onclick="updateReview('+DeliciousMapReviewVO.deliciousMapReviewNum+');" id="reviewupdate" value="수정" /> <input type="button" onclick="deleteReview('+DeliciousMapReviewVO.deliciousMapReviewNum+');" id="reviewdelete" value="삭제" />';
// 									}
									
// 									});
// 									 },	
// 								error : function(xhr, status, error){
// 									alert("에러발생");
// 								}
// 							});

							//지도 핀찍을 주소 정보 출력 
							$.ajax({
										type : "POST",
										url : "<c:url value='myDeliciousList'/>",
										data : "deliciousMapNum="
												+ deliciousMapNum,
										dataType : "JSON",
										success : function(data) {

											var addressList = []; //주소를 담기 위한 배열
											var pinNameList = []; //핀 이름을 담기 위한 배열	
											var phoneList = []; //전화번호를 담기 위한 배열
											var detailList = []; //상세정보를 담기 위한 배열
											var photoList = []; //사진이름을 담기 위한 배열

											//주소, 핀 이름, 전화번호, 상세정보, 사진이름을 배열에 담기
											$(data).each(function(index, deliciousPin) {
												addressList.push(deliciousPin.deliciousAddress);
																pinNameList
																		.push(deliciousPin.deliciousName);
																phoneList
																		.push(deliciousPin.deliciousPhone);
																detailList
																		.push(deliciousPin.deliciousDetail);
																photoList
																		.push(deliciousPin.deliciousImg);
															});

											$(".map")
													.each(
															function() {

																var mapContainer = document
																		.getElementById('Dmap'); // 지도를 표시할 div 
																var mapOption = {
																	center : new daum.maps.LatLng(
																			37.5676184544478,
																			126.98855631199186), // 지도의 중심좌표
																	level : 3
																// 지도의 확대 레벨
																};
																var map = new daum.maps.Map(
																		mapContainer,
																		mapOption); //지도 생성, 객체 리턴

																var imgSrc = 'resources/img/deliciousPin.png', //마커 이미지 주소
																imgSize = new daum.maps.Size(
																		30, 30); //마커 이미지 크기

																var markerImg = new daum.maps.MarkerImage(
																		imgSrc,
																		imgSize);

																var geocoder = new daum.maps.services.Geocoder(); //주소-좌표 변환 객체 생성

																addressList
																		.forEach(function(
																				address,
																				index) {
																			//주소로 좌표 검색
																			geocoder
																					.addressSearch(
																							address,
																							function(
																									result,
																									status) {
																								//정상적으로 검색이 완료됐으면
																								if (status == daum.maps.services.Status.OK) {
																									var coords = new daum.maps.LatLng(
																											result[0].y,
																											result[0].x);

																									//지도의 중심을 결과값으로 받은 위치로 이동
																									map
																											.setCenter(coords);

																									//지도에 클릭한 위치에 표출할 마커 생성
																									var marker = new daum.maps.Marker(
																											{
																												image : markerImg, //마커 이미지 설정
																												position : coords
																											});

																									marker
																											.setMap(map); //지도에 마커 표시 

																									//마커 위에 커스텀 오버레이 표시
																									var overlay = new daum.maps.CustomOverlay(
																											{
																												position : marker
																														.getPosition()
																											});

																									//커스텀 오버레이에 표시할 컨텐츠
																									var content = document
																											.createElement('div');
																									content.className = 'wrap';
																									document.body
																											.appendChild(content);

																									var info = document
																											.createElement('div');
																									info.className = 'info';
																									content
																											.appendChild(info);

																									var title = document
																											.createElement('div');
																									title.className = 'title';
																									title
																											.appendChild(document
																													.createTextNode(pinNameList[index]));
																									info
																											.appendChild(title);

																									var closeBtn = document
																											.createElement('button');
																									closeBtn.className = 'close';
																									//커스텀 오버레이 닫기
																									closeBtn
																											.appendChild(document
																													.createTextNode('X'));
																									closeBtn.onclick = function() {
																										overlay
																												.setMap(null);
																									};
																									title
																											.appendChild(closeBtn);

																									var contentBox = document
																											.createElement('div');
																									contentBox.className = 'contentBox';
																									info
																											.appendChild(contentBox);

																									var image = document
																											.createElement('img');
																									image.className = 'imageInfo';
																									image.src = 'resources/img/deliciousPin/'
																											+ photoList[index];
																									image.width = '70';
																									image.height = '73';
																									contentBox
																											.appendChild(image);

																									var desc = document
																											.createElement('div');
																									desc.className = 'desc';
																									contentBox
																											.appendChild(desc);

																									var address = document
																											.createElement('div');
																									address.className = 'address';
																									address
																											.appendChild(document
																													.createTextNode(addressList[index]));
																									desc
																											.appendChild(address);

																									var phone = document
																											.createElement('div');
																									phone.className = 'phone';
																									phone
																											.appendChild(document
																													.createTextNode(phoneList[index]));
																									desc
																											.appendChild(phone);

																									var detail = document
																											.createElement('div');
																									detail.className = 'detail';
																									detail
																											.appendChild(document
																													.createTextNode(detailList[index]));
																									desc
																											.appendChild(detail);

																									//커스텀 오버레이 컨텐츠 담기
																									overlay
																											.setContent(content);

																									//마커 클릭 시, 커스텀 오버레이 표시
																									daum.maps.event
																											.addListener(
																													marker,
																													'click',
																													function() {
																														overlay
																																.setMap(map);
																													});
																								}
																							});
																		});
															});

										},
										error : function(xhr, status, error) {
											alert("에러발생");
										}
									});

						});

		function scrapFunction(deliciousMapNum, memberNum) {
			$.ajax({
				type : 'post',
				url : 'scrapCheck.do',
				data : {
					deliciousMapNum : deliciousMapNum,
					memberNum : memberNum,
					scrapCheck : turn
				},
				success : function(data) {
					if (turn == 0) {
						$('#circle').css('background', 'hotpink');
						turn = 1;

					} else {
						$('#circle').css('background', 'white');
						turn = 0;
					}
				},
				error : function() {
					alert("ajax 에러");
				}

			});
		}

		function memberFunction(memberNum) {
			window.location.href = "${pageContext.request.contextPath}/MydmForm";
		}
	</script>
</body>
</html>

