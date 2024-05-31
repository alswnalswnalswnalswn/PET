<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
	<link rel="stylesheet" href="../resources/css/community/communityDetail.css" />
</head>
<body>
	<jsp:include page="../../common/header.jsp" />
	<div id="infooutput">
		<div id="infoheader">
			<div id="infoheader1"><img src="/pet/resources/img/profile/${ infoList[0].memberProfile }" alt="작성자 프사"></div>
			<div id="infoheader2"><span id="infonickName">${ infoList[0].memberNo }</span>님</div>
			<div id="infoheader3">
				
			</div>
			<div id="infoheader4"><span>˚&nbsp;˚&nbsp;˚</span></div>
		</div>
		<div id="boardti">제목 : ${infoList[0].boardTitle }</div>
		
		<div id="myimg">
			<c:forEach var="attachment" items="${ infoList[0].attachmentList }">
				<img src="/pet${attachment.attPath }${attachment.changeName}" alt="첨부사진" />
			</c:forEach>
		</div>
		
		<div id="needgongan4"></div>
		<div id="myinfoContent">
			<span style="font-size: 20px;">
				${infoList[0].boardContent }
			</span>
		</div>
	</div>
	
	<div id="boardLike2">
		<div id="likeboard2"><img src=""><span>(${infoList[0].boardLike})</span></div>
		
		<div id="seeboard2"><span>조회 (${infoList[0].boardCount})</span></div>
		<div id="replyboard2"><img src="${path}/resources/img/common/reply.png"><span>(${infoList[0].sumCount})</span></div>
		<div id="golist">
			<button id="listbtn" onclick="history.back();">이전으로</button>
		</div>
	</div>
	
	<div id="myrep">
		<div id="myreply">
			<div id="ndia">
				<div id="nickna">닉네임</div><div id="daterep">날짜</div>
			</div>
			<div id="repcon">댓글내용</div>
			<div id="btncom">댓글<img src="${path}/resources/img/common/replyarrow.png"></div>
		</div>
		<div id="inscom" style="display:none;">
			<textarea name="comment" id="inscomment" style="resize:none;"></textarea>
			<button id="replybtn">댓글 작성</button>
		</div>
	</div>
	
	<c:choose>
		<c:when test="${ loginUser ne null }">
			<c:set var="loginUserNo" value="${loginUser.memberNo}" />
		</c:when>
		<c:otherwise>
			<c:set var="loginUserNo" value="0" />
		</c:otherwise>
	</c:choose>
	
	

	
	<script>  
	const memberNo = '${sessionScope.loginUser.memberNo}';
	const boardNo = ${info.boardNo};
		$(() => {	
			
			$('#btncom').click(() => {
    			$('#inscom').toggle();
    		});
		
			selectLikeCount(boardNo);
			
			likeCheck();
			
			$().on('click', '#info_like', function() {
				
				if(loginUser === ""){
					alert('로그인 부탁드려욧');
				}
				else{
					var likeNuroom = "/pet/resources/img/common/like2.png";
					var nolikeNuroom = "/pet/resources/img/common/like.png";
		            var likeImg = $(this).find('img').attr('src');
		            
		            if(likeImg == nolikeNuroom){
		            	
		            	$.ajax({
		            		url : '/pet/info/addLikeCount/' + boardNo + '/' + memberNo,
		            		success : result => {
		            			$('#likeCount').text('(' + result + ')');
		            			$(this).find('img').attr('src', likeNuroom);
		            		},
		            		error : result => {
		            			alert('응 안돼요');
		            		}
		            	})
		            	
		            } else {
		            	$.ajax({
		            		url : '/pet/info/removeLikeCount/' + boardNo + '/' + memberNo,
		            		success : result => {
		            			console.log('삭제완료');
		            			$(this).find('img').attr('src', nolikeNuroom);
		            			$('#likeCount').text('(' + result + ')');
		            		},
		            		error : result => {
		            			alert('응 안돼요');
		            		}
		            	})
		            }
				}
               
			});
		});
		
        function selectLikeCount(boardNo){	
        	$.ajax({
        		url : '/pet/info/selectLike/' + boardNo,
        		type : 'get',
        		success : result => {
        			console.log(result);
        			$('#likeCount').html('(' + result + ')');
        		},
        		error : result => {
        			console.log('실패');
        		}
        	});
        }
        
	
        function lickCheck(){
			$.ajax({
				url : 'likeCheck',
				data : {
					boardNo : '${infoList[0].boardNo}',
					memberNo : '${loginUserNo}'
				},
				success : result => {
					console.log(result);
					if(result > 0){
						$('#likeboard2 > img').attr('src', '${path}/resources/img/common/like2.png' )
					}
					else {
						$('#likeboard2 > img').attr('src', '${path}/resources/img/common/like.png' )
					}
				}
			});
		}
		
		
	</script>
	
	
	
	
	
	
	
	<jsp:include page="../../common/footer.jsp" />
	
</body>
</html>