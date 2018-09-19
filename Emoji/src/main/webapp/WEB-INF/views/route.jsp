<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=377fa9901a70a356db9e8b6e1ab1a3a9"></script>
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
            border-right: 1px solid;
        }
        #container {
        	display:block;
            width: 400px;
            height:200px;
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
            width:400px;
            display:block;
            
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
        
        #map{
        width : 1090px;
        height:500px;
        }
        
        input[type=radio]{
        	margin:10px;
        	
        }
       input[type=text]{
        	margin:10px;
        	width:200px;
        }
        

    </style>
</head>

<body>
    <div id="page">
        <div id="header">
            <div id="headerImg"><a href=""><img url="">header1</a></div>
            <div id="logout">
                <a href="">로그아웃</a></div>
        </div>

        <div id="leftside">
            <div id="container">
                <ul class="tabs">
                    <li class="active" rel="tab1">원정대 검색</li>
                    <li rel="tab2">원정대 만들기</li>
                </ul>
                <div class="tab_container">
                    <div id="tab1" class="tab_content">
                     <div><label><input type="date"/ name="searchDateFrom"></label>~    
                    <label><input type="date"/ name="searchDateTo"></label></div>     
                    <div><label><input type="text"/ placeholder="원정대명,원정대장,해시태그"><button>검색</button></label></div>
     
                    </div>
                    <!-- #tab1 -->
                    <div id="tab2" class="tab_content">
                <div><label><input type="radio" name="searchPool" class="searchPool"/>맛집 검색하기</label></div>
                <div><label><input type="radio" name="searchPool" class="searchPool"/>내 맛집 지도로 경로 만들기</label></div>
                 <div><label><input type="text"/ placeholder="원정대명,원정대장,해시태그"><button>검색</button></label></div>
                </div>
                    <!-- #tab2 -->
                </div>
                

                

                <!-- .tab_container -->
            </div>
            <!-- #container -->
        </div>
        <div id="rightside">
            <div id="righttop">
            <div id="map"></div>
            </div>
            <div id="rightbottom">
                <div id="smallleft"></div>
                <div id="smallright">
                    <table>
                        <tr></tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</body>
<script>
var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
var options = { //지도를 생성할 때 필요한 기본 옵션
	center: new daum.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
	level: 3 //지도의 레벨(확대, 축소 정도)
};

var map = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴
</script>
<script>
$(function () {
    $(".tab_content").hide();
    $(".tab_content:first").show();
    $("ul.tabs li").click(function () {
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