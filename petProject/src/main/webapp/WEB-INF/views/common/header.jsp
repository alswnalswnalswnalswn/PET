<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<title>Document</title>
<style>
    div {
        box-sizing: border-box;
    }
    * {
        box-sizing: border-box;
    }
    #header{
        width: 1200px;
        height: 260px;
        margin: auto;
    }
    #header1{
        width: 1200px;
        height: 140px;
        float: left;
        position: relative;
        border-bottom: 2px solid rgb(230, 230, 230)
    }
    #logo{
        width: 150px;
        height: 100px;
        float: left;
        padding-top: 30px;
    }
    #header1 > *{
        float: left;
    }
    #search_form{
        margin: auto;
        position: absolute;
        left: 50%;
        top: 60%;
        transform: translate(-50%, -50%);
    }
    #in_text{
        width: 380px;
        height: 50px;
        border-radius: 10px;
        border: 1px solid rgb(179, 179, 179);
        margin: 0;
        padding: 0;
    }
    #search_img{
        width: 40px;
        height: 40px;
        color: rgb(204, 204, 204);
        margin-left: 10px;
    }
    #menubar{
        width: 310px;
        height: 140px;
        float: right;
    }
    #navigator{
        width: 1200px;
        height: 120px;
        font-size: 24px;
        font-weight: bold;
    }
    #navi{
        list-style: none;
        height: 100%;
    }
    #navi>li{
        float: left;
        width: 16%;
        height: 100%;
        text-align: center;
    }
    #navi a{
        text-decoration: none;
        color: rgba(122, 88, 33, 0.92);
        font-weight: 700;
        width: 100%;
        height: 100%;
        display: block;
        line-height: 100px;
    }
    #loginMenu{
    	float:left;
    	padding-top:23%;
    	width:30%;
		height:100%;
    }
    #menubarItem{
    	float:left;
    	padding-top:25%;
    	width:70%;
		height:100%;
    }
    #menubarItem img{
    	width:100%;
    	height:100%;
    }
    #navi a:hover{
        font-size: 25px;
        color: rgba(196, 132, 30, 0.92);
    }
    
    #navi2{
        list-style: none;
        float: left;
    }

    #loginForm{
    	display: none;
    	background-color:rgb(233, 231, 231);
    	border-radius: 25px;
    }
    #loginForm a{
    	color: black;
    	text-align: center;
    }
    #login-area{
    	width:100%;
    	height:500px;
    	padding:0px 100px;
    }
    #login-area input{
   	    border: none;
	    box-shadow: none;
	    padding: 12px 16px;
	    width: 100%;
	    line-height: 1.2;
    }
    #login-area .brt{
    	margin-top: -1px;
    }
    #login-area .input_form{
    	border: 1px solid #e0e0e0;
	    background: #fff;
	    border-top: 1px solid #e0e0e0;
	    box-sizing: border-box;
	    position: relative;
    }
    .input_btn{
    	margin-top: 20px;
    }
    .input_btn2{
    	margin-top: 50px;
    }
    #login-btn{
    	width: 100%;
	    height: 40px;
	    font-size: 14px;
	    border-radius: 10px;
	    background-color: rgb(94, 87, 59);
	    color:white;
	    font-weight: bold;
    }
    #logout_btn > img{
    	width: 35px;
    	height:35px;
    	margin-top : 2px;
    }
    #join-btn{
    	width: 100%;
	    height: 40px;
	    font-size: 14px;
	    border-radius: 10px;
	    background-color: rgb(94, 87, 59);
	    color:white;
	    font-weight: bold;
    }
    #join-area input{
   	    border: none;
	    box-shadow: none;
	    padding: 12px 16px;
	    width: 100%;
	    line-height: 1.2;
    }
    
    #join-area .input_form{
    	border: 1px solid #e0e0e0;
	    background: #fff;
	    border-top: 1px solid #e0e0e0;
	    box-sizing: border-box;
	    position: relative;
	    margin-bottom:15px;
    }
    .danger{
    	display:block;
    	position:absolute;
    	bottom:-17px;
    	font-size:10px;
    	left:10px;
    }
    .animalList{
    	width:450px;
    	height:100px;
    	margin:auto;
    }
    .animal{
    	width:70px;
    	height:25px;
    	border-radius : 30px;
	    display: inline-block;
	    padding: 10px;
	    cursor: pointer;
	    font-size:13px;
	    text-align:center;
	    line-height:0;
	    border:1px solid black;
	    font-weight:bold;
    }
	.clicked {
	  	background-color: rgba(242, 189, 108, 0.82);
	    color:white;
    	border:0;
    	font-weight:bold;
	}
	#join-area input{
		border : none;
		outline:none;
		border-radius : 15px;
	}
	#join-area .input_form{
		border-radius : 15px;
		position : relative;
	}
	.check{
		position : absolute;
		right : 0;
		width: 30px;
		height : 30px;
		margin : 7px 10px;
	}
	.checkPwd{
		position : absolute;
		right : 0;
		width: 30px;
		height : 30px;
		margin : 7px 10px;
	}
	#login{
		line-height:100px;
	}
	#join{
		line-height:100px;
	}
	.checkNick{
		position : absolute;
		right : 0;
		width: 30px;
		height : 30px;
		margin : 7px 10px;
	}
	.checkPhone{
		position : absolute;
		right : 0;
		width: 30px;
		height : 30px;
		margin : 7px 10px;
	}
	.checkEmail{
		position : absolute;
		right : 0;
		width: 30px;
		height : 30px;
		margin : 7px 10px;
	}
	.emailCode{
		position : absolute;
		right : 0;
		width: 30px;
		height : 30px;
		margin : 7px 10px;
	}
	#insertMail{
		position : relative;
		height : 50px;
		top : 10px;
		margin : auto;
	}
	#checkMyEmail, #checkMyOneEmail{
		position : absolute;
		width:100px;
		height:30px;
		font-size:15px;
		display:block;
		right : 0;
		border:0;
		background-radius : 10px;
		box-shadow : 1px 1px 2px;
		background-color: rgba(242, 189, 108, 0.82);
		color: white;
	}
	#checkMyEmail:hover, #checkMyOneEmail:hover{
		cursor : pointer;
		font-size:16px;
	}
	.input_code{
		width: 300px;
		height:100px;
		border-radius:10px;
	}
	.input_code > #emailCode{
		border:1px solid rgb(230, 230, 230);
		float:left;
	}
	#kakaologin{
		width:265px;
		border-radius:10px;
		cursor: pointer;	
	}
	.animalList > label{
		cursor:pointer;
    	width:70px;
    	height:25px;
    	border-radius : 30px;
	    display: inline-block;
	    padding: 10px;
	    cursor: pointer;
	    font-size:13px;
	    text-align:center;
	    line-height:0;
	    border:1px solid black;
	    font-weight:bold;
	}
	.checked{
		background-color: rgba(122, 88, 33, 0.92);
	}
	.select_btn{
		text-align : center;
		font-size : 15px;
		position : relative;
		width : 240px;
		margin : auto;
	}
	.select_btn a {
		color: black;
	}
	#searchId{
		position : absolute;
		font-size : 15px;
		left : 0;
		top:5px;
	}
	#searchPwd{
		position : absolute;	
		font-size : 15px;
		right : 0;
		top:5px;
	}
	#btn_search{
		width :100px;
	}
</style>
</head>
<body>
<script>
</script>

	<c:if test="${ not empty alertMsg }">
		<script>
			alert('${alertMsg}');
		</script>	
		<c:remove var="alertMsg" scope="session" />
	</c:if>
	<c:set var="loginUser" value="${ sessionScope.loginUser }" scope="session" />
    <div id="header">
        <div id="header1">
            <div id="logo"><img src="resources/img/logo.png" alt="로고" width="150px" height="100px" onclick="location.href='${ pageContext.request.contextPath}'"></div>
            <div id="search_form">
                <form action="#">
                    <input type="text" name="query" id="in_text" placeholder="  검색어를 입력하세요">
                    <img src="resources/img/searchform.png" alt="" id="search_img">
                </form>
            </div>
            <div id="menubar">
            	<div id="loginMenu">
            		<ul class="nav flex-column"id="loginForm">
            			<li class="nav-item"  >
            				<a class="nav-link" style="padding:.2rem .5rem;" href="#" data-toggle="modal" data-target="#mylogin">로그인</a>
            			</li>
            			<li class="nav-item">
            				<a class="nav-link" style="padding:.2rem .5rem;" href="#"  data-toggle="modal" data-target="#myjoin">회원가입</a>
            			</li>
            		</ul>
            	</div>
            	
            	<div id="menubarItem">
            		<ul class="nav nav-pills nav-justified">
            		<c:choose>
            		<c:when test='${ loginUser ne null and loginUser.getMemberStatus().equals("C") }' >
    					<li class="nav-item">
    						<a class="nav-link" href="member/logout" id="logout_btn"><img src="resources/img/logout.png" alt=""></a>
    					</li>
    				</c:when>
    				<c:otherwise>
   						<li class="nav-item">
    						<a class="nav-link" href="#" id="login_btn"><img src="resources/img/login.png" alt=""></a>
    					</li>
    				</c:otherwise>
    				</c:choose>
    					<li class="nav-item">
      						<a class="nav-link" href="#"><img src="resources/img/mypage.png" alt=""></a>
    					</li>
    					<li class="nav-item">
      						<a class="nav-link" href="#"><img src="resources/img/cart.png" alt=""></a>
    					</li>
  					</ul>
            	</div>
                
            </div>
        </div>
        <script>
            	$(() => {
					$('#login_btn').click(()=>{
						const display = $('#loginForm').css('display');
						if(display === 'block'){
							$('#loginForm').css('display','none');
						}
						else{
							$('#loginForm').css('display','block');
						}
						
					});   
            	});
       	</script>
        <div id="navigator">
            <ul id="navi">
                <li><a href="community">커뮤니티</a></li>
                <li><a href="#">지식</a></li>
                <li><a href="#">쇼핑</a></li>
                <li><a href="info">데이트</a></li>
                <li><a href="hospital">동물병원</a></li>
                <li><a href="#">공지사항</a></li>
            </ul>
        </div>
    </div>
    
    
	<div class="modal fade" id="mylogin">
		  <div class="modal-dialog modal-dialog-centered">
			    <div class="modal-content">
		  
			  <!-- Modal body -->
		        <div class="modal-body">
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		        <h3 align="center" id="login">로그인</h3>
		      
		      
				<div id="login-area">
					<form action="member/login" method="post">
						<div class="input_form">
							<input type="text" name="memberId" placeholder="아이디를 입력해주세요">
						</div>
						<div class="input_form brt">
							<input type="password" name="memberPwd" placeholder="비밀번호를 입력해주세요">
							</div>
						<div class="select_btn">
							<a href="" id="searchId" data-toggle="modal" data-target="#searchMyId" class="close" data-dismiss="modal">아이디 찾기</a>
							<span id="btn_search">/</span>
							<a href="" id="searchPwd" data-toggle="modal" data-target="#searchMyPwd" class="close" data-dismiss="modal">비밀번호 찾기</a>
						</div>
						<div class="input_btn">
							<a id="kakao-login-btn"><img src="resources/img/kakao_login.png" alt="카카오 로그인" id="kakaologin"></a>
							<button type="submit" id="login-btn" class="btn">로그인</button>
						</div>
					</form>
				</div>
				</div>
			</div>
		</div>
	</div>     		
	<script>
		$(() => {
			
			$('#kakao-login-btn').click(() => {
				location.href='https://kauth.kakao.com/oauth/authorize?client_id=bf4263613861b95f8402b64976c94858&redirect_uri=http://localhost:7777/pet/member/code&response_type=code&scope=profile_image,profile_nickname';
			});
		});
		
	</script>		
	
	
	<div class="modal fade" id="searchMyId">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
			
			<!-- Modal body -->
			<div class="modal-body">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h3 align="center" id="login">아이디찾기</h3>
			    
			    
			<div id="login-area">
				<form action="member/searchId" method="post">
					<div class="input_form">
						<input type="text" name="memberName" placeholder="성함을 입력해주세요">
					</div>
					<div class="input_form">
						<input type="text" name="email" placeholder="이메일을 입력해주세요">
					</div>
					<div id="insertMail">
						<button type="button" id="checkMyEmail">이메일 인증</button>
					</div>
					<div class="input_btn">
						<button type="submit" id="login-btn" class="btn">아이디 찾기</button>
					</div>
				</form>
			</div>
			</div>
			</div>
		</div>
	</div>   
	
	<div class="modal fade" id="searchMyPwd">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
			
			<!-- Modal body -->
			<div class="modal-body">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h3 align="center" id="login">비밀번호 찾기</h3>
			    
			    
			<div id="login-area">
				<form action="member/searchPwd" method="post">
					<div class="input_form">
						<input type="text" name="memberId" placeholder="아이디를 입력해주세요">
					</div>
					<div class="input_form">
						<input type="text" name="email" placeholder="이메일을 입력해주세요">
					</div>
					<div id="insertMail">
						<button type="button" id="checkMyEmail">이메일 인증</button>
					</div>
					<div class="input_btn">
						<button type="submit" id="login-btn" class="btn">비밀번호 찾기</button>
					</div>
				</form>
			</div>
			</div>
			</div>
		</div>
	</div>
	
	
	 
          		
<div class="modal fade" id="myjoin">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
        
        <!-- Modal body -->
        <div class="modal-body">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h3 align="center" id="join">회원가입</h3>
        
		<div id="join-area">
			<form action="member/join" method="post">
			<input type="hidden" name="code" id="myCode">
				<div class="input_form">
					<input type="text" id="memberId" name="memberId" maxlength="10" placeholder="아이디를 입력해주세요 (3~10 영/숫자)" required>
					<div id="checkId" class="danger" style="font-size:0.7em; display:none;"></div>
					<img src="resources/img/check.png" class="check" style="display:none;">
				</div>
					
					
				<div class="input_form">
					<input type="text" id="memberPwd1" name="memberPwd" maxlength="16" placeholder="비밀번호를 입력해주세요 (4~15 영/숫자)" required>
				</div>
				<div class="input_form">
					<input type="text" id="memberPwd2" maxlength="16" placeholder="비밀번호를 한번 더 입력해주세요" required>
					<div id="checkPwd" class="danger" style="font-size:0.7em; display:none;"></div>
					<img src="resources/img/check.png" class="checkPwd" style="display:none;">
				</div>
					<span class="danger_pwd"></span>
				<div class="input_form">
					<input type="text" name="memberName" maxlength="10" placeholder="성함을 입력해주세요">
				</div>
				<div class="input_form">
					<input type="text" id="nickname" name="nickname" maxlength="30" placeholder="닉네임을 입력해주세요" required>
					<div id="checkNick" class="danger" style="font-size:0.7em; display:none;"></div>
					<img src="resources/img/check.png" class="checkNick" style="display:none;">
				</div>
				<div class="input_form">
					<input type="text" id="phone" name="phone" maxlength="13" placeholder="'-' 를 포함한 전화번호를 입력해주세요" required>
					<div id="checkPhone" class="danger" style="font-size:0.7em; display:none;"></div>
					<img src="resources/img/check.png" class="checkPhone" style="display:none;">
				</div>
				<div class="input_form">
					<input type="text" id="email" name="email" maxlength="30" placeholder="이메일을 입력해주세요" required>
					<div id="checkEmail" class="danger" style="font-size:0.7em; display:none;"></div>
					<img src="resources/img/check.png" class="checkEmail" style="display:none;">
					<button type="button" id="checkMyEmail">이메일 인증</button>
				</div>
				<div class="input_code" style="font-size:15px; display:none;">
					&nbsp;&nbsp;인증번호를 입력하세요 <input type="text" name="emailCode" id="emailCode">
					&nbsp;&nbsp;<button type="button" id="checkEmailCode">인증하기</button>
				</div>
					
				<div class="animalList"><span><small>추천 받을 동물을 고르세요 (선택)</small></span><br><br>
					<input type="hidden" name="animalList" value="" >
					<label for="animaldog"><input type="checkbox" class="animal" name="animal" value="A1" id="animaldog" style="display:none;">강아지</label>
					<label for="animalcat"><input type="checkbox" class="animal" name="animal" value="A2" id="animalcat" style="display:none;">고양이</label>
					<label for="animalrab"><input type="checkbox" class="animal" name="animal" value="A3" id="animalrab" style="display:none;">토끼</label>
					<label for="animalfish"><input type="checkbox" class="animal" name="animal" value="A4" id="animalfish" style="display:none;">물고기</label>
					<label for="animalbird"><input type="checkbox" class="animal" name="animal" value="A5" id="animalbird" style="display:none;">새</label>
					<label for="animalham"><input type="checkbox" class="animal" name="animal" value="A6" id="animalham" style="display:none;">햄스터</label>
				</div>
				<div class="input_btn2"><button type="submit" id="join-btn" class="btn">회원가입</button></div>
		    </form>	
		</div>
	        
		</div>
		</div>
	</div>
</div>


	<script>
	var code = "";
	var animalList = [];
	 $(() => {
		$(document).ready(function(){
		   $('.animal').change(function() {
		        var animalList = [];

		        $('.animal:checked').each(function() {
        	  		$(this).addClass('clicked');
		        	animalList.push($(this).val());
		        	console.log(animalList);
		        });
		        	$('input[name=animalList]').val(animalList.join(','));
		        	console.log($('input[name=animalList]').val());
			});
		})
		
		<!------------ 아이디 ------------>
		
		const $userId = $('.input_form #memberId');
		const $checkId = $('#checkId');
		const $joinBtn = $('#join-btn');
		const $check = $('.check');
		
		$userId.keyup(function(){
			
			if($userId.val().length > 4){
				$.ajax({
					url : 'member/idCheck',
					data : {checkId : $userId.val()},
					success : function(result){
    					if(result.substr(4) == "N"){
    						$checkId.show().css('color', 'crimson').text('중복된 아이디입니다.');
    						$userId.css('border', '1px solid crimson');
    						$joinBtn.attr('disabled', true);
    					} else{
    						$userId.css('border', '1px solid lightgreen');
    						$check.show().css();
    						$joinBtn.removeAttr('disabled');
    					}
    				},
    				error : function(){
    					console.log('아이디 중복체크용 AJAX 통신 실패~');
    				}
    			});
			} else {
				$checkId.hide();
				$joinBtn.attr('disabled', true);
			}
		});
		
		<!------------ 비밀번호 ------------>
		
		$(document).ready(function() {
		    // 비밀번호 입력란의 입력을 감지하는 이벤트 핸들러
		    $('.input_form #memberPwd1, .input_form #memberPwd2').on('input', function() {
		        const $userPwd1 = $('.input_form #memberPwd1');
		        const $userPwd2 = $('.input_form #memberPwd2');
		        const $checkPwd = $('#checkPwd');
		        const $checkP = $('.checkPwd');
		        const $joinBtn = $('#joinBtn');
		        
		        // 비밀번호 길이가 4자 이상인지 확인
		        if ($userPwd1.val().length >= 4 && $userPwd2.val().length >= 4) {
		        	
		            if ($userPwd1.val() === $userPwd2.val()) { // 비밀번호가 일치하는지 확인
		                $userPwd1.css('border', '1px solid lightgreen');
		                $userPwd2.css('border', '1px solid lightgreen');
		                $checkP.show().css();
		                $joinBtn.removeAttr('disabled');
		                $check.show().css();
		            } else {
		                $checkPwd.show().css('color', 'crimson').text('비밀번호가 일치하지 않습니다.');
		                $userPwd1.css('border', '1px solid crimson');
		                $userPwd2.css('border', '1px solid crimson');
		                $joinBtn.attr('disabled', true);
		            }
		        } else {
	                $userPwd1.removeAttr.css();
	                $userPwd2.removeAttr.css();
		            $checkPwd.hide();
		            $checkP.hide();
		            $joinBtn.attr('disabled', true);
		        }
		    });
		});
		
		<!------------ 닉네임 ------------>
		
		const $nickname = $('.input_form #nickname');
		const $checkNick = $('#checkNick');
		const $checkn = $('.checkNick');
		
		$nickname.keyup(function(){
			
			if($nickname.val().length >= 2){
				$.ajax({
					url : 'member/checkNick',
					data : {nickname : $nickname.val()},
					success : function(result){
						
    					if(result.substr(4) == "N"){
    						$checkNick.show().css('color', 'crimson').text('중복된 닉네임입니다.');
    						$nickname.css('border', '1px solid crimson');
    						$joinBtn.attr('disabled', true);
    					} else{
    						$nickname.css('border', '1px solid lightgreen');
    						$checkn.show().css();
    						$joinBtn.removeAttr('disabled');
    					}
    				},
    				error : function(){
    					console.log('닉네임 중복체크용 AJAX 통신 실패~');
    				}
    			});
			} else {
				$checkNick.hide();
				$joinBtn.attr('disabled', true);
			}
		});
		
		<!------------ 전화번호 ------------>
		
		const $phone = $('.input_form #phone');
		const $checkPhone = $('#checkPhone');
		const $checkPh = $('.checkPhone');
		
		$phone.keyup(function(){
			
			if($phone.val().length == 13){
				$.ajax({
					url : 'member/checkPhone',
					data : {phone : $phone.val()},
					success : function(result){
    					// NNNNN / NNNNY
    					if(result.substr(4) == "N"){
    						$checkPhone.show().css('color', 'crimson').text('가입된 전화번호입니다.');
    						$phone.css('border', '1px solid crimson');
    						$joinBtn.attr('disabled', true);
    					} else{
    						$phone.css('border', '1px solid lightgreen');
    						$checkPh.show().css();
    						$joinBtn.removeAttr('disabled');
    					}
    				},
    				error : function(){
    					console.log('전화번호 중복체크용 AJAX 통신 실패~');
    				}
    			});
			} else {
				$checkPhone.hide();
				$joinBtn.attr('disabled', true);
			}
		});
		
		const $email = $('.input_form #email');
		const $checkEmail = $('#checkEmail');
		const $checkE = $('.checkEmail');
		const $checkMyEmail = $('#checkMyEmail');
		
		$email.keyup(function(){
			
			if($email.val().length > 10){
				$.ajax({
					url : 'member/checkEmail',
					data : {email : $email.val()},
					success : function(result){
						// console.log(result);
    					if(result.substr(4) == "N"){
    						$checkEmail.show().css('color', 'crimson').text('가입된 이메일입니다.');
    						$email.css('border', '1px solid crimson');
    						$joinBtn.attr('disabled', true);
    					} else{
    						$email.css('border', '1px solid lightgreen');
    						$checkE.show().css();
    					}
    				},
    				error : function(){
    					console.log('이메일 중복체크용 AJAX 통신 실패~');
    				}
    			});
			} else {
				$checkEmail.hide();
				$joinBtn.attr('disabled', true);
			}
		});
		
		$(document).ready(function() {
			
		    $('#checkMyEmail').click(function() {
		        const $checkMyEmail = $('#checkMyEmail');
		        const $inputCode = $('.input_code');
		        var email = $('#email').val().trim();

		        if (email !== '') {
		            $checkMyEmail.css('width', '150px').html('인증번호 전송완료');
		            $.ajax({
		                url: 'member/emailCheck.do',
		                type: 'get',
		                data: { email: email },
		                success: function(result) {
		                    $inputCode.show().css();
		                    console.log(result);
		                    $joinBtn.removeAttr('disabled');
		                },
		                error: function() {
		                    console.log('이메일 인증 AJAX 통신 실패~');
		                }
		            });
		        } else {
		            alert('이메일을 입력해주세요.');
		        }
		        
		    });
		    

		});
		 $('.input_code #checkEmailCode').click(function() {
		console.log(code);
         	
             const $emailCode = $('.input_code #emailCode');
             const $checkEmailCode = $('#checkEmailCode');
				if ($emailCode.val() !== '') {
					$.ajax({
						url: 'member/checkCode',
						type: 'get',
						data: { 
								email: $emailCode.val(),
								code : code
							  },
						success: function(result) {
							
	    					if(result.substr(4) == "N"){
	    						$emailCode.show().css('color', 'crimson').text('인증코드가 일치하지 않습니다.');
	    						$emailCode.css('border', '1px solid crimson');
	    						$checkEmailCode.attr('disabled', true);
	    						$joinBtn.attr('disabled', true);
	    					} else{
	    						$emailCode.css('border', '1px solid lightgreen');
	    						$checkEmailCode.css('width', '100px').html('인증 완료');
	    						$joinBtn.removeAttr('disabled');
	    					}
						},
						error: function() {
						    console.log('이메일 인증 AJAX 통신 실패~');
						}
					});
				} else {
				    alert('이메일을 입력해주세요.');
				}
			});
		
	 
	 });
	 
	 
	 
	 
	 
	</script>
 


	






</body>
</html>