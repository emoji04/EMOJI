<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=377fa9901a70a356db9e8b6e1ab1a3a9"></script>
    <style>
        body{
            margin: 3px;
            padding:0px;
        }
        #page {
            width: 100%;
            margin: 10px auto;
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
        #leftside{
            width: 300px;
        }

        ul.tabs {
            margin: 0;
            padding: 0;
            float: left;
            list-style: none;
            height: 32px;
            border-bottom: 1px solid #eee;
            border-left: 1px solid #eee;
            width: 100%;
            font-family: "dotum";
            font-size: 12px;
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
            border-bottom: 1px solid #FFFFFF;
            clear: both;
            float: left;
            width: 248px;
            background: #FFFFFF;
        }

        .tab_content {
            padding: 5px;
            font-size: 12px;
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

        ;
        #container {
            width: 249px;
            margin: 0 auto;
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
                        <ul>
                            <li><a href="#">이것은 두 번째 탭의</a>
                            </li>
                            <li><a href="#">이것은 두 번째 탭의</a>
                            </li>
                            <li><a href="#">이것은 두 번째 탭의</a>
                            </li>
                            <li><a href="#">이것은 두 번째 탭의</a>
                            </li>
                            <li><a href="#">이것은 두 번째 탭의</a>
                            </li>
                        </ul>
                    </div>
                    <!-- #tab1 -->
                    <div id="tab2" class="tab_content">
                            <li><a href="#">이것은 두 번째 탭의</a>
                            </li>
                            <li><a href="#">이것은 두 번째 탭의</a>
                            </li>
                            <li><a href="#">이것은 두 번째 탭의</a>
                            </li>
                            <li><a href="#">이것은 두 번째 탭의</a>
                            </li>
                            <li><a href="#">이것은 두 번째 탭의</a>
                            </li>
                            </div>
                    <!-- #tab2 -->
                </div>
                <!-- .tab_container -->
            </div>
            <!-- #container -->



        </div>
        <div id="rightside">
            <div id="righttop">
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