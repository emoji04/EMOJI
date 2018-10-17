<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
request.setCharacterEncoding("utf-8"); 
String certificateKey= request.getParameter("emailKey"); 
String allowedEmail = request.getParameter("allowedEmail");
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>회원가입</title>
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans" rel="stylesheet">
<link href="<c:url value="/resources/css/naverCss.css"/>" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.12.4.js"
	integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU="
	crossorigin="anonymous"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.4.js"></script>

<style>
.bannerdiv {
	margin: 0 auto;
	padding-left: 15px;
}
.naverbanner2 {
	margin: 0 auto;
}
.naverbanner2 > a:visited{
    	color:black;
    	text-decoration:none;
    }
.naverbanner2 > a:link{
    	color:black;
    	text-decoration:none;
    }
.getnum {
	background-color: black;
}

.doregi {
	background-color: black;
}
.disablecol{
	background-color: #EBEBE4;
}
</style>
</head>

<body>
	<div class="mid2">
		<div class="bannerdiv">
			<p class="naverbanner2"><a href="<c:url value='/home'/>">EMOJI</a></p>
		</div>
		<div class="mainarea">


			<form id="register" action="<c:url value='/registe'/>" method="post" onsubmit="return checkValue()" enctype="multipart/form-data">
				<div class="maintext">
					<b>이메일</b>
				</div>
				
				<div class="boxarea" style="background-color: #EBEBE4;">
					<input class="inputfocus" id="idtext" name="memberEmail2" value="<%=allowedEmail %>" style="width: 99%" type="text" disabled="disabled">
				</div>
				<input name="memberEmail" value="<%=allowedEmail %>" style="width: 99%" type="hidden" >
				<div id="idcheck" class="divchk"></div>
				<input type="hidden" id ="emailKey" name="emailKey" value="<%=certificateKey %>">
				
				<div class="maintext">
					<b>비밀번호</b>
				</div>
				
				<div class="boxarea">
					<input class="passwordarea inputfocus" id="pass1" name="memberPassword" type="password" style="width: 99%">
				</div>
				
				<div id="passchk1" class="divchk"></div>
				
				<div class="maintext">
					<b>비밀번호 재확인</b>
				</div>
				
				<div class="boxarea">
					<input class="passwordarea inputfocus" id="pass2" type="password" style="width: 99%">
				</div>
				
				<div id="passchk2" class="divchk"></div>
				
				<div class="maintext">
					<b>이름</b>
				</div>
				
				<div class="boxarea">
					<input class="widthtext inputfocus" id="name" name="memberName" placeholder="이름을 입력 해 주세요." type="text">
				</div>
				
				<div id="namechk" class="divchk"></div>
				
				<div class="maintext">
					<b>성별</b>
				</div>
				<div class="genderarea" style="height: 60px;">
					<input id="manchk" class="genderchkbox" type="radio" name="memberGender"
						value="M"> <label class="genderchk" for="manchk">
						<span>남자</span>
					</label> <input id="womanchk" class="genderchkbox" type="radio"
						name="memberGender" value="woman"> <label class="genderchk"
						for="W"> <span>여자</span>
					</label>
				</div>
				
				<div id="genderchk" class="divchk" ></div>
					
				<div class="maintext">
					<b>휴대전화</b>
				</div>
				
				<div>
					<select name="" class="inputfocus" id="internum">
						<option value="233">가나 +233</option>
						<option value="241">가봉 +241</option>
						<option value="592">가이아나 +592</option>
						<option value="220">감비아 +220</option>
						<option value="502">과테말라 +502</option>
						<option value="1671">괌 +1 671</option>
						<option value="1473">그레나다 +1 473</option>
						<option value="30">그리스 +30</option>
						<option value="224">기니 +224</option>
						<option value="245">기니비사우 +245</option>
						<option value="264">나미비아 +264</option>
						<option value="674">나우루 +674</option>
						<option value="234">나이지리아 +234</option>
						<option value="672">남극,오스트레일리아의외 +672</option>
						<option value="27">남아프리카공화국 +27</option>
						<option value="31">네덜란드 +31</option>
						<option value="599">네덜란드령보네르 +599</option>
						<option value="297">네덜란드령아루바 +297</option>
						<option value="977">네팔 +977</option>
						<option value="47">노르웨이 +47</option>
						<option value="64">뉴질랜드 +64</option>
						<option value="683">뉴질랜드령니우에 +683</option>
						<option value="690">뉴질랜드령토켈라우제도 +690</option>
						<option value="227">니제르 +227</option>
						<option value="505">니카라과 +505</option>
						<option value="82" selected="">대한민국 +82</option>
						<option value="45">덴마크 +45</option>
						<option value="299">덴마크령그린란드 +299</option>
						<option value="298">덴마크령페로제도 +298</option>
						<option value="1809">도미니카공화국 +1 809</option>
						<option value="1829">도미니카공화국 2 +1 829</option>
						<option value="1849">도미니카공화국 3 +1 849</option>
						<option value="49">독일 +49</option>
						<option value="670">동티모르 +670</option>
						<option value="856">라오스 +856</option>
						<option value="231">라이베리아 +231</option>
						<option value="371">라트비아 +371</option>
						<option value="7">러시아/카자흐스탄 +7</option>
						<option value="961">레바논 +961</option>
						<option value="266">레소토 +266</option>
						<option value="40">루마니아 +40</option>
						<option value="352">룩셈부르크 +352</option>
						<option value="250">르완다 +250</option>
						<option value="218">리비아 +218</option>
						<option value="370">리투아니아 +370</option>
						<option value="423">리히텐슈타인 +423</option>
						<option value="261">마다가스카르 +261</option>
						<option value="692">마셜제도공화국 +692</option>
						<option value="691">마이크로네시아연방 +691</option>
						<option value="853">마카오 +853</option>
						<option value="389">마케도니아공화국 +389</option>
						<option value="265">말라위 +265</option>
						<option value="60">말레이시아 +60</option>
						<option value="223">말리 +223</option>
						<option value="52">멕시코 +52</option>
						<option value="377">모나코 +377</option>
						<option value="212">모로코 +212</option>
						<option value="230">모리셔스 +230</option>
						<option value="222">모리타니아 +222</option>
						<option value="258">모잠비크 +258</option>
						<option value="382">몬테네그로 +382</option>
						<option value="373">몰도바 +373</option>
						<option value="960">몰디브 +960</option>
						<option value="356">몰타 +356</option>
						<option value="976">몽골 +976</option>
						<option value="1">미국/캐나다 +1</option>
						<option value="1670">미국령북마리아나제도 +1 670</option>
						<option value="95">미얀마 +95</option>
						<option value="678">바누아투 +678</option>
						<option value="973">바레인 +973</option>
						<option value="1246">바베이도스 +1 246</option>
						<option value="1242">바하마 +1 242</option>
						<option value="880">방글라데시 +880</option>
						<option value="229">베냉 +229</option>
						<option value="58">베네수엘라 +58</option>
						<option value="84">베트남 +84</option>
						<option value="32">벨기에 +32</option>
						<option value="375">벨라루스 +375</option>
						<option value="501">벨리즈 +501</option>
						<option value="387">보스니아헤르체고비나 +387</option>
						<option value="267">보츠와나 +267</option>
						<option value="591">볼리비아 +591</option>
						<option value="257">부룬디 +257</option>
						<option value="226">부르키나파소 +226</option>
						<option value="975">부탄 +975</option>
						<option value="359">불가리아 +359</option>
						<option value="55">브라질 +55</option>
						<option value="673">브루나이 +673</option>
						<option value="685">사모아 +685</option>
						<option value="966">사우디아라비아 +966</option>
						<option value="378">산마리노 +378</option>
						<option value="239">상투메프린시페 +239</option>
						<option value="221">세네갈 +221</option>
						<option value="381">세르비아 +381</option>
						<option value="248">세이셀 +248</option>
						<option value="1784">세인트빈센트그레나딘 +1 784</option>
						<option value="252">소말리아 +252</option>
						<option value="677">솔로몬제도 +677</option>
						<option value="249">수단 +249</option>
						<option value="597">수리남 +597</option>
						<option value="94">스리랑카 +94</option>
						<option value="268">스와질랜드 +268</option>
						<option value="46">스웨덴 +46</option>
						<option value="41">스위스 +41</option>
						<option value="34">스페인 +34</option>
						<option value="421">슬로바키아 +421</option>
						<option value="386">슬로베니아 +386</option>
						<option value="963">시리아 +963</option>
						<option value="232">시에라리온 +232</option>
						<option value="65">싱가포르 +65</option>
						<option value="971">아랍에미리트 +971</option>
						<option value="374">아르메니아 +374</option>
						<option value="54">아르헨티나 +54</option>
						<option value="1684">아메리칸사모아 +1 684</option>
						<option value="354">아이슬란드 +354</option>
						<option value="509">아이티 +509</option>
						<option value="353">아일랜드 +353</option>
						<option value="994">아제르바이잔 +994</option>
						<option value="93">아프가니스탄 +93</option>
						<option value="376">안도라 +376</option>
						<option value="355">알바니아 +355</option>
						<option value="213">알제리 +213</option>
						<option value="244">앙골라 +244</option>
						<option value="251">에디오피아 +251</option>
						<option value="291">에리트레아 +291</option>
						<option value="372">에스토니아 +372</option>
						<option value="593">에콰도르 +593</option>
						<option value="503">엘살바도르 +503</option>
						<option value="44">영국 +44</option>
						<option value="290">영국령세인트헬레나 +290</option>
						<option value="246">영국령인도양지역 +246</option>
						<option value="350">영국령지브롤터 +350</option>
						<option value="500">영국령포클랜드제도 +500</option>
						<option value="967">예멘 +967</option>
						<option value="968">오만 +968</option>
						<option value="43">오스트리아 +43</option>
						<option value="504">온두라스 +504</option>
						<option value="962">요르단 +962</option>
						<option value="256">우간다 +256</option>
						<option value="598">우루과이 +598</option>
						<option value="998">우즈베키스탄 +998</option>
						<option value="380">우크라이나 +380</option>
						<option value="964">이라크 +964</option>
						<option value="98">이란 +98</option>
						<option value="972">이스라엘 +972</option>
						<option value="20">이집트 +20</option>
						<option value="39">이탈리아 +39</option>
						<option value="91">인도 +91</option>
						<option value="62">인도네시아 +62</option>
						<option value="81">일본 +81</option>
						<option value="1876">자메이카 +1 876</option>
						<option value="260">잠비아 +260</option>
						<option value="240">적도기니 +240</option>
						<option value="995">조지아 +995</option>
						<option value="86">중국 +86</option>
						<option value="236">중앙아프리카공화국 +236</option>
						<option value="253">지부티 +253</option>
						<option value="263">짐바브웨 +263</option>
						<option value="235">차드 +235</option>
						<option value="420">체코 +420</option>
						<option value="56">칠레 +56</option>
						<option value="237">카메룬 +237</option>
						<option value="238">카보베르데 +238</option>
						<option value="974">카타르 +974</option>
						<option value="855">캄보디아왕국 +855</option>
						<option value="254">케냐 +254</option>
						<option value="269">코모로,마요트 +269</option>
						<option value="506">코스타리카 +506</option>
						<option value="225">코트디부아르 +225</option>
						<option value="57">콜롬비아 +57</option>
						<option value="242">콩고 +242</option>
						<option value="243">콩고민주공화국 +243</option>
						<option value="53">쿠바 +53</option>
						<option value="965">쿠웨이트 +965</option>
						<option value="682">쿡제도 +682</option>
						<option value="385">크로아티아 +385</option>
						<option value="996">키르기스스탄 +996</option>
						<option value="686">키리바시 +686</option>
						<option value="357">키프로스 +357</option>
						<option value="886">타이완 +886</option>
						<option value="992">타지키스탄 +992</option>
						<option value="255">탄자니아 +255</option>
						<option value="66">태국 +66</option>
						<option value="90">터키 +90</option>
						<option value="228">토고 +228</option>
						<option value="676">통가 +676</option>
						<option value="993">투르크메니스탄 +993</option>
						<option value="216">튀니지 +216</option>
						<option value="1868">트리니다드토바고 +1 868</option>
						<option value="507">파나마 +507</option>
						<option value="595">파라과이 +595</option>
						<option value="92">파키스탄 +92</option>
						<option value="675">파푸아뉴기니 +675</option>
						<option value="680">팔라우 +680</option>
						<option value="970">팔레스타인 +970</option>
						<option value="51">페루 +51</option>
						<option value="351">포르투갈 +351</option>
						<option value="48">폴란드 +48</option>
						<option value="1787">푸에르토리코 +1 787</option>
						<option value="33">프랑스 +33</option>
						<option value="590">프랑스령과들루프 +590</option>
						<option value="594">프랑스령기아나 +594</option>
						<option value="687">프랑스령뉴칼레도니아 +687</option>
						<option value="262">프랑스령레위니옹 +262</option>
						<option value="596">프랑스령마르티니크 +596</option>
						<option value="508">프랑스령생피에르미클롱 +508</option>
						<option value="681">프랑스령월리스푸투나제 +681</option>
						<option value="689">프랑스령폴리네시아 +689</option>
						<option value="679">피지 +679</option>
						<option value="358">핀란드 +358</option>
						<option value="63">필리핀 +63</option>
						<option value="36">헝가리 +36</option>
						<option value="61">호주 +61</option>
						<option value="852">홍콩 +852</option>
						<script>
							var internum = [ "가나 +233", "멕시코 +52", "대한민국 +82",
									"미국/캐나다 +1", "영국 +44", "이렇게는 +998",
									"노가다자나 +999" ]
							for (i = 0; i < internum.length; i++) {
								document.write("<option>" + internum[i]
										+ "</option>");
							}
						</script>
					</select>
				</div>

				<div id="getnumtext">
					<input class="widthtext inputfocus" id="phone" name="memberPhoneNum" type="text" placeholder="(-)을 제외하고 휴대폰번호를 입력 해 주세요.">
				</div>
				
				<div class="getnum">
					<input type="button" class="getnum" id="getnum" value="인증번호 받기">
				</div>
				
				<div class="boxarea disablecol" >
					<input class="widthtext inputfocus" type="text" id="chkNum" placeholder="인증번호 4자리를 입력하세요" disabled="disabled">
				</div>
				<div id="phoneindenti" class="divchk"></div>
				<div>
					<input class="doregi" type="submit" value="가입하기" id="registerBtn" >
				</div>
			</form>
			<ul class="ul2">
				<li><a href="#">이용약관</a></li>
				<li><a href="#"><b>개인정보처리방침</b></a></li>
				<li><a href="#">책임의 한계와 법적고지</a></li>
				<li style="border-right: none;"><a href="#">회원정보 고객센터</a></li>
			</ul>


		</div>
	</div>

	<script>
		/* 이메일 형식 정규식 */
		function emailcheck(strValue){
			var regExp = /[0-9a-zA-Z][_0-9a-zA-Z-]*@[_0-9a-zA-Z-]+(\.[_0-9a-zA-Z-]+){1,2}$/;
			//입력을 안했으면
			if(strValue.lenght == 0) {
				return false;
			}
			//이메일 형식에 맞지않으면
			if (!strValue.match(regExp)) {
				return false;
			}
			else
				return true;
		}
	
		/*비밀번호 정규식*/
		function chkPwd(str){
		    var reg_pwd = /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
		    if(reg_pwd.test(str)){
		        return true;
		    }
		    else
		    	return false;
		} 

		$(document).ready(
				function() {
					
					//이메일 인증 단계를 안걷쳤거나 인증 후 한시간이 지났을 때.
					if($('#emailKey').val()== "null"){
						alert('이메일 인증 후 한 시간이 지났거나  잘못된 접근입니다. ')
						document.location.href = "home";
					};
					
					$('.boxarea, #getnumtext').click(function() {
						$(this).children('input').focus();
						$(this).css("border-color", "green")
					});
					
					$('.boxarea, #getnumtext').focusin(function() {
						$(this).css("border-color", "green")
					});
					
					$('.boxarea, #getnumtext').focusout(function() {
						$(this).css("border-color", "#DADADA");

						/*              이건 input 하나 빠져나가는데 멘트 다  튀어 나오게
						 if($(this).children('input').val()==$("#idtext").val()){
						 if($("#idtext").val()==''){
						 $('#idcheck').text('필수항목 입니다.').css("color","red");
						 }else{
						 $('#idcheck').text('멋진 아이디 입니다!').css("color","green");
						 }  ......................
						 }; */

					});

					$('#idtext').focusout(
							function() {
								if ($("#idtext").val() == '') {
									$('#idcheck').text('필수항목 입니다.').css("color", "red");
								} else { 
									if(emailcheck($("#idtext").val())){
										var email = $('#idtext').val();
										
										$.ajax({
											type : 'POST',
											url : '<c:url value='/regicheck.json'/>',
											data : 'email=' + email,
											dataType: 'text',
											success : function(data) {
												console.log(data);
												if (data == "possibleRegi") {
													$('#idcheck').text('멋진 아이디 입니다!').css("color", "green");
												}
											}
										});
									} else{
										$('#idcheck').text('올바르지 않은 이메일 형식 입니다.').css("color", "red");
									}
								}
							});

					$('#pass1').focusout(
							function() {
								if ($('#pass1').val() == '') {
									$('#passchk1').text('필수항목 입니다.').css("color", "red");
								} else {
									if (chkPwd($.trim($('#pass1').val()))) {
										$('#passchk1').text('안전한 비밀번호 입니다.').css("color", "green");
									} else {
										$('#passchk1').text('영문과 숫자를 혼합하여 6~12자리의 비밀번호를 입력해 주세요.').css("color", "red");
								}
							}
					});
					
					$('#pass2').focusout(
							function() {
								if ($('#pass2').val() != $('#pass1').val()) {
									$('#passchk2').text('비밀번호가 일치하지 않습니다.').css("color", "red");
								} else{
									$('#passchk2').text('비밀번호가 일치합니다.').css("color", "green");
								if ($('#pass2').val().length == 0){
									$('#passchk2').text('필수 입력사항입니다.').css("color", "red");
								}
							}
					});
					
					$('#name').focusout(function(){
						var name = $(this).val();
						
						if(name.length == 0)
							$('#namechk').text('필수 입력사항입니다.').css('color', 'red');
						else
							$('#namechk').text(name + '님 반갑습니다').css('color', 'green');
					});
					
					$('.genderchkbox').click(function(){
						var gender =  $(':radio[name=memberGender]:checked').val();
						
						if(gender != null)
							$('#genderchk').text('').css('color', 'red');
						else
							$('#genderchk').text('필수 입력사항입니다.').css('color', 'red');
					});
					
					
					$('#getnum').click(function(){
						var phone = $('#phone').val();
						if(phone.length != 0){
							$('#chkNum').removeAttr("disabled");
							$('.disablecol').css('background-color', 'white');}
					});
					
					$('#chkNum').focusout(function(){
						if($('#chkNum').val().length == 0){
							$('#phoneindenti').text('휴대폰 인증을 해주세요').css('color', 'red');
						}else{
							$('#phoneindenti').text('휴대폰 인증이 완료되었습니다').css('color', 'green');
							}
					});
					
					
					
				});
		
		//가입 버튼 눌렀을때
 		function checkValue() {
 			var email = $('#idtext').val();
			var pass = $('#pass1').val();
			var pass2 = $('#pass2').val();
			var name = $('#name').val(); 			
			var gender = $(':radio[name=memberGender]:checked').val();
			var gender2 = $(':radio[name=memberGender]:checked');
			

			if (pass.length == 0) {
				$('#passchk1').text('필수항목 입니다.').css("color", "red");
			} else {
				if (chkPwd($.trim($('#pass1').val()))) {
					$('#passchk1').text('안전한 비밀번호 입니다.').css("color", "green");
				} else {
					$('#passchk1').text('영문과 숫자를 혼합하여 6~12자리의 비밀번호를 입력해 주세요.').css("color", "red");
				}
			};
			if (pass != pass2) {
				$('#passchk2').text('비밀번호가 일치하지 않습니다.').css("color", "red");
			} else{
				if(pass2.length == 0){
					$('#passchk2').text('필수 입력사항입니다.').css('color', 'red');
				}else{
				$('#passchk2').text('비밀번호가 일치합니다.').css("color", "green");
				}
			};
			if(name.length == 0)
				$('#namechk').text('필수 입력사항입니다.').css('color', 'red');
			else
				$('#namechk').text(name + '님 반갑습니다').css('color', 'green');
			if($('#chkNum').val().length == 0)
				$('#phoneindenti').text('휴대폰 인증을 해주세요').css('color', 'red');
			if (gender == null) {
				$('#genderchk').text('필수 입력사항입니다.').css('color', 'red');
				return false;
			} else{
				$('#genderchk').text('').css('color', 'red');
			};
			if ($('#passchk1').text() != '안전한 비밀번호 입니다.') {
				return false;
			};
			if ($('#passchk2').text() != '비밀번호가 일치합니다.') {
				return false;
			};
			if ($('#phoneindenti').text() != '휴대폰 인증이 완료되었습니다'){
				return false;
			};
			if ($('#namechk').text() == '필수 입력사항입니다.') {
				return false;
			};
		} 
	</script>
</body>
</html>