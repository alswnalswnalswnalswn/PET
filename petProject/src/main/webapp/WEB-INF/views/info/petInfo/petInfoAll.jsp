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
	#submenubar{
		width : 1200px;
		height: 150px;
		margin : auto;
	}
	#submenubar > searchForm{
		float : left;
	}
	
	#searchForm{
		width :40%;
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
	.info_body{
		height: auto;	
	}
	.anmal_category{
		height: 60%;
		padding-top: 40px;
	}
	.nav-item > img{
		width: 90px;
		height: 70px;
	}

    .anmal_category ul{
    	border:none;
    }
    .nav li> img:hover{
    	width: 95px;
		height: 75px;
       cursor: pointer;
    }
    .refresh_btn{
    	margin: auto;
    	text-align: center;
    }
    .refresh_btn > img{
    	width: 45px;
    	height: 45px;
    	margin-top: 40px;
    }
	#needgongan1{
		width : 800px;
		height: 50px;
	}
	.info_body{
		width : 1200px;
		border: 1px solid black;
		margin : auto;
	}
    #infoList> div{
   		border: 1px solid black;
    }
    #infoList> div>div{
   		border: 1px solid black;
    }
    #infoList{
    	width :250px;
    	height: 350px;
    	border: 1px solid black;
    	border-radius: 10px;
    }
    #infoList:hover{
    	box-shadow : 0 15px 20px rgb(168, 167, 167);
    }
    #thumbnailinfo{
    	width : 100%;
    	height: 250px;
    }
    #thumbnailinfo > img{
    	width : 95%;
    	height: 95%;
    	margin : 2.5% 0 0 2.5%;
    	border: 1px solid rgb(233, 231, 231);
    	border-radius: 20px;
    }
    #info-list{
    	width : 100%;
    	height : 100px;
    }
    #infoContent{
    	width : 100%;
    	height : 50%;
    	font-size: 15px;
    	font-weight: bold;
    }
    #info_info{
   		width : 100%;
    	height : 50%;
    	display:flex;
    }
    #infoDate{
    	width :40%;
    	height: 100%;
    	font-size: 14px;
    	padding-top : 15px;
    }
    #needgong{
    	width :30%;
    	height: 100%;
   	}
    #infoLike{
    	width :30%;
    	height: 100%;
    	display:flex;
    }
    #info_like, #info_rep{
    	width : 100%;
    	height: 100%;
    	float: right;
    	padding-top :10px;
    }
    #info_like>img, #info_rep>img{
    	width : 70%;
    	height: 70%;
    	cursor: pointer;
    }
    #info_like>img:hover{
    	width : 71%;
    	height: 73%;
    }
    #info_rep>img:hover{
    	width : 72%;
    	height: 73%;
    }
</style>
</head>
<body>
	<jsp:include page="../../common/header.jsp" />
	
	<c:set value="${ sessionScope.path }" var="path" />
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
		<div class="shop_header">
			<div class="header_search">
			</div>
			<div class="header_category">
				<div class="anmal_category">
					<ul class="nav nav-tabs nav-justified">
						<li class="nav-item" id="A1"><img class="img_dog" src="${sessionScope.path }/resources/img/common/animaldog.png"></li>
						<li class="nav-item" id="A2"><img class="img_cat" src="${sessionScope.path }/resources/img/common/animalcat.png"></li>
						<li class="nav-item" id="A3"><img class="img_rab" src="${sessionScope.path }/resources/img/common/animalrab.png"></li>
						<li class="nav-item" id="A4"><img class="img_fish" src="${sessionScope.path }/resources/img/common/animalfish.png"></li>
						<li class="nav-item" id="A5"><img class="img_bird" src="${sessionScope.path }/resources/img/common/animalbird.png"></li>
						<li class="nav-item" id="A6"><img class="img_ham" src="${sessionScope.path }/resources/img/common/animalham.png"></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div id="needgongan1"></div>
	<div class="info_body">
		<div id="infoList" class="info_wrap">
			<div class="thumbnailImg" id="thumbnailinfo"><img src="${sessionScope.path }/resources/img/profile/profile.png"></div>
			<div class="center_content" id="info-list">
				<div id="infoContent">강아지에게 음식줄 때 피해야 할 것들</div>
				<div id="info_info">
					<div id="infoDate">2024-05-22</div>
					<div id="needgong"></div>
					<div id="infoLike">
						<div id="info_like"><img src="${sessionScope.path }/resources/img/common/like.png"></div>
						<div id="info_rep"><img src="${sessionScope.path }/resources/img/common/reply.png"></div>
					</div>
				</div>
			</div>
	    </div>
	</div>
	<div id="gomain">
		<div class="refresh_btn"><img src="${sessionScope.path }/resources/img/common/refresh.png"></img></div>
		<a href=""><button id="mainbtn">메인으로</button></a>
	</div>
	<script>
	
		// 초기 변수 선언
		let animal='A0',
		category = 'I2', 
		page = 1,
		text = '',
		resultStr = '',
		animalListStr = '';
		
		$(() => {
			
			selectInfoList(animal, category, page);
			
			$('.btnDiv > button').click(() => {
				selectInfoList(animal, category, ++page);
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
				selectInfoList(animal, category, page);
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
				 selectInfoList(animal, category, page);
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
				
		function selectInfoList(animal, category, page){
			
			console.log(animal);
			console.log(category);
			console.log(page);
			
			$.ajax({
				url : 'selectInfoList',
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
						
						resultStr += 
									
					};
					
					$('#like_board').click(function(){
						 var likeNuroom = "${sessionScope.path}/resources/img/common/like2.png";
	                        $('#like_board img').attr('src', likeNuroom);
					})
					
					$('.info_wrap').html(resultStr);
					
					<!--
					$('.center_content').click(function() {
						
						var $infoDetail = $(this).next('.communityDetail');
						var boardNo = $(this).find('input[type="hidden"]').val();
						
						console.log(boardNo);
						location.href = 'infoDetail?boardNo=' + boardNo;
					});
					-->
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