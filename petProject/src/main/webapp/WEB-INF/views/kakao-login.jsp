<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
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
        border: 1px solid rgb(235, 235, 235);
        margin: 0;
        padding: 0;
        outline : none;
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
    
    #search-btn{
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
	    cursor: pointer;
    }
    #join-area{
    	width :500px;
    	margin : auto;
    }
    #join-area input{
   	    border: none;
	    box-shadow: none;
	    padding: 12px 16px;
	    width: 100%;
	    line-height: 1.2;
		outline:none;
		border-radius : 15px;
    }
    #login-area input{
   	    border: none;
	    box-shadow: none;
	    padding: 12px 16px;
	    width: 100%;
	    line-height: 1.2;
		outline:none;
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
	.checkEmail, .checkEmailimg{
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
		width:90px;
		height:25px;
		font-size:13px;
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
		font-size:14px;
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
	.input_codeId{
		width: 180px;
		height:80px;
		border-radius:10px;
	}
	.input_codeId > #emailCode2{
		border:1px solid rgb(230, 230, 230);
		float:right;
	}
	
	#checkEmailCode, #checkEmailCode2{
		width:80px;
		height:25px;
		font-size:14px;
		display:block;
		border:0;
		background-radius : 10px;
		box-shadow : 1px 1px 2px;
		background-color: rgba(242, 189, 108, 0.82);
		color: white;
	}
	
	#checkEmailCode:hover, #checkEmailCode2:hover{
		cursor : pointer;
		font-size:15px;
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
</style>
</head>
<body>

<h1 align="center" id="join">회원가입</h1>
	<div id="join-area">
		<form action="${sessionScope.path}/member/join" method="post">
		<input type="hidden" name="code" id="myCode">
		
			<input type="hidden" id="memberId" name="memberId" value="${sessionScope.socialLogin.id }">
			<input type="hidden" id="nickname" name="nickname" value="${sessionScope.socialLogin.nickname }">
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
		});
		
	 </script>
		 
</body>
</html>