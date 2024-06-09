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

	<script src="${sessionScope.path }/resources/script/date.js" />
	<jsp:include page="../../common/header.jsp" />
	<c:set value="${ sessionScope.path }" var="path" />
	
	<div class="wrap">
	
		<div id="community_header">
		
			<div id="left_header">
				<div class="searchKeyword">
					<input type="text" />
				</div>
				<div class="searchImage">
					<img src="${path}/resources/img/common/searchform.png" alt="검색이미지">
				</div>
			</div>
			
			<div id="right_header">

				<div class="btn-group boardCategory">

					<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
						글 성격
					</button>
					<div class="dropdown-menu">
						<div class="dropdown-item" value="I0">#전체</div>
						<div class="dropdown-item" value="I1">#자유</div>
						<div class="dropdown-item" value="I2">#질문</div>
					</div>
					
				</div>
				
				<div class="btn-group animalCategory">

					<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
						반려동물
					</button>
					<div class="dropdown-menu">
						<div class="dropdown-item" value="A0">#전체</div>
						<div class="dropdown-item" value="A1">#강아지</div>
						<div class="dropdown-item" value="A2">#고양이</div>
						<div class="dropdown-item" value="A3">#토끼</div>
						<div class="dropdown-item" value="A4">#물고기</div>
						<div class="dropdown-item" value="A5">#새</div>
						<div class="dropdown-item" value="A6">#햄스터</div>
					</div>
				</div>
			</div>
		</div>
		
		<div id="community_content_wrap">
			
		</div>
		
		<div id="subMenu">
			<button id="showMore" class="mainbtn">더 보기</button>
			<button class="mainbtn">메인으로</button>
			<c:if test="${sessionScope.loginUser ne null }">
				<button onclick="location.href='insertCommunityForm'" class="mainbtn">글쓰기</button>
			</c:if>
		</div>
	
	</div>
	
	<script>
		// 초기 변수 선언
		let animal='A0',
		category = 'I0', 
		page = 1,
		text = '',
		resultStr = '',
		animalStr = '',
		attStr = '';
		
		$(() => {
			
			selectCommunityList(animal, category, page);
			
			$('.dropdown-item').click(function(){
				var dropdownName = $(this).text().substring(1);
				var dropdownCode = $(this).attr('value');
				
				if(dropdownCode.substring(0,1) == 'A'){
					animal = dropdownCode;
				}
				else {
					category = dropdownCode;
				}
				
				$(this).closest('.btn-group').find('.btn').html(dropdownName);
				
				selectCommunityList(animal, category, page);
				
			});
			
			$('#community_content_wrap').on('click', '.community_content', e => {
				var boardNo = $(e.currentTarget).attr('id');
				location.href = 'communityDetail/' + boardNo;
			});
			
			$('#showMore').click(() => {
				selectCommunityList(animal, category, ++page);
			});
			
		});
		
		function selectCommunityList(animal, category, page){
			
			$.ajax({
				url : 'communities',
				data : {
					animal : animal,
					category : category,
					page : page
				},
				success : result => {
					console.log(result);
					
					for(let i in result){
						
						// 썸네일
						var attList = result[i].attachmentList;
						if(attList.length > 0){
							attStr = '<div class="thumbnailImg"><img src="${sessionScope.path}' + attList[0].attPath + attList[0].changeName + '"></div>'
						}
						else {
							attStr = '<div class="thumbnailImg"><img src="${sessionScope.path}/resources/img/profile/profile.png"></div>'
						}
						
						// 동물 리스트
						var animalListResult = result[i].animalList;
						animalStr ='';
						for(let j in animalListResult){
							
							animalStr += '<div class="animalAndCategory">' 
										  + animalListResult[j].animalName
									  + '</div>'
						}
						
						// 게시글 등록일
						let createDate = result[i].createDate.date;
						var fullDate = new Date(createDate.year, createDate.month - 1, createDate.day);
						
						resultStr += '<div class="community_content" id="' + result[i].boardNo + '">'
									   + attStr
									   + '<div class="community_result row">'
										   + '<div class="boardWriter col-sm-2">' + result[i].memberNo + '</div>'
										   + '<div class="animalListStr col-sm-7">' + animalStr + '</div>'
										   + '<div class="createDate col-sm-3">' + dateFormat(fullDate) + '</div>'
										   + '<div class="boardTitle col-sm-12">' + result[i].boardTitle + '</div>'
										   + '<div class="boardContent col-sm-12">' + result[i].boardContent + '</div>'
									   + '</div>'
									   
									   + '<div class="about_result">'
									   	   + '<div class="like">'
											   + '<div class="likeImg"><img src="${sessionScope.path}/resources/img/common/like.png"></div>'
											   + '<div class="likeCount">(' + result[i].boardLike + ')</div>'
										   + '</div>'
										   + '<div class="boardCount">'
											   + '<div class="boardCountName"><img src="${sessionScope.path}/resources/img/common/like2.png"></div>'
											   + '<div class="boardCountResult">(' + result[i].boardCount + ')</div>'
										   + '</div>'
										   + '<div class="reply">'
											   + '<div class="replyImg"><img src="${sessionScope.path}/resources/img/common/reply.png"></div>'
											   + '<div class="replyCount">(' + result[i].sumCount + ')</div>'
										   + '</div>'
									   + '</div>'
								   + '</div>'
								   
						$('#community_content_wrap').html(resultStr);
						
						if(result[0].pageInfo.currentPage != result[0].pageInfo.maxPage){
							$('#showMore').css('display', 'block');
						}
						else{
							$('#showMore').css('display', 'none');
						}
					}
				}
				
			});
		}
		
		
		
		
				
		
	
		
	</script>
	
	
	<jsp:include page="../../common/footer.jsp" />
</body>
</html>