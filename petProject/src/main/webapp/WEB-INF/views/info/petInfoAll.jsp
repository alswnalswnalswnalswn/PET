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
<title>지식</title>
	<link rel="stylesheet" href="../resources/css/info/petInfoAll.css" />
	<link rel="stylesheet" href="../resources/css/info/searchForm.css" />	
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	
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
												+ '<input type="hidden" name="boardNo" value="' + result[i].boardNo + '" />'
												+ '<div id="infoTitle">' + result[i].boardTitle + '</div>'
												+ '<div id="info_info">'
													+ '<div id="infoDate">' + dateFormat(fullDate) + '</div>'
													+ '<div id="infoLike">'
														+ '<div id="info_like" class="like"><img src="${sessionScope.path }/resources/img/common/like.png"></div>'
														+ '<div id="info_rep"><img src="${sessionScope.path }/resources/img/common/reply.png"></div>'
													+ '</div>'
												+ '</div>'
											+ '</div>'
										+ '</div>'
									+ '</div>'
					}
					$(document).on('click', '#info_like', function() {
						 var likeNuroom = "${sessionScope.path}/resources/img/common/like2.png";
						 var nolikeNuroom = "${sessionScope.path}/resources/img/common/like.png";
	                     var likeImg = $(this).find('img').attr('src');
	                     
	                     if(likeImg == likeNuroom){
	                    	 $(this).find('img').attr('src', nolikeNuroom);
	                     } else {
	                    	 $(this).find('img').attr('src', likeNuroom);
	                     }
	                        
					});
					$('.row').html(resultStr);

					$('#infoTitle, #thumbnailinfo').on('click', function() {
						var boardNo = $('input[name="boardNo"]').val();
						location.href='${sessionScope.path}/info/infoDetail/' + boardNo;
						console.log(boardNo);
					});
					
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
	
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>