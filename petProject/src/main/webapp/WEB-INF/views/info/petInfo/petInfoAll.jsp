<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<title>커뮤니티</title>
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
	#w3sThk{
		width: 1200px;
	}
	.info_body{
		width : 1200px;
		margin : auto;
	}
    #infoList{
    	width :250px;
    	height: 350px;
    	border: 1px solid rgb(233, 231, 231);
    	border-radius: 10px;
    }
    #infoList:hover{
    	box-shadow : 0 15px 20px rgb(168, 167, 167);
    }
    #thumbnailinfo{
    	width : 100%;
    	height: 250px;
        overflow: hidden;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    #thumbnailinfo > img{
    	width : 95%;
    	height: 95%;
    	margin : 2.5% 0 0 2.5%;
    	border: 1px solid rgb(233, 231, 231);
    	border-radius: 20px;
    	object-fit: cover;  
    }
    #info-list{
    	width : 100%;
    	height : 100px;
    }
    #infoTitle{
    	width : 100%;
    	height : 50%;
    	font-size: 15px;
    	font-weight: bold;
    	text-align : center;
    }
    #info_info{
   		width : 100%;
    	height : 50%;
    }
    #infoDate{
    	width :40%;
    	height: 100%;
    	font-size: 14px;
    	padding-top : 15px;
    	float: left;
    }
    #needgong{
    	width :30%;
    	height: 100%;
   	}
    #infoLike{
    	width :60%;
    	height: 30px;
    	display:flex;
    }
    #info_like, #info_rep{
    	width : 30px;
    	height: 30px;
    	float: right;
    	padding-top :10px;
    }
    #info_like>img, #info_rep>img{
    	width : 30px;
    	height: 30px;
    	cursor: pointer;
    }
    #info_like>img:hover{
    	width :32px;
    	height: 32px;
    }
    #info_rep>img:hover{
    	width : 32px;
    	height: 32px;
    }
    #oneline_info{
    	width :100%;
    	height : 350px;
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
		 <div id="w3sThk" class="row">
		 
		 </div>
	</div>
	<div id="gomain">
		<div class="refresh_btn"><img src="${sessionScope.path }/resources/img/common/refresh.png"></img></div>
		<a href=""><button id="mainbtn">메인으로</button></a>
	</div>
	<script>
	
	function dateFormat(date) {
        let month = date.getMonth() + 1;
        let day = date.getDate();

        month = month >= 10 ? month : '0' + month;
        day = day >= 10 ? day : '0' + day;

        return date.getFullYear() + '-' + month + '-' + day;
    	        
	}
	
	
	
		// 초기 변수 선언
		let animal='A0',
		page = 1,
		text = '',
		resultStr = '',
		animalListStr = '';
		
		$(() => {
			
			selectInfoList(animal, page);
			
			$('.refresh_btn > img').click(() => {
				selectInfoList(animal, ++page);
			});
			
			$('.nav-item').click(function(){
				
				animal = $(this).attr('id');
				console.log(animal);
				resultStr = '';
				page = 1;
				selectInfoList(animal, page);
		    });
			
		});
				
		function selectInfoList(animal, page){
			
			console.log(animal);
			console.log(page);

			$.ajax({
				url : 'selectInfoList',
				data : {
					animal : animal,
					page : page
				},
				success : result => {
					console.log(result);
					//console.log(result[0].attachmentList[0].attPath + result[0].attachmentList[0].changeName);
					for(let i in result){
						
						let createDate = result[i].createDate.date;
						var fullDate = new Date(createDate.year, createDate.month - 1, createDate.day);
						resultStr += '<div class="col-sm-3">'
								   		+ '<div id="infoList" class="info_wrap">'
											+ '<div class="thumbnailImg" id="thumbnailinfo"><img src="${sessionScope.path }/' + result[i].attachmentList[0].attPath + result[i].attachmentList[0].changeName + '"></div>'
											+ '<div class="center_content" id="info-list">'
												+ '<input type="hidden" value="' + result[i].boardNo + '" />'
												+ '<div id="infoTitle">' + result[i].boardTitle + '</div>'
												+ '<div id="info_info">'
													+ '<div id="infoDate">' + dateFormat(fullDate) + '</div>'
													+ '<div id="infoLike">'
														+ '<div id="info_like"><img src="${sessionScope.path }/resources/img/common/like.png"></div>'
														+ '<div id="info_rep"><img src="${sessionScope.path }/resources/img/common/reply.png"></div>'
													+ '</div>'
												+ '</div>'
											+ '</div>'
										+ '</div>'
									+ '</div>'
					}
					$(document).on('click', '#info_like', function() {
						 var likeNuroom = "${sessionScope.path}/resources/img/common/like2.png";
	                        $(this).find('img').attr('src', likeNuroom);
					});
					$('.row').html(resultStr);
					
					<!--
					$('.center_content').click(function() {
						
						var $infoDetail = $(this).next('.infoDetail');
						var boardNo = $(this).find('input[type="hidden"]').val();
						
						console.log(boardNo);
						location.href = 'infoDetail?boardNo=' + boardNo;s
					});
					-->
					if(result[0].pageInfo.currentPage != result[0].pageInfo.maxPage){
						$('.refresh_btn').css('display', 'block');
					}
					else{
						$('.refresh_btn').css('display', 'none');
					}
	
					},
					error : result => {
					
					console.log('실패');
					}
				});		
			};
			
			
		
	</script>
	
	
	<jsp:include page="../../common/footer.jsp" />
</body>
</html>