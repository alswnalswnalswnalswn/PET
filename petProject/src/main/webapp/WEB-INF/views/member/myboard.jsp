<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 쓴 게시글</title>
		<link rel="stylesheet" href="${ sessionScope.path }/resources/css/info/myBoard.css" />
</head>
<body>
<script src="${sessionScope.path }/resources/script/date.js"></script>
	<jsp:include page="../common/header.jsp" />
	
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
	
	<div id="needgongan1"></div>
		<div class="content_wrap" id="boardoutput">
			<input type="hidden" name="boardNo" id="boardNoOne" />
		</div>
			
	<div id="gomain">
		<div class="btnDiv"><button>더 보기</button></div>
		<a href="${sessionScope.path }"><button id="mainbtn">메인으로</button></a>
	</div>
	
	<script>
	
		// 초기 변수 선언
		let animal='A0',
		category = 'I0', 
		page = 1,
		text = '',
		resultStr = '',
		animalListStr = '',
		memberNo = '${sessionScope.loginUser.memberNo}';
		
		
		$(() => {
			selectMyBoard(animal, category, page, memberNo);
			
			
			$('.category_info').click( e => {
				
				var categoryInfo = $(e.currentTarget).attr("value");
				category = categoryInfo;
				
				resultStr = '';
				page = 1;
				selectMyBoard(animal, category, page, memberNo);
				
				$('#styleboard').text($(e.currentTarget).text().replace(/[# ]/g, ''));
				$('#boardinfo').css('display', 'none');
				
			});
			
			$('.animal_info').click( e => {
				
				var animalInfo = $(e.currentTarget).attr("value");
				animal = animalInfo;
				
				resultStr = '';
				page = 1;
				selectMyBoard(animal, category, page, memberNo);
				
				$('#styleani').text($(e.currentTarget).text().replace(/[# ]/g, ''));
				$('#aniinfo').css('display', 'none');
				
			});
			
			$('.boardCategory').click(() => {
			     $('#boardinfo').toggle();
			});
			
			$('.aniCategory').click(() => {
			    $('#aniinfo').toggle();
			});
			$('#btncom').click(() => {
				$('#inscom').toggle();
			});
			
			$('.btnDiv > button').click(() => {
				selectMyBoard(animal, category, ++page, memberNo);
			});
				
		function selectMyBoard(animal, category, page, memberNo){
			
			$.ajax({
				url : 'selectMyBoard',
				data : {
					animal : animal,
					category : category,
					page : page,
					memberNo : memberNo
				},
				success : result => {
					console.log(result);
					if(result.length === 0){
						resultStr += '<div id="myboard" class="communityList">작성한 게시글이 없습니다.</div>';
						$('.content_wrap').html(resultStr);
						$('.btnDiv').css('display', 'none');
					}	
					for(let i in result){
						$('#boardNoOne').val(result[i].boardNo);
						var animalListStr = '';
						var animalListResult = result[i].animalList;
						var maxLength = 70; // 최대 글자수 설정
						var boardContent = result[i].boardContent;
						let createDate = result[i].createDate.date;
						var fullDate = new Date(createDate.year, createDate.month - 1, createDate.day);

						// 글자수가 최대 길이보다 크다면 초과 부분을 생략하여 표시
						if (boardContent.length > maxLength) {
						    boardContent = boardContent.substring(0, maxLength) + '...';
						}
						
						for(let i in animalListResult){
							animalListStr += '<div class="animalAndCategory">' 
										  + animalListResult[i].animalName
										  + '</div>'
						}
						
						animalListStr += '<br clear="both">';

						resultStr += '<div id="myboard" class="communityList">'
										+ '<div class="thumbnailImg" id="thumbnail"><img src="'
										+ '${sessionScope.path}/' + result[i].attachmentList[0].attPath + result[i].attachmentList[0].changeName
										+ '"></div>'
										+ '<div class="center_content" id="boardlist">'
										+ '<input type="hidden" name="boardNo" value="' + result[i].boardNo + '">'
											+ '<div id="boardheader">'
												+ '<div class="content_writer" id="boardme">' + result[i].memberNo + '</div>'
												+ '<div id="myboardAni"><span class="category" id="myani">' + animalListStr + '</span></div>'
												+ '<div class="create_date" id="boardCreate">' + dateFormat(fullDate) + '</div>'
											+ '</div>'
											+ '<div class="board_Title" id="boardtitle">' + result[i].boardTitle + '</div>'
											+ '<div class="content_text" id="boardcontent">' + boardContent + '</div>'
										+ '</div>'
											+ '<div class="content_reaction" id="boardLike">'
												+ '<div id="likeinfo"><button id="detailbtn">&nbsp;&nbsp;&nbsp;˚&nbsp;˚&nbsp;˚</button></div>';
									if(result[i].likeCheck == 1){		
										resultStr += '<div id="likeboard" class="likeboard">'
												+ '<input type="hidden" name="boardNo" value="' + result[i].boardNo + '">'
												+ '<img id="like_board" src="${sessionScope.path }/resources/img/common/like2.png">&nbsp;&nbsp;<span class="howLike">(' + result[i].boardLike + ')</span></div>';
									} else {
										resultStr += '<div id="likeboard" class="likeboard">'
											+ '<input type="hidden" name="boardNo" value="' + result[i].boardNo + '">'
											+ '<img id="like_board" src="${sessionScope.path }/resources/img/common/like.png">&nbsp;&nbsp;<span class="howLike">(' + result[i].boardLike + ')</span></div>';
									}
										resultStr += '<div id="seeboard"><span>조회</span>&nbsp;&nbsp;&nbsp;(' + result[i].sumCount + ')</div>'
												+ '<div id="replyboard"><img src="${sessionScope.path }/resources/img/common/reply.png">&nbsp;&nbsp;(' + result[i].boardCount + ')</div>'
											+ '</div>'
									+ '</div>';
					
					};
					if(result[0].pageInfo.currentPage != result[0].pageInfo.maxPage){
						$('.btnDiv').css('display', 'block');
					}
					else{
						$('.btnDiv').css('display', 'none');
					}
					
					$('.content_wrap').html(resultStr);
					
					$('.center_content').click( e => {
						
						var $communityDetail = $(e.currentTarget).next('.communityDetail');
						var boardNo = $(e.currentTarget).find('input[type="hidden"]').val();
						
						location.href = '/pet/communityDetail/' + boardNo;
					});
					
					$('.likeboard').on('click', e => {
						var boardNo = $(e.currentTarget).find('input[name="boardNo"]').val();
						if(memberNo === ""){
							alert('로그인 부탁드려욧');
						}
						else{
							var likeNuroom = "${sessionScope.path}/resources/img/common/like2.png";
							var nolikeNuroom = "${sessionScope.path}/resources/img/common/like.png";
				            var likeImg = $(e.currentTarget).children('img').attr('src');
				            if(likeImg == nolikeNuroom){
				            	$.ajax({
				            		url : '/pet/info/addLikeCount/' + boardNo + '/' + memberNo,
				            		success : result => {
				            			console.log(result);
				            			$(e.currentTarget).children('img').attr('src', likeNuroom);
				            			$(e.currentTarget).find('.howLike').text('(' + result + ')');
				            		},
				            		error : result => {
				            			alert('응 안돼요');
				            		}
				            	})
				            	
				            } else {
				            	$.ajax({
				            		url : '/pet/info/removeLikeCount/' + boardNo + '/' + memberNo,
				            		success : result => {
				            			console.log(result);
				            			$(e.currentTarget).children('img').attr('src', nolikeNuroom);
				            			$(e.currentTarget).find('.howLike').text('(' + result + ')');
				            		},
				            		error : result => {
				            			alert('응 안돼요');
				            		}
				            	})
				            }
						}
		               
					});
				}
			});
		}
        function selectLike(boardNo){
			var likeNuroom = "${sessionScope.path}/resources/img/common/like2.png";
			var nolikeNuroom = "${sessionScope.path}/resources/img/common/like.png";
        	$.ajax({
        		url : '/pet/info/selectLike/' + boardNo,
        		type : 'get',
        		success : result => {
        			if(result > 0){
        				$('.likeboard').find('img').attr('src', likeNuroom);
        			} else {
        				$('.likeboard').find('img').attr('src', nolikeNuroom);
        			}
        		},
        		error : result => {
        			console.log('실패');
        		}
        	});
        }
		});
		
	</script>
	
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>