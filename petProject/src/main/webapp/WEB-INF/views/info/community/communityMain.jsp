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
	
	<c:set value="${ sessionScope.path }" var="path" />
	
	<div class="wrap">
	
		<div class="communitySearch">
			<div class="searchContent">
				<input type="text" name="searchContent">
			</div>
			<div class="searchImg">
				<img src="/pet/resources/img/common/searchform.png" alt="검색버튼 사진">
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
		
		<!-- 
		<div class="content_wrap">
		
		</div>
		
		<div class="btnDiv">
			<button>더 보기</button>
		</div>
		 -->
		 
	</div>
	<%--
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
									+ '</div>'
					};
					
					$('.content_wrap').html(resultStr);
					
					$('.communityList').click(function() {
						
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
	 --%>
	
	<jsp:include page="../../common/footer.jsp" />
</body>
</html>