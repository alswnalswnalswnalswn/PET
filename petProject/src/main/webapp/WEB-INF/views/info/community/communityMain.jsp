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
	
		<div class="community_header">
			<div class="searchCategory">
				<select>
					<option name="searchAll">전체</option>
					<option name="title">제목</option>
					<option name="content">내용</option>
				</select>
				<input type="text" class="form-control" placeholder="검색어를 입력해주세요">
				<button class="btn btn-primary" type="button">검색</button>
			</div>
		</div>
			
		<div class="blank_div"></div>
		
		<div class="selectCategory">
			<div class="board_category">
				<button type="button" class="btn btn-light" id="I0">전체</button>
				<button type="button" class="btn btn-light" id="I1">자유</button>
				<button type="button" class="btn btn-light" id="I2">질문</button>
			</div>
			
			<br clear="both">
			
			<div class="anmal_category">
				<img class='categoryImg ' src='${path}/resources/img/animaldog.png'>
				<img class='categoryImg cat' src='${path}/resources/img/animalcat.png'>
				<img class='categoryImg rab' src='${path}/resources/img/animalrab.png'>
				<img class='categoryImg fish' src='${path}/resources/img/animalfish.png'>
				<img class='categoryImg bird' src='${path}/resources/img/animalbird.png'>
				<img class='categoryImg ham' src='${path}/resources/img/animalham.png'>
			</div>
		</div>
		
		<br clear="both">
		
		<div class="content_wrap"></div>
		
		<div class="btnDiv">
			<button>더 보기</button>
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
											+ '<div class="cr_detail"><img src="resources/img/like.png"><div>좋아요 : ' + result[i].boardLike + '</div></div>'
											+ '<div class="cr_detail"><img src="resources/img/reply.png"><div>댓글 : ' + result[i].sumCount + '</div></div>'
											+ '<div class="cr_detail"><img src="resources/img/searchform.png"><div>조회수 : ' + result[i].boardCount + '</div></div>'
										+ '</div>'
									+ '</div>'
					};
					
					$('.content_wrap').html(resultStr);
					
					$('.communityList').click(function() {
						
						var $communityDetail = $(this).next('.communityDetail');
						var boardNo = $(this).find('input[type="hidden"]').val();
						
						console.log(boardNo);
						//location.href = 'communityDetail?boardNo=' + boardNo;
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