<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티</title>
<link rel="stylesheet" href="resources/css/community/communityMain.css" />
<style>
	div{
		box-sizing : border-box;
	}
	#submenubar{
		width : 1200px;
		height: 150px;
		margin : auto;
	}
	#submenubar > searchForm{
		float : left;
	}
	
	#searchForm{
		width : 50%;
		height : 100%;
		position: relative;
		float: left;
	}
	
	#search{
		width : 300px;
		height : 40%;
		position : absolute;
		left: 30px;
		top : 50px;
	}
	#searchcon{
		width : 200px;
		height : 100%;
		border-bottom : 1px solid rgb(235, 235, 235);
	}
	#searchContent{
		outline : none;
		margin-top: 25px;
		margin-left: 5px;
		border : 0;
	}
	#searchImg{
		width : 30px;
		height: 60%;
		padding-top : 25px;
	}
	#searchimg{
		width : 30px;
		height: 30px;
		cursor: pointer;
	}
	#searchimg:hover{
		width : 31px;
		height: 31px;
	}
	#search > div{
		float: left;
	}
	#needgongan{
		width : 1200px;
		height: 100px;
	}
	#boardoutput{
		width :900px;
		height: auto;
		margin : auto;
	}
	#myboard{
		width : 900px;
		height: 150px;
		border: 1px solid rgb(214, 214, 214);
		margin : auto;
		border-radius: 10px;
		display: flex;
		position : relative;
		cursor :pointer;
	}
	#myboard:hover{
    	box-shadow : 1px 1px 1px;
	}
	#thumbnail{
		width :150px;
		height: 150px;
	}
	#boardlist{
		width :670px;
		height: 150px;
		margin-left :5px;
	}
	#thumbnail img{
		width :99%;
		height: 99%;
		border : 1px solid rgb(214, 214, 214);
	}
	#gomain{
		width: 900px;
		height: 120px;
		margin : auto;
		position : relative;
	}
	#mainbtn{
		width: 140px;
		height: 50px;
		position : absolute;
		right: 0;
		transform: translate(0, 10%);
	    font-size: 15px;
	    border-radius: 10px;
	    background-color: rgb(94, 87, 59);
	    color:white;
	    font-weight: bold;
	    bolder: 0;
	    cursor :pointer;
	}
	#mainbtn:hover{
		font-size: 16px;
		width: 141px;
		height: 51px;
	}
	#boardheader{
		width :670px;
		height: 25%;
		display: flex;
	}
	#boardme{
		width :100px;
		height: 100%;
		font-size : 20px;
		font-weight :bold;
	}
	#myboardAni{
		width : 470px;
		height: 100%;
	}
	.animalAndCategory{
		width :60px;
		height: 25px;
		background-color: rgb(255, 239, 175);	
		line-height: 30px;
		margin-top : 5px;
		font-weight: bold;
		margin-right: 5px;
	}	
	#boardCreate{
		width : 80px;
		height: 100%;
	}
	#boardtitle{
		width :670px;
		height: 25%;
	}
	#boardcontent{
		width :670px;
		height: 50%;
	}
	#boardLike{
		width :70px;
		height :100%;	
		position :absolute;
		right: 0;	
	}
	#likeinfo{
		width : 100%;
		height: 25%;
	}
	#likeboard{
		width : 100%;
		height: 25%;
	}
	#seeboard{
		width : 100%;
		height: 25%;
		line-height: 30px;
	}
	#replyboard{
		width : 100%;
		height: 25%;
	}
	#boardoutput >a{
	    text-decoration: none;
	    color: black; 
	}
	#detailbtn{
		border: 0;
		background-color: white;
		color : black;
		width :30px;
		height: 20px;
		margin-left: 10px;
	}
	#likeboard>img{
		width : 35px;
		height: 35px;
	}
	#replyboard>img{
		width : 35px;
		height: 35px;
	}
	#myani{
		background-color: rgba(242, 189, 108, 0.82);
	}
</style>
</head>
<body>
	<jsp:include page="../../common/header.jsp" />
	
	<c:set value="${ sessionScope.path }" var="path" />
	
	<div class="wrap">
	
		<div class="community_header">
			<div class="searchCategory">
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
			</div>
		</div>
			
		<div class="selectCategory">
			
			<div class="animal_category">
				<button type="button" class="dropdown-toggle" data-toggle="dropdown">반려동물</button>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#"># 강아지</a> 
					<a class="dropdown-item" href="#"># 고양이</a> 
					<a class="dropdown-item" href="#"># 토끼</a> 
					<a class="dropdown-item" href="#"># 물고기</a> 
					<a class="dropdown-item" href="#"># 새</a> 
					<a class="dropdown-item" href="#"># 햄스터</a> 
				</div>
			</div>
			
			<div class="board_category">
				<button type="button" class="dropdown-toggle" data-toggle="dropdown">글 성격</button>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#"># 전체</a> 
					<a class="dropdown-item" href="#"># 자유</a> 
					<a class="dropdown-item" href="#"># 질문</a> 
				</div>
			</div>	
			
		</div>
		
		<br clear="both">
		<div id="needgongan"></div>
		<div class="content_wrap" id="boardoutput"></div>
			
	</div>
	<div id="gomain">
		<div class="btnDiv">
			<button>더 보기</button>
		</div>
		<a href="${sessionScope.path }/"><button id="mainbtn">메인으로</button></a>
	</div>
		 
	</div>
	<script>
	
		// 초기 변수 선언
		let animal='A0',
		category = 'I0', 
		page = 1,
		text = '',
		resultStr = '',
		animalListStr = '';
		
		$(() => {
			
			selectCommunityList(animal, category, page);
			
			$('.btnDiv > button').click(() => {
				selectCommunityList(animal, category, ++page);
			});
			
			
			$('.animal_category .categoryImg').click(function(){
				 
				$(this).css('border', '2px solid red');
				$('.animal_category .categoryImg').not(this).css('border', 'none');
				
				if ($(this).hasClass('selected')) {
			        $(this).css('border', 'none');
			        $(this).removeClass('selected');
			        animal = 'A0';
			    } else {
			        $(this).css('border', '2px solid red');
			        $(this).addClass('selected');
			        // 나머지 이미지들의 border 제거
			        $('.anmal_category .categoryImg').not(this).css('border', 'none').removeClass('selected');
			        
			        // 선택된 동물 값 가져오기
			        animal= $(this).data('value');
			    }
				 
				resultStr = '';
				page = 1;
				selectCommunityList(animal, category, page);
		    });
			 
			 
			$('.board_category > button').click(function(){
				 
				$(this).css('border', '2px solid red');
				$('.board_category > button').not(this).css('border', 'none');
				
				if ($(this).hasClass('selected')) {
	 
			      $(this).css('border', 'none');
			      $(this).removeClass('selected');
			      category = 'I0';
			    } else {
			      $(this).css('border', '2px solid red');
			      $(this).addClass('selected');
			      // 나머지 이미지들의 border 제거
			      $('.board_category > button').not(this).css('border', 'none').removeClass('selected');
			       
			      // 선택된 동물 값 가져오기
			      category= $(this).val();
			    }
				 
				 resultStr = '';
				 page = 1;
				 selectCommunityList(animal, category, page);
			 });
			
		});
		
		function dateFormat(date) {
	        let month = date.getMonth() + 1;
	        let day = date.getDate();
	        let hour = date.getHours();
	        let minute = date.getMinutes();
	        let second = date.getSeconds();
	        month = month >= 10 ? month : '0' + month;
	        day = day >= 10 ? day : '0' + day;
	        hour = hour >= 10 ? hour : '0' + hour;
	        minute = minute >= 10 ? minute : '0' + minute;
	        second = second >= 10 ? second : '0' + second;
	        
	        return date.getFullYear() + '-' + month + '-' + day + ' ' + hour + ':' + minute + ':' + second;
		}
				
		function selectCommunityList(animal, category, page){
			
			console.log(animal);
			console.log(category);
			console.log(page);
			
			$.ajax({
				url : 'selectCommunityList',
				data : {
					animal : animal,
					category : category,
					page : page
				},
				success : result => {
					console.log(result);
					
					for(let i in result){
						
						var animalListStr = '';
						var animalListResult = result[i].animalList;
						
						for(let i in animalListResult){
							animalListStr += '<div class="animalAndCategory">' 
										  + animalListResult[i].animalName
										  + '</div>'
						}
						
						animalListStr += '<br clear="both">';
						
						resultStr += '<div id="myboard" class="communityList">'
										+ '<div class="thumbnailImg" id="thumbnail"><img src="'
										+ result[i].attachmentList.attPath + result[i].attachmentList.changeName
										+ '"></div>'
										+ '<div class="center_content" id="boardlist">'
										+ '<input type="hidden" value="' + result[i].boardNo + '">'
											+ '<div id="boardheader">'
												+ '<div class="content_writer" id="boardme">' + result[i].memberNo + '</div>'
												+ '<div id="myboardAni"><span class="category" id="myani">' + animalListStr + '</span></div>'
												+ '<div class="create_date" id="boardCreate">' + result[i].boardCreateDate + '</div>'
											+ '</div>'
											+ '<div class="board_Title" id="boardtitle">' + result[i].boardTitle + '</div>'
											+ '<div class="content_text" id="boardcontent">' + result[i].boardContent + '</div>'
						resultStr += '<div class="communityList">'
						
										
										+ '<div class="thumbnailImg"><img src="'
										+ result[i].attachmentList.attPath + result[i].attachmentList.changeName
										+ '"></div>'
										
										
										+ '<input type="hidden" value="' + result[i].boardNo + '">'
										+ '<div class= "center_content">'
											+ '<div class="content_writer">' + result[i].memberNo + '</div>'
											+ animalListStr
											+ '<div class="board_Title">' + result[i].boardTitle + '</div>'
											+ '<div class="content_text">' + result[i].boardContent + '</div>'
											+ '<div class="create_date">' + result[i].boardCreateDate + '</div>'
										+ '</div>'
										+ '<div class="content_reaction">'
											+ '<div class="cr_detail"><div><img src="resources/img/common/like.png"></div><div>' + result[i].boardLike + '</div></div>'
											+ '<div class="cr_detail"><div><img src="resources/img/common/reply.png"></div><div>' + result[i].sumCount + '</div></div>'
											+ '<div class="cr_detail"><div>조회수</div><div>' + result[i].boardCount + '</div></div>'
										+ '</div>'
											+ '<div class="content_reaction" id="boardLike">'
												+ '<div id="likeinfo"><button id="detailbtn">&nbsp;&nbsp;&nbsp;˚&nbsp;˚&nbsp;˚</button></div>'
												+ '<div id="likeboard"><img id="like_board" src="${sessionScope.path }/resources/img/common/like.png">&nbsp;&nbsp;(' + result[i].boardLike + ')</div>'
												+ '<div id="seeboard"><span>조회</span>&nbsp;&nbsp;&nbsp;(' + result[i].sumCount + ')</div>'
												+ '<div id="replyboard"><img src="${sessionScope.path }/resources/img/common/reply.png">&nbsp;&nbsp;(' + result[i].boardCount + ')</div>'
											+ '</div>'
									+ '</div>'
					};
					
					$('#like_board').click(function(){
						 var likeNuroom = "${sessionScope.path}/resources/img/common/like2.png";
	                        $('#like_board img').attr('src', likeNuroom);
					})
					
					$('.content_wrap').html(resultStr);
					
					$('.center_content').click(function() {
						
						var $communityDetail = $(this).next('.communityDetail');
						var boardNo = $(this).find('input[type="hidden"]').val();
						
						console.log(boardNo);
						location.href = 'communityDetail?boardNo=' + boardNo;
					});
					
					if(result[0].pageInfo.currentPage != result[0].pageInfo.maxPage){
						$('.btnDiv').css('display', 'block');
					}
					else{
						$('.btnDiv').css('display', 'none');
					}
				}
			});
		}
		
	</script>
	
	<jsp:include page="../../common/footer.jsp" />
</body>
</html>