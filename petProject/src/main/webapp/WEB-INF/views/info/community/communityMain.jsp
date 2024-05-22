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
	#needgongan{
		width :1200px;
		height: 50px;
		margin :auto;
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
		<div class="btnDiv"><button>더 보기</button></div>
		<a href=""><button id="mainbtn">메인으로</button></a>
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
			     $('#boardinfo').toggle();
			});
			
			$('.aniCategory').click(function(){
			    $('#aniinfo').toggle();
			});
			$('#btncom').click(function(){
				$('#inscom').toggle();
			});
			
			$('.btnDiv > button').click(() => {
				selectCommunityList(animal, category, ++page);
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
		});
		
	</script>
	
	
	<jsp:include page="../../common/footer.jsp" />
</body>
</html>