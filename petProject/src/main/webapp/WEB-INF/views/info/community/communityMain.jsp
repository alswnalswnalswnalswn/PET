<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티</title>
	<link rel="stylesheet" href="resources/css/community/communityMain.css" />
</head>
<body>
	<jsp:include page="../../common/header.jsp" />
	
	<div class="wrap">
		
		<div>
		
			<div>
				<div class="input-group mt-3 mb-3">
					<div class="input-group-prepend">
						<button type="button" class="btn btn-outline-secondary dropdown-toggle" data-toggle="dropdown">검색 설정</button>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="#">전체</a> 
							<a class="dropdown-item" href="#">글 제목</a> 
							<a class="dropdown-item" href="#">글 내용</a>
						</div>
					</div>
					<input type="text" class="form-control">
					<button class="btn btn-primary" type="button">검색</button>
				</div>
			</div>
			
			<div>
				<div class="btn-group">
					<div class="btn-group">
						<button id="selectCategory" type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" value="categoryAll">게시판 선택</button>
						<div class="dropdown-menu">
							<button class="dropdown-item category" onclick="searchCategory(this);" value="categoryAll">전체</button> 
							<button class="dropdown-item category" onclick="searchCategory(this);" value="I1">자유게시판</button> 
							<button class="dropdown-item category" onclick="searchCategory(this);" value="I2">질문게시판</button>
						</div>
					</div>
					<div class="btn-group">
						<button id="selectAnimal" type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" value="animalAll">동물 선택</button>
						<div class="dropdown-menu">
							<button class="dropdown-item" onclick="searchAnimal(this);" value="animalAll">전체</button> 
							<button class="dropdown-item" onclick="searchAnimal(this);" value="A1">강아지</button> 
							<button class="dropdown-item" onclick="searchAnimal(this);" value="A2">고양이</button>
							<button class="dropdown-item" onclick="searchAnimal(this);" value="A3">토끼</button>
							<button class="dropdown-item" onclick="searchAnimal(this);" value="A4">물고기</button>
							<button class="dropdown-item" onclick="searchAnimal(this);" value="A5">새</button>
							<button class="dropdown-item" onclick="searchAnimal(this);" value="A6">햄스터</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="content_wrap">
				
		</div>
		
		<div class="btnDiv">
			
		</div>


	</div>
	
	<script>
	
		$(() => {
			ajaxTest('A0', 'I0', 1);
		});
		
		// 초기 변수 선언
		var $selectCategory = $('#selectCategory');
		var $selectAnimal = $('#selectAnimal');	
		var categoryVal, animalVal = '';
		var categoryText, animalText = '';
		var page = 1;

		function searchCategory(result){
			
			categoryVal = $(result).val();
			categoryText = $(result).text();
			
			$selectCategory.text(categoryText);
			ajaxTest(animalVal, categoryVal, 1);
		}
		
		function searchAnimal(result){
			
			animalVal = $(result).val();
			animalText = $(result).text();
			
			$selectAnimal.text(animalText);
			ajaxTest(animalVal, categoryVal, 1);
		}
		
		
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
		
		
		
		
		
		
		
		
		
		function ajaxTest(animal, category, page){
			$.ajax({
				url : 'selectCommunityList',
				data : {
					animal : animal,
					category : category,
					page : page
				},
				success : result => {
					// console.log(result);
					
					var str = '';
					
					for(let i in result){
						
						var animalListStr = '';
						
						var animalListResult = result[i].animalList;
						
						for(let i in animalListResult){
							animalListStr += '<div class="animalAndCategory">' 
										  + animalListResult[i].animalName
										  + '</div>'
						}
						animalListStr += '<br clear="both">';
						
						str += '<div class= "ajaxWrap">'
							+ '<div class="left_header"><img width="100%" height="100%" src="resources/img/heart.png">'
							+ '</div>'
							+ '<input type="hidden" value="' + result[i].boardNo + '">'
							+ '<div class= "center_content">'
							+ '<div class="content_writer">' + result[i].memberNo + '</div>'
							+ animalListStr
							+ '<div class="board_Title">' + result[i].boardTitle + '</div>'
							+ '<div class="content_text">' + result[i].boardContent + '</div>'
							+ '<div class="create_date">' + result[i].boardCreateDate + '</div>'
							+ '</div>'
							+ '<div class="content_reaction">'
							+ '<div class="cr_detail"><img src="resources/img/like.png"><div>좋아요 : ' + result[i].boardLike + '</div></div>'
							+ '<div class="cr_detail"><img src="resources/img/reply.png"><div>댓글 : ' + result[i].sumCount + '</div></div>'
							+ '<div class="cr_detail"><img src="resources/img/searchform.png"><div>조회수 : ' + result[i].boardCount + '</div></div>'
							+ '</div>'
							+ '</div>'
							+ '<div class="ajaxDetail"></div>'
					};
					
					$('.content_wrap').html(str);
					
					if(result[0].pageInfo.currentPage != result[0].pageInfo.maxPage){
						$('.btnDiv').html('<button id="showMoreBtn" onclick="showMore();">더 보기</button>');
					}
					else{
						$('.btnDiv').html('');
					}

					$('.ajaxWrap').click(function() {
						
						
						var $ajaxDetail = $(this).next('.ajaxDetail'),
						boardNo = $(this).find('input[type="hidden"]').val();
						
						console.log(boardNo);
						//location.href = 'communityDetail?boardNo=' + boardNo;
							/*
						$.ajax({
							url : 'communityDetail',
							data: {
								boardNo: $(this).find('input[type="hidden"]').val()
							},
							success: result => {
								console.log(result);
								
								let detailStr = '<marquee>123</marquee>';
								
								
								$ajaxDetail.html(detailStr);
								
								if($ajaxDetail.css('display') == 'none'){

				                   $ajaxDetail.siblings('.ajaxDetail').slideUp(1000);
				                   $ajaxDetail.siblings('.ajaxDetail').text('');

				                   $ajaxDetail.slideDown(1000);
				                }
				                else{
				                	$ajaxDetail.slideUp(1000);
				                	$ajaxDetail.text('');
				                }
							}
						});
						*/
					});
				}
			});
		}
		
		function showMore(animal, category){
			$.ajax({
				url : 'selectCommunityList',
				data : {
					page : ++page,
					animal : animal,
					category : category
				},
				success : result => {
					// console.log(result);
					
					var str = '';
					
					for(let i in result){
						
						var animalListStr = '';
						
						var animalListResult = result[i].animalList;
						
						for(let i in animalListResult){
							animalListStr += '<div class="animalAndCategory">' 
										  + animalListResult[i].animalName
										  + '</div>'
						}
						animalListStr += '<br clear="both">';
						
						str += '<div class= "ajaxWrap">'
							+ '<div class="left_header"><img width="100%" height="100%" src="resources/img/heart.png">'
							+ '</div>'
							+ '<input type="hidden" value="' + result[i].boardNo + '">'
							+ '<div class= "center_content">'
							+ '<div class="content_writer">' + result[i].memberNo + '</div>'
							+ animalListStr
							+ '<div class="board_Title">' + result[i].boardTitle + '</div>'
							+ '<div class="content_text">' + result[i].boardContent + '</div>'
							+ '<div class="create_date">' + result[i].boardCreateDate + '</div>'
							+ '</div>'
							+ '<div class="content_reaction">'
							+ '<div class="cr_detail"><img src="resources/img/like.png"><div>좋아요 : ' + result[i].boardLike + '</div></div>'
							+ '<div class="cr_detail"><img src="resources/img/reply.png"><div>댓글 : ' + result[i].sumCount + '</div></div>'
							+ '<div class="cr_detail"><img src="resources/img/searchform.png"><div>조회수 : ' + result[i].boardCount + '</div></div>'
							+ '</div>'
							+ '</div>'
							+ '<div class="ajaxDetail"></div>'
					};
					
					$('.content_wrap').append(str);
					
					if(result[0].pageInfo.currentPage != result[0].pageInfo.maxPage){
						$('.btnDiv').html('<button id="showMoreBtn" onclick="showMore();">더 보기</button>');
					}
					else{
						$('.btnDiv').html('');
					}
					
					$('.ajaxWrap').click(function() {

						var $ajaxDetail = $(this).next('.ajaxDetail'),
						boardNo = $(this).find('input[type="hidden"]').val();
						
					});
						
				}
			});
		}
		
		
	</script>
	
	
	<jsp:include page="../../common/footer.jsp" />
</body>
</html>