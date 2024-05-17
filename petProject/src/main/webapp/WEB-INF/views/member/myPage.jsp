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
<title>Insert title here</title>
<style>
    #myoutput{
        width: 1200px;
        height: 1600px;
        border-top: 1px solid rgb(230, 230, 230);
        margin: auto;
    }
    #myheader{
        width: 100%;
        height: 200px;
        border-bottom: 2px solid rgb(230, 230, 230);
    }
    #mycontent{
        width: 100%;
        height: 1200px;
    }
    #myback{
        width: 1000px;
        height: 1300px;
        transform: translate(10%, 3%);
        border-radius: 50px;
    }
    #myname > *{
        transform: translate(0%, 5%);
    }
    #myname{
        width: 80%;
        height: 70%;
        margin: auto;
        transform: translate(0%, 20%);
    }
    #myname > div{
        float: left;
    }
    #profile{
        width: 150px;
        height: 130px;
    }
    #name{
        width: 500px;
        height: 130px;
        line-height: 180px;
        font-size: 23px;
        font-weight: 700;
    }
    #update{
        width: 140px;
        height: 130px;
    }
    #profile_img{
        border-radius: 60%;
        cursor: pointer;
        border: 3px solid black;
        width: 130px;
        height: 130px;
    }
    #profile_img > img{
        width: 120px;
        height:110px;
        padding-left: 5px;
    }
    #update_info{
        float: right;
        border-radius: 15px;
        background-color: rgba(197, 173, 135, 0.82);
        border: 0;
        color: white;
        height: 30px;
        font-weight: bold;
    }
    #mycontent{
        width: 100%;
        height: 1200px;
    }
    #content1{
        width: 100%;
        height: 20%;
    }
    #down{
        width: 95%;
        height: 10%;
        font-size: 20px;
        line-height: 7;
        margin: auto;
    }
    #down > div{
        width: 25%;
        height: 100%;
        font-size: 20px;
        font-weight: bold;
        line-height: 4;
        color: rgb(94, 87, 59);
        text-align:center;
        float: left;
    }
    #content2{
        width: 100%;
        height: 70%;
        border-top: 2px solid rgb(230, 230, 230);
        padding-top: 30px;
        padding-left: 10px;
    }
    #content1{
        list-style: none;
        border-top: 1px solid rgb(230, 230, 230);
    }
    #content1>li{
        float: left;
        text-align: center;
        width: 15%;
        margin-left: 8.2%;
        transform: translate(0%, 40%);
        height:62%;
        border-radius: 60% 60%;
        border: 1px solid rgba(255, 231, 192, 0.82);
        background-color: rgba(243, 222, 189, 0.82);
        font-weight: bold;
        color: rgb(78, 97, 114);
    }
    #shipment, #truck{
        margin-top: 20px;
    }
    #transit{
        margin-top: 10px;
    }
    #content2 > div{
        width: 33%;
        height: 30%;
        float: left;
        text-align: center;
        padding: 50px 80px;
    }
    #content > a{
        text-decoration: none;
        display: block;
        font-size: 17px;
        color: rgb(73, 73, 73);
        font-weight: bold;
        line-height: 70px;
    }
    #content > a:hover {
   		font-size: 18px;
   		color: rgba(197, 173, 135, 0.82);
    }
    #content > a > img{
        width: 70px;
        height: 70px;
    }
    #main{
        margin: auto;
        width: 200px;
        height: 50px;
    }
    #main_btn{
        width: 200px;
        height: 50px;
        border: 0;
        background-color: rgb(94, 87, 59);
        color: white;
        font-size: 20px;
        font-weight: bold;
        border-radius: 10px;
    }
    
    #info-btn{
    	width: 100%;
	    height: 40px;
	    font-size: 14px;
	    border-radius: 10px;
	    background-color: rgb(94, 87, 59);
	    color:white;
	    font-weight: bold;
    }
    #info-area input{
   	    border: none;
	    box-shadow: none;
	    padding: 12px 16px;
	    line-height: 1.2;
		outline:none;
		border-radius : 15px;
		border: 1px solid #e0e0e0;
		width :80%;
	    height :40px;
    }
    
    #info-area .input_form{
	    background: #fff;
	    box-sizing: border-box;
	    position: relative;
	    margin-bottom:15px;
	    width :100%;
   	    height :auto;
    }
        
    .animalList{
    	width:450px;
    	height:100px;
    	margin:auto;
    	position : relative;
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
	    position: absolute;
    }
	.clicked {
	  	background-color: rgba(242, 189, 108, 0.82);
	    color:white;
    	border:0;
    	font-weight:bold;
	}
    
  	#myInfo{
		margin:30px 0px 20px;
	}
   	.up{
   		position: absolute;
        width : 40px;
        height: 25px;
        font-size :12px;
        right : 15px;
        top : 6px;
        border-radius : 5px;
        border: 0;
        background-color:rgba(197, 173, 135, 0.82);
    }
   	.up:hover {
        font-size :13px;
        color: white;
    }	
    .down{
   		position: absolute;
        width : 40px;
        height: 25px;
        font-size :12px;
        right : 15px;
        top : 6px;
        border-radius : 5px;
        border: 0;
        background-color:rgba(197, 173, 135, 0.82);
    }
   	.down:hover {
        font-size :13px;
        color: white;
    }
    .new{
    	width : 80%;
		position : relative;
    }
    .new input{
    	margin-top:15px;
    }
  	.checkPwd{
		position : absolute;
		right : 0;
		width: 30px;
		height : 30px;
		margin : 15px 10px;
	}
  	.checkOriginPwd{
		position : absolute;
		right : 0;
		width: 30px;
		height : 30px;
		margin : 17px 10px;
	}
</style>
</head>
<body>
	
	<jsp:include page="../common/header.jsp" />
	<c:set var="loginUser" value="${ sessionScope.loginUser }" scope="session" />
	<div id="myoutput">
        <div id="myback">
            <div id="myheader">
                <div id="myname">
                    <div id="profile">
                        <input type="file" name="profile" id="my_profile">
                        <div id="profile_img"><img src="${sessionScope.path}/resources/img/${ loginUser.profile }" alt="기본프로필사진"></div>
                    </div>
                    <div id="name">
                        <span>&nbsp;&nbsp;&nbsp;&nbsp;${ loginUser.nickname }</span><span id="nim"><small>&nbsp;님</small></span>
                    </div>  
                    <div id="update">
                        <button id="update_info" type="button" data-toggle="modal" data-target="#myInfo">정보 수정</button>
                    </div>  
                </div>
            </div>
            <div id="mycontent">
                <div id="content1">
                    <li class="circle"><img src="${sessionScope.path}/resources/img/deposit.png" alt="입금완료" width="140px" height="140px"></li>
                    <li class="circle"><img id="shipment" src="${sessionScope.path}/resources/img/shipment.png" alt="상품발송" width="110px" height="110px"></li>
                    <li class="circle"><img id="truck" src="${sessionScope.path}/resources/img/truck.png" alt="배송중" width="110px" height="110px"></li>
                    <li class="circle"><img id="transit" src="${sessionScope.path}/resources/img/transit.png" alt="배송완료" width="130px" height="130px"></li>
                </div>
                <div id="down">
                    <div>입금완료</div>
                    <div>상품발송</div>
                    <div>배송중</div>
                    <div>배송완료</div>
                </div>
                <div id="content2">
                    <div id="content"><a href="" data-toggle="modal" data-target="#myInfo"><img src="${sessionScope.path}/resources/img/selectmyinfo.png" alt=""><br>내 정보 조회</a></div>
                    <div id="content"><a href=""><img src="${sessionScope.path}/resources/img/board.png" alt=""><br>내가 쓴 게시글</a></div>
                    <div id="content"><a href=""><img src="${sessionScope.path}/resources/img/comment.png" alt=""><br>내가 쓴 댓글</a></div>
                    <div id="content"><a href=""><img src="${sessionScope.path}/resources/img/like2.png" alt=""><br>내 좋아요</a></div>
                    <div id="content"><a href=""><img src="${sessionScope.path}/resources/img/heart.png" alt=""><br>내가 찜한 상품</a></div>
                    <div id="content"><a href=""><img src="${sessionScope.path}/resources/img/mycart.png" alt=""><br>내 장바구니</a></div>
                    <div id="content"><a href=""><img src="${sessionScope.path}/resources/img/coupon.png" alt=""><br>내 쿠폰</a></div>
                    <div id="content"><a href=""><img src="${sessionScope.path}/resources/img/shopping.png" alt=""><br>내 결제 내역</a></div>
                    <div id="content"><a href=""><img src="${sessionScope.path}/resources/img/reser.png" alt=""><br>내 예약 내역</a></div>
                </div>
                <div id="main"><button type="button" id="main_btn" onclick="location.href='${sessionScope.path}'">메인화면</button></div>
            </div>
        </div>
    </div>

    <script>
        $(function(){
            $('#my_profile').hide();
            $('#profile_img').click(function(){
                $('#my_profile').click();
            });
        });
        
        function updateProfile(){
        	$.ajax({
        		url : 'upProfile',
        		data : {
        			profile : $('#my_profile').val(),
        			memberNo : '${loginUser.memberNo}'
        		},
        		success : function(result){
        			console.log(result);
        		}, 
        		error : function(result){
        			console.log('실패~');
        		}
        	})
        }
        
    </script>
    
    <div class="modal fade" id="myInfo">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
        
        <!-- Modal body -->
        <div class="modal-body">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h3 align="center" id="myInfo">내 정보 조회</h3>
        
		<div id="info-area">
			<input type="hidden" name="code" id="myCode">
				<div class="input_form">
					<input type="text" id="memberId" name="memberId" maxlength="10" value="${loginUser.memberId }" readonly>
				</div>
					
					
				<div class="input_form">
					<input type="password" id="memberPwd1" value="******" required readonly>
					<button type="button" class="up">수정</button>
					<div class="new" style="display:none;">
						<input type="password" id="nowPwd" name="memberPwd" maxlength="16" required placeholder="현재 비밀번호를 입력하세요">
						<div id="checkOriginPwd" class="danger" style="font-size:0.7em; display:none;"></div>
						<img src="${sessionScope.path}/resources/img/check.png" class="checkOriginPwd" style="display:none;">
						<input type="password" id="newPwd" name="memberPwd" maxlength="16" required placeholder="새로운 비밀번호를 입력하세요">
						<input type="password" id="newPwdCheck" name="memberPwd" maxlength="16" required placeholder="새로운 비밀번호를 한번 더 입력하세요">
						<div id="checkPwd" class="danger" style="font-size:0.7em; display:none;"></div>
						<img src="${sessionScope.path}/resources/img/check.png" class="checkPwd" style="display:none;">
					</div>
				</div>
				<div class="input_form">
					<input type="text" value="${loginUser.memberName }" readonly>
					<button type="button" class="up">수정</button>
					<div class="new" style="display:none;"><input type="text" name="memberName" maxlength="10"></div>
				</div>
				<div class="input_form">
					<input type="text" id="nickname" value="${loginUser.nickname }" required readonly>
					<button type="button" class="up">수정</button>
					<div class="new" style="display:none;"><input type="text" id="nickname" name="nickname" maxlength="30" required></div>
				</div>
				<div class="input_form">
					<input type="text" id="phone" value="${loginUser.phone }" required readonly>
					<button type="button" class="up">수정</button>
					<div class="new" style="display:none;"><input type="text" id="phone" name="phone" maxlength="13" required></div>
				</div>
				<div class="input_form">
					<input type="text" id="email" value="${loginUser.email }" required readonly>
					<button type="button" class="up">수정</button>
					<div class="new" style="display:none;"><input type="text" id="email" name="email" maxlength="30" required></div>
				</div>
					
				<div class="animalList"><span><small>내 추천 동물 ${loginUser.animalName }</small></span><br><br>
				<button type="button" class="up">수정</button>
				<div class="new" style="display:none;">
					<input type="hidden" name="animalList" value="" >
					<label for="animaldog"><input type="checkbox" class="animal" name="animal" value="A1" id="animaldog" style="display:none;">강아지</label>
					<label for="animalcat"><input type="checkbox" class="animal" name="animal" value="A2" id="animalcat" style="display:none;">고양이</label>
					<label for="animalrab"><input type="checkbox" class="animal" name="animal" value="A3" id="animalrab" style="display:none;">토끼</label>
					<label for="animalfish"><input type="checkbox" class="animal" name="animal" value="A4" id="animalfish" style="display:none;">물고기</label>
					<label for="animalbird"><input type="checkbox" class="animal" name="animal" value="A5" id="animalbird" style="display:none;">새</label>
					<label for="animalham"><input type="checkbox" class="animal" name="animal" value="A6" id="animalham" style="display:none;">햄스터</label>
				</div>
				</div>
				<div class="input_btn2"><button type="submit" id="info-btn" class="btn">수정 완료</button></div>
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
        	  		$(this).addClass('.clicked');
		        	animalList.push($(this).val());
		        	console.log(animalList);
		        });
		        	$('input[name=animalList]').val(animalList.join(','));
		        	console.log($('input[name=animalList]').val());
			});
		});
		<!-- 비밀번호 일치 확인 -->
		const $nowPwd = $('.input_form #nowPwd');
		const $checkOriginPwd = $('#checkOriginPwd');
		const $checkPwdimg = $('.checkOriginPwd');
        const $up = $('.up');

		$nowPwd.keyup(function(){
					
			if($nowPwd.val().length > 0){
				$.ajax({
					url : 'pwdCheck',
					data : {memberPwd : $nowPwd.val(),
							memberNo : '${loginUser.memberNo}'
							},
					type : 'get',		
					success : function(result){
    					if(result.substr(4) == "N"){
    						$checkOriginPwd.show().css('color', 'crimson').text('현재 비밀번호가 올바르지 않습니다.');
    						$nowPwd.css('border', '1px solid crimson');
    						$up.attr('disabled', true);
    					} else{
    						$nowPwd.css('border', '1px solid lightgreen');
    						$checkPwdimg.show().css();
    						$up.removeAttr('disabled');
    					}
    				},
    				error : function(){
    					console.log('아이디 중복체크용 AJAX 통신 실패~');
    				}
    			});
			} else {
				$checkOriginPwd.hide();
				$up.attr('disabled', true);
			}
		});
					
		<!-- 비밀번호 재확인 -->
	    $('.input_form #newPwd, .input_form #newPwdCheck').on('input', function() {
	        const $newPwd = $('.input_form #newPwd');
	        const $newPwdCheck = $('.input_form #newPwdCheck');
	        const $checkPwd = $('#checkPwd');
	        const $checkP = $('.checkPwd');
	        const $up = $('.up');
		
		$(document).ready(function() {
		        
		        if ($newPwd.val().length >= 4 && $newPwdCheck.val().length >= 4) {
		        	
		            if ($newPwd.val() === $newPwdCheck.val()) {
		                $newPwd.css('border', '1px solid lightgreen');
		                $newPwdCheck.css('border', '1px solid lightgreen');
		                $checkP.show().css();
		                $up.removeAttr('disabled');
		                $checkOriginPwd.show().css();
		            } else {
		                $checkPwd.show().css('color', 'crimson').text('비밀번호가 일치하지 않습니다.');
		                $newPwd.css('border', '1px solid crimson');
		                $newPwdCheck.css('border', '1px solid crimson');
		                $up.attr('disabled', true);
		            }
		        } else {
	                $newPwd.removeAttr.css();
	                $newPwdCheck.removeAttr.css();
		            $checkPwd.hide();
		            $checkP.hide();
		            $up.attr('disabled', true);
		        }
		    });
		});
		
	    
	    
        document.querySelectorAll(".up").forEach(function(button) {
            button.addEventListener("click", function() {
                var newDiv = this.nextElementSibling;
                if (newDiv.classList.contains("new")) {
                    if (newDiv.style.display === "none" || newDiv.style.display === "") {
                        newDiv.style.display = "block";
                        this.innerText = "완료";
                        this.style.width = "45px";
                    } else {
                        newDiv.style.display = "none";
                        this.innerText = "수정";
                        this.style.width = "40px";
                	};
                };
            });
        });
        
		<!-- 비밀번호수정 -->
		
		$('#info-btn').click(() => {
            $.ajax({
            	url : 'update',
            	data : {
            			memberNo : $('#memberId').val(),
            			memberPwd : $('#memberPwd').val(),
            			memberName : $('#memberName').val(),
            			email : $('#email').val(),
            			nickname : $('#nickname').val(),
            			phone : $('#phone').val(),
            			profile : $('#my_profile').val()
            			},
            	success : function(result){
            		alert('정보 수정이 완료되었습니다.');
            	},
            	error : function(result){
            		alert('정보 수정에 실패하였습니다.');
            	}
            })
		})
		
	})			
    </script>
    
   			
	
</body>
</html>