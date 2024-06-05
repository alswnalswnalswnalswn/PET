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
<script src="${sessionScope.path }/resources/script/date.js"></script>
	<jsp:include page="../../common/header.jsp" />
	<c:set value="${ sessionScope.path }" var="path" />
	
	<div id="submenubar">
	
		<div id="searchForm">
			<div id="search">
				<div id="searchcon">
					<input type="text" name="searchContent" id="searchContent"/>
				</div>
				<div id="searchImg">
					<img src="${path}/resources/img/common/searchform.png" alt="" id="searchimg">
				</div>
			</div>
		</div>
		
		<div class="selectctg">
			<div id="select">
				<div id="styleboardform">
					<div id="selectstyle" class="boardCategory">
						<span id="styleboard">글 성격</span>
					</div>
					<div id="boardinfo">
						<span class="category_info" value="I0"># 전체</span><br>
						<span class="category_info" value="I1"># 자유</span><br>
						<span class="category_info" value="I2"># 질문</span><br>
					</div>
				</div>
				<div id="styleaniform">
					<div id="selectani" class="aniCategory">	
						<span id="styleani">반려 동물</span>
					</div>
					<div id="aniinfo">
						<span class="animal_info" value='A0'># 전체</span><br>
						<span class="animal_info" value='A1'># 강아지</span><br>
						<span class="animal_info" value='A2'># 고양이</span><br>
						<span class="animal_info" value='A3'># 토끼</span><br>
						<span class="animal_info" value='A4'># 물고기</span><br>
						<span class="animal_info" value='A5'># 새</span><br>
						<span class="animal_info" value='A6'># 햄스터</span><br>
					</div>
				</div>
			</div>
			
			<div id="line"></div>
		</div>
		
	</div>
	
	<div id="needgongan"></div>
		<div class="content_wrap" id="boardoutput"></div>
			
	<div id="gomain">
		<button id="showMore" class="mainbtn">더 보기</button>
		<button class="mainbtn">메인으로</button>
		<c:if test="${sessionScope.loginUser ne null }">
			<button onclick="location.href='insertCommunityForm'" class="mainbtn">글쓰기</button>
		</c:if>
	</div>
	
	
	<script>
	
		// 초기 변수 선언
		let animal='A0',
		category = 'I0', 
		page = 1,
		text = '',
		resultStr = '',
		animalListStr = '';
		
		function selectCommunityList(animal, category, page){
			
			console.log(animal);
			console.log(category);
			console.log(page);
			
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
						let createDate = result[i].createDate.date;
						var fullDate = new Date(createDate.year, createDate.month - 1, createDate.day);
						var animalListStr = '';
						var animalListResult = result[i].animalList;
						
						for(let i in animalListResult){
							animalListStr += '<div class="animalAndCategory">' 
										  + animalListResult[i].animalName
										  + '</div>'
						}
						
						animalListStr += '<br clear="both">';
						
						resultStr += '<div id="myboard" class="communityList">'
										+ '<div class="thumbnailImg" id="thumbnail"><img src="/pet/';
										if(result[i].attachmentList[0].attNo != 0){
											resultStr += result[i].attachmentList[0].attPath  + result[i].attachmentList[0].changeName;
										}
										else {
											resultStr += 'resources/img/profile/profile.png"';
										}
						resultStr 		+= '"></div>'
										+ '<div class="center_content" id="boardlist">'
										+ '<input type="hidden" value="' + result[i].boardNo + '">'
											+ '<div id="boardheader">'
												+ '<div class="content_writer" id="boardme">' + result[i].memberNo + '</div>'
												+ '<div id="myboardAni"><span class="category" id="myani">' + animalListStr + '</span></div>'
												+ '<div class="create_date" id="boardCreate">' + dateFormat(fullDate) + '</div>'
											+ '</div>'
											+ '<div class="board_Title" id="boardtitle">' + result[i].boardTitle + '</div>'
											+ '<div class="content_text" id="boardcontent">' + result[i].boardContent + '</div>'
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
						 var a = "${sessionScope.path}/resources/img/common/like2.png";
	                        $('#like_board img').attr('src', a);
					})
					
					$('.content_wrap').html(resultStr);
					
					$('.center_content').click(function() {
						
						var $communityDetail = $(this).next('.communityDetail');
						var boardNo = $(this).find('input[type="hidden"]').val();
						
						location.href = 'communityDetail/' + boardNo;
					});
					
					if(result[0].pageInfo.currentPage != result[0].pageInfo.maxPage){
						$('#showMore').css('display', 'block');
					}
					else{
						$('#showMore').css('display', 'none');
					}
				}
			});
		}
		
		
		$(() => {
			
			selectCommunityList(animal, category, page);
			
			$('.category_info').click(function(){
				
				var categoryInfo = $(this).attr("value");
				category = categoryInfo;
				
				resultStr = '';
				page = 1;
				selectCommunityList(animal, category, page);
				
				$('#styleboard').text($(this).text().replace(/[# ]/g, ''));
				$('#boardinfo').css('display', 'none');
				
			});
			
			$('.animal_info').click(function(){
				
				var animalInfo = $(this).attr("value");
				animal = animalInfo;
				
				resultStr = '';
				page = 1;
				selectCommunityList(animal, category, page);
				
				$('#styleani').text($(this).text().replace(/[# ]/g, ''));
				$('#aniinfo').css('display', 'none');
				
			});
			
			$('.boardCategory').click(function(){
				$('#aniinfo').css('display', 'none');
			    $('#boardinfo').toggle();
			});
			
			$('.aniCategory').click(function(){
				$('#boardinfo').css('display', 'none');
			    $('#aniinfo').toggle();
			});
			
			$('#btncom').click(function(){
				$('#inscom').toggle();
			});
			
			$('#showMore').click(() => {
				selectCommunityList(animal, category, ++page);
			});
		});
		
				
		
	
		
	</script>
	
	
	<jsp:include page="../../common/footer.jsp" />
</body>
</html>