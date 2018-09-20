<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <!DOCTYPE html>
        <html>

        <head>
            <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
            <style>
                body {
                    margin: 3px;
                    padding: 0px;
                }

                #page {
                    width: 1500px;
                    margin: 0 auto;
                    height: 1500px;
                }

                #header {
                    margin: 0px auto;
                    text-align: center;
                }

                #logout {
                    float: right;
                    display: inline;
                }

                #headerImg {
                    display: inline
                }

                #leftside {
                    width: 400px;
                    height: 100%;
                    border: 1px solid #eee;
                    display: inline;
                    float: left;
                }

                #rightside {
                    width: 1090px;
                    height: 1500px;
                    display: inline;
                    float: right;
                    border-bottom: 1px solid;
                }

                #righttop {
                    /*         	border-bottom:1px solid #eee; */
                    border-bottom: 1px solid;
                    height: 500px;
                }

                #smallleft {
                    width: 400px;
                    height: 400px;
                    border-right: 1px solid;
                }

                #smallright {
                    width: 400px;
                    height: 600px;
                    border-right: 1px solid;
                }

                #container {
                    display: block;
                    width: 400px;
                    height: 200px;
                    margin: 0 auto;
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
                    border-bottom: 1px solid;
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
                    height: 500px;
                }

                input[type=radio] {
                    margin: 10px;
                }

                input[type=text] {
                    margin: 10px;
                    width: 200px;
                }

            </style>
        </head>

        <body>
            <div id="page">
                <div id="header">
                    <div id="headerImg">
                        <a href=""><img url="">header1</a>
                    </div>
                    <div id="logout">
                        <a href="">로그아웃</a>
                    </div>
                </div>

                <div id="leftside">
                    <div id="container">
                        <ul class="tabs">
                            <li class="active" rel="tab1">원정대 검색</li>
                            <li rel="tab2">원정대 만들기</li>
                        </ul>
                        <div class="tab_container">
                            <div id="tab1" class="tab_content">
                                <div>
                                    <label><input type="date" / name="searchDateFrom"></label>~
                                    <label><input type="date" / name="searchDateTo"></label>
                                </div>
                                <div>
                                    <label><input type="text" / placeholder="맛집이름,카테고리,상세정보">
								<button onclick="search()">검색</button></label>
                                </div>

                            </div>
                            <!-- #tab1 -->
                            <div id="tab2" class="tab_content">
                                <div>
                                    <label><input type="radio" name="searchPool"
								class="searchPool" />맛집 검색하기</label>
                                </div>
                                <div>
                                    <label><input type="radio" name="searchPool"
								class="searchPool" />내 맛집 지도로 경로 만들기</label>
                                </div>
                                <div>
                                    <label><input type="text" placeholder="맛집이름,카테고리,상세정보"
								name="search">
								<button onclick="search()">검색</button></label>
                                </div>
                            </div>
                            <!-- #tab2 -->
                        </div>
                        <!-- .tab_container -->

                    </div>
                    <div id="searched" ondrop="drop(event)" ondragover="allowDrop(event)"></div>

                    <!-- #container -->
                </div>
                <div id="rightside">
                    <div id="righttop">
                        <div id="map"></div>
                    </div>
                    <div id="rightbottom">
                        <div id="smallleft" ondrop="drop(event)" ondragover="allowDrop(event)"></div>
                        <div id="smallright">
                            <table>
                                <tr></tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </body>
        <c:url var="search1" value="/search"></c:url>
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=377fa9901a70a356db9e8b6e1ab1a3a9&libraries=services"></script>
        <script>
            var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                mapOption = {
                    center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                    level: 3
                    // 지도의 확대 레벨
                };

            //지도를 생성합니다    
            var map = new daum.maps.Map(mapContainer, mapOption);

            //드래그앤 드롭
            function drag(drag) {    
            	//드래그 된 타겟의 아이디를 delicious라는 이름으로 저장해 놓음
                drag.dataTransfer.setData("delicious", drag.target.id);
            }
            
            
            //경로를 만들기 위해서 주소들을 배열에 저장해 놓음
            var addresses=new Array();
            
            function drop(drop) {
                drop.preventDefault();
                //delicious로 저장된 데이터를 가지고옴
                var data = drop.dataTransfer.getData("delicious");
                //해당 데이터의 노드를 카피해서 복사되서 움직일 수 있도록 함
                var copy=document.getElementById(data).cloneNode(true);
                //새로 만든 노드의 아이디는 달라야함
                copy.id="deliciousCopy";
                //복사해서 지정해놓은 곳으로 저장해놓음
                drop.target.appendChild(copy);                
                //data의 값은 1부터 들어가도록 설정해놓았기 때문에 배열안에는 -1을 해서 값을 넣는다.
                addresses[data-1]= $('input[name='+data+']').val();                 
                
                //주소-좌표 변환 객체를 생성합니다
                var geocoder = new daum.maps.services.Geocoder();
                //주소를 좌표로 변환합니다
                geocoder.addressSearch(addresses[data-1],function(result, status) {
                            // 정상적으로 검색이 완료됐으면 
                            if (status === daum.maps.services.Status.OK) {

                                var coords = new daum.maps.LatLng(result[0].y,
                                    result[0].x);

                                // 결과값으로 받은 위치를 마커로 표시합니다
                                var marker = new daum.maps.Marker({
                                    map: map,
                                    position: coords
                                });
                                map.setCenter(coords);  
                            }
                            
                            console.log(addresses);
                            
                            //그 바로 직전의 주소를 변환하기 시작
                            if(data-2>=0){
                            geocoder.addressSearch(addresses[data-2],function(result2, status2) {
                                // 정상적으로 검색이 완료됐으면 
                                if (status2 === daum.maps.services.Status.OK) {
                                    var coords2 = new daum.maps.LatLng(result2[0].y,
                                    		result2[0].x);									
                                }
                                
                             // 선을 구성하는 좌표 배열입니다. 이 좌표들을 이어서 선을 표시합니다
                                var linePath = [
                                	coords2,
                                	coords	                                        
                                ];

                                // 지도에 표시할 선을 생성합니다
                                var polyline = new daum.maps.Polyline({
                                    path: linePath, // 선을 구성하는 좌표배열 입니다
                                    strokeWeight: 5, // 선의 두께 입니다
                                    strokeColor: '#FFAE00', // 선의 색깔입니다
                                    strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
                                    strokeStyle: 'solid' // 선의 스타일입니다
                                });

                                // 지도에 선을 표시합니다 
                                polyline.setMap(map);  
                            });  
                        }
                        });                
            }

            function allowDrop(data) {
                data.preventDefault();
            }

            function search() {
            	//검색을 눌렀을 때 비동기 시작
                $.ajax({
                    type: "get",
                    url: "${search1}",
                    dataType: "json", //json형태로 데이터를 받아옴
                    success: function(data) {
                    	//검색된 맛집 데이터의 이름과 상세정보를 저장할 배열 두개
                        var name = new Array();
                        var detail = new Array();
                        //id를 다르게 하기 위한 변수를 선언
                        var i = 1;
                    	//검색된 맛집이 여러개 일 수 있으므로
                        $.each(data, function(key, value) {
							//데이터 가져오기
                            name = value.deliciousPinName;
                            detail = value.deliciousPinDetail;
                            //검색 결과 영역에 각각 div 형태로 붙여넣기
                            $('#searched')
                                .append(
                                    "<div id='"+i+"' draggable='true' ondragstart='drag(event)'><div >" +i+
                                    name +
                                    "</div>" +
                                    "<div>" +
                                    detail +
                                    "</div></div>" +
                                    "<input name='"+i+"' type='hidden' value='" + value.deliciousPinAddress + "' />");
                            i++;
                        });
                    }
                });
            }

        </script>
        <script>
            //탭메뉴 만들기
            $(function() {
                $(".tab_content").hide();
                $(".tab_content:first").show();
                $("ul.tabs li").click(function() {
                    $("ul.tabs li").removeClass("active").css("color", "#333");
                    //$(this).addClass("active").css({"color": "darkred","font-weight": "bolder"});
                    $(this).addClass("active").css("color", "darkred");
                    $(".tab_content").hide()
                    var activeTab = $(this).attr("rel");
                    $("#" + activeTab).fadeIn()

                });
            });

        </script>

        </html>
