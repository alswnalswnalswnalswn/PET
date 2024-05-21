<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 게시글 조회</title>
	<style>
		div {
			box-sizing: border-box;
		}
		
		#submenubar {
			width: 1200px;
			height: 150px;
			margin: auto;
		}
		
		#submenubar>searchForm {
			float: left;
		}
		
		#searchForm {
			width: 50%;
			height: 100%;
			position: relative;
			float: left;
		}
		
		#search {
			width: 300px;
			height: 40%;
			position: absolute;
			left: 30px;
			top: 50px;
		}
		
		#searchcon {
			width: 200px;
			height: 100%;
			border-bottom: 1px solid rgb(235, 235, 235);
		}
		
		#searchContent {
			outline: none;
			margin-top: 25px;
			margin-left: 5px;
			border: 0;
		}
		
		#searchImg {
			width: 30px;
			height: 60%;
			padding-top: 25px;
		}
		
		#searchimg {
			width: 30px;
			height: 30px;
			cursor: pointer;
		}
		
		#searchimg:hover {
			width: 31px;
			height: 31px;
		}
		
		#search>div {
			float: left;
		}
		
		#selectctg {
			width: 50%;
			height: 100%;
			float: left;
			position: relative;
		}
		
		#select {
			width: 220px;
			justify-content: space-between;
			height: 200px;
			position: absolute;
			transform: translate(100%);
			display: flex;
			flex-direction: column;
			top: 30%;
		}
		
		#selectstyle, #selectani {
			width: 50%;
			height: 30px;
			float: left;
			display: flex;
			justify-content: center;
		}
		
		#styleboard, #styleani {
			width: 90px;
			height: 100%;
			font-size: 15px;
			font-weight: bold;
			background-color: rgb(248, 243, 221);
			color: rgba(122, 88, 33, 0.92);
			text-align: center;
			line-height: 30px;
			border-top-left-radius: 10px;
			border-top-right-radius: 10px;
			cursor: pointer;
			float: left;
			margin: auto;
		}
		
		#styleboard:hover, #styleani:hover {
			font-size: 16px;
		}
		
		#line {
			width: 300px;
			margin-left: 180px;
			margin-top: 13%;
			border: 1px solid rgba(190, 190, 190, 0.2);
		}
		
		#sksnrl1 {
			width: 100%;
			height: 22%;
			float: left;
		}
		
		#sksnrl2 {
			width: 100%;
			height: 78%;
			display: flex;
		}
		
		#boardinfo {
			width: 48%;
			height: 45%;
			background-color: rgba(190, 190, 190, 0.2);
			border-radius: 10px;
		}
		
		#aniinfo {
			width: 48%;
			height: 100%;
			background-color: rgba(190, 190, 190, 0.2);
			border-radius: 10px;
		}
		
		#boardinfo {
			margin-right: 2%;
		}
		
		#aniinfo {
			margin-left: 2%;
		}
		
		span {
			text-align: center;
			cursor: pointer;
			font-size: 15px;
		}
		
		span:hover {
			font-size: 16px;
		}
		
		#needgongan1 {
			width: 1200px;
			height: 100px;
		}
		
		#boardoutput {
			width: 900px;
			height: auto;
			margin: auto;
		}
		
		.myboard {
			width: 900px;
			height: 150px;
			border: 1px solid rgb(214, 214, 214);
			margin: auto;
			border-radius: 10px;
			display: flex;
			line-height: 2.5;
			position: relative;
			cursor: pointer;
		}
		
		.myboard:hover {
			transform: translateY(-5px);
			transition: transform 0.3s ease;
			box-shadow: 1px 1px 1px;
		}
		
		#thumbnail {
			width: 150px;
			height: 150px;
		}
		
		#boardlist {
			width: 650px;
			height: 150px;
		}
		
		#thumbnail img {
			width: 99%;
			height: 99%;
			border: 1px solid rgb(214, 214, 214);
		}
		
		#gomain {
			width: 900px;
			height: 120px;
			margin: auto;
			position: relative;
		}
		
		#mainbtn {
			width: 140px;
			height: 50px;
			position: absolute;
			right: 0;
			transform: translate(0, 10%);
			font-size: 15px;
			border-radius: 10px;
			background-color: rgb(94, 87, 59);
			color: white;
			font-weight: bold;
			bolder: 0;
			cursor: pointer;
		}
		
		#mainbtn:hover {
			font-size: 16px;
			width: 141px;
			height: 51px;
		}
		
		#boardheader {
			width: 650px;
			height: 25%;
			display: flex;
		}
		
		#boardme {
			width: 120px;
			height: 100%;
			font-size: 18px;
			font-weight: bold;
			float: left;
			display: flex;
		}
		
		#myboardAni {
			width: 410px;
			height: 100%;
		}
		
		#boardCreate {
			width: 120px;
			height: 100%;
		}
		
		#boardtitle {
			width: 650px;
			height: 25%;
		}
		
		#boardcontent {
			width: 650px;
			height: 50%;
		}
		
		#boardLike {
			width: 50px;
			height: 100%;
			position: absolute;
			right: 0;
		}
		
		#likeinfo {
			width: 100%;
			height: 25%;
		}
		
		#likeboard {
			width: 100%;
			height: 25%;
		}
		
		#seeboard {
			width: 100%;
			height: 25%;
		}
		
		#replyboard {
			width: 100%;
			height: 25%;
		}
		
		#boardoutput>a {
			text-decoration: none;
			color: black;
		}
		
		#detailbtn {
			border: 0;
			background-color: white;
			color: black;
			width: 30px;
			height: 20px;
			margin-left: 10px;
		}
		
		#likeboard>img {
			width: 55%;
			height: 75%;
		}
		
		#replyboard>img {
			width: 55%;
			height: 75%;
		}
	</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	
	<div id="submenubar">
	
		<div id="searchForm">
			<div id="search">
				<div id="searchcon">
					<input type="text" name="searchContent" id="searchContent"/>
				</div>
				<div id="searchImg">
					<img src="${sessionScope.path}/resources/img/common/searchform.png" alt="" id="searchimg">
				</div>
			</div>
		</div>
		
		<div id="selectctg">
			<div id="select">
				<div id="sksnrl1">
					<div id="selectstyle">
						<span id="styleboard">글 성격</span>
					</div>
					<div id="selectani">		
						<span id="styleani">반려 동물</span>
					</div>
				</div>
				<div id="sksnrl2">	
					<div id="boardinfo">
						<span id="freecon" class="category"># 자유</span><br>
						<span id="quescon" class="category"># 질문</span><br>
					</div>
					<div id="aniinfo">
						<span class="animalName" id="dogcon"># 강아지</span><br>
						<span class="animalName" id="catcon"># 고양이</span><br>
						<span class="animalName" id="rabcon"># 토끼</span><br>
						<span class="animalName" id="fishcon"># 물고기</span><br>
						<span class="animalName" id="birdcon"># 새</span><br>
						<span class="animalName" id="hamcon"># 햄스터</span><br>
					</div>
				</div>
			</div>
			<div id="line"></div>
		</div>
	</div>
	
	<div id="needgongan1"></div>
	
	<div id="boardoutput">
		<div id="myboard" class="myboard">
		
		</div>
	</div>
	
	<div id="gomain">
		<a href=""><button id="mainbtn">메인으로</button></a>
	</div>
	
	<div class="myboard_body">
		<div class="refresh_btn"><img src="${sessionScope.path }/resources/img/common/refresh.png"></img></div>
	</div>
		
	<script>
		
		let memberNo = ${loginUser.memberNo};
	
		let animal='A0',
		category = 'I0', 
		page = 1,
		text = '',
		resultStr = '',
		animalListStr = '',
		attachmentListStr = '';
		
		$(() => {
			selectMyBoard(animal, category, page, memberNo);
			
			
		});
		
		function selectMyBoard(animal, category, page, memberNo){
			
			$.ajax({
				url : 'selectMyBoard',
				data : {
					animal : animal,
					category : category,
					page : page,
					memberNo : memberNo
				},
				success : result => {
					console.log(result);
					
					
					
					/*
					if(result.length == 0){
						$('#myboard').css('display', 'none');
						resultStr += '<table><tr><th style="font-size:20px;" colspan="5">작성한 게시물이 없습니다.</th></tr></table>';
					}
					else{
						$('#myboard').css('display', 'block');
						for(let i in result){
							let attachmentList = result[i].attachmentList[0];
							
							resultStr += '<div id="thumbnail"><img src="${sessionScope.path}/';
							
							if(attachmentList.attPath == ''){
								resultStr += 'resources/img/common/profile.png" alt="">';
							}
							else{
								resultStr += attachmentList.attPath + attachmentList.changeName + '" alt="">';
							}
							resultStr  += '</div>'
									   + '<div id="boardlist"><div id="boardheader"><div id="boardme">' + i.memberNo + '</div>'
									   + '<div id="myboardAni"><span class="category" id="myani"></span></div><div id="boardCreate">'
									   + i.createDate + '</div></div><div id="boardtitle">' + i.boardTitle + '</div>'
									   + '<div id="boardcontent">' + i.boardContent + '</div></div>'
									   + '<div id="boardLike"> + <div id="likeinfo"><button id="detailbtn">˚&nbsp;˚&nbsp;˚</button></div>';
									   
						   if(i.likeCheck != 1){
							   resultStr += '<div id="likeboard"><img src="${sessionScope.path }/resources/img/common/like.png">('
						   	  			 + i.boardLike + ')</div>';
						   }
						   else {
							   resultStr += '<div id="likeboard"><img src="${sessionScope.path }/resources/img/common/like2.png">('
							   			  + i.boardLike + ')</div>';
						   }
						   
						   resultStr += '<div id="seeboard"><span>조회</span>(' + i.boardCount + ')</div>'
						   			  + '<div id="replyboard"><img src="${sessionScope.path }/resources/img/common/reply.png">(' + i.sumCount + ')</div></div>'
									   
						}
					}
					*/
					//console.log(resultStr);
					
					$('#boardoutput').html(resultStr);
					
				}
			});
		}
		
		
	</script>
		
		
		
	
	<jsp:include page="../common/footer.jsp"/>
	
	
	
	
</body>
</html>