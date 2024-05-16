<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=265dcb92e33a3dc46e2d0249640f425e"></script>
<meta charset="UTF-8">
<title>데이트 게시판</title>
<style>
#wrap {
	width: 1200px;
	height: 1000px;
	margin: auto;
	position: relative;
}

#menu_wrap{
	position: absolute;
	left:0;
	top:0;
	height:500px;
	width:300px;
	background: rgb(255,255,255);
	overflow: auto;
	
}
#menu_detail{
	position: absolute;
	left:300px;
	top:0;
	height:500px;
	width:500px;
	background: rgb(255,255,255);
	overflow-y: auto;
	padding: 15px;
    border: 1px solid gray;
    display:none;
}
.items{
	margin: 20px 20px;
	border:1px solid black;
}
#btn-area{
	position: relative;
}

.date-btn{
   position: absolute;
   border: 1px solid black;
   right: 15px;
}
.menu_head{
            width: 100%;
            height: 20%;
            font-size: 20px;
            font-weight: bold;
            line-height: 45px;
            border-bottom: 1px solid gray;
        }
        .menu_title{
            float: left;
            width: 95%;
        }
        .menu_heads{
            height: 50%;
        }
        .heads_content{
            float: left;
            height: 100%;
            width: 50%;
            
        }
        .heads_content > div{
            height: 50%;
            font-size: 15px;
            line-height: 20px;
        }
        .heads_content > div > div{
            font-size: 13px;
            font-weight: 100;
            color: gray;
        }    

        .menu_create_date{
            float: left;
            height: 100%;
            width: 100%;
        }

        .menu_content{
            margin-bottom: 20px;
            height: 300px;
            width: 100%;
            position: relative;
        }

        .menu_like{
            position: absolute;
            bottom: 0px;
            font-size: 15px;
        }
        .footer_title{
            font-weight: bold;
            font-size: 18px;
            margin-bottom: 10px;
        }
        .reply{
            border-bottom: 1px solid gray;
            margin-top: 5px;
        }
        .comment{
       		margin-top: 2px;
        	margin-left: 20px;
        	border-bottom: 1px solid gray;
        }
        .reply_write{
        	border:2px solid gray;
        	width:100%;
        }
        .reply_writer{
            font-weight: 700;
            font-size: 14px;
            margin: 5px;
            padding : 7px;
            
        }
        .reply_content{
            font-size: 13px;
            word-break:break-all;
            padding-bottom: 5px;
        }
        .reply_createDate{
        	font-size: 10px;
        	padding-bottom: 5px;
        }
        .write_content{
        	width: 85%;
        	height: 47px;
		    overflow-y: hidden;
		    resize: none;
		    padding: 10px;
		    border: none;
		    margin-left: 10px;
		    margin-bottom: 5px;
		    
        }
		.reply_write_content{
			position: relative;
		}
		.write-btn-cansle{
			position: absolute;
			right : 10px;
			bottom : 40px;
			border:none;
        	background: white;
        	font-weight: 700;
        	font-size: 14px;
		}
		.comment_write_btn{
			position: absolute;
			right : 10px;
			bottom : 10px;
			border:none;
        	background: white;
        	font-weight: 700;
        	font-size: 14px;
		}

        .reply_write_btn{
        	position: absolute;
        	right : 10px;
        	bottom : 10px;
        	border:none;
        	background: white;
        	font-weight: 700;
        	font-size: 14px;
        }
        .write-btn:hover{
        	background:rgba(3, 199, 90, 0.12);
        	color:#009f47;
        }
        .comment_btn, .comment_btn:hover{
        	text-decoration: none;
        	color:gray;
        	cursor: pointer;
        }
        .comment_writer{
        	margin-left: 20px;
        }
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	
	<div id="wrap">
		<div id="menu_wrap" style="z-index: 2">
		</div>
		<div id="menu_detail" style="z-index: 3"></div>
		<div id="map" style="width: 1200px; height: 500px;z-index: 1">
			
		</div>
	</div>
	<script>
		var boardNo = '';
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 3 // 지도의 확대 레벨 
		};
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		var lastInfowindow = null; 
		
		kakao.maps.event.addListener(map, 'dragend', function () {
			positions = [];
			moveMarkers();
		});
		
		mapContainer.addEventListener ('wheel', event => {
			positions = [];
			moveMarkers();
		});
		// 지도 이벤트 리스너 등록
		
		function moveMarkers(){
			var bounds = map.getBounds();
		    var neLat = bounds.getNorthEast().getLat();
		    var neLng = bounds.getNorthEast().getLng();
		    var swLat = bounds.getSouthWest().getLat();
		    var swLng = bounds.getSouthWest().getLng();
			
		    $.ajax({
		        url: "${sessionScope.path}/places/P2/" + neLat + "/" + neLng + "/" + swLat + "/" + swLng,
		        success: result => {
		            var divList = document.getElementById('placesList');
		            var positions = [];
		            var list = ''; 
		            result.forEach( item => {
		                createMarkerAndInfoWindow(item, map);
		                
		                list +='<div class="items card">' +
		                			'<div class="card-header" id="btn-area">' + item.placeName + '<button class="detail-btn date-btn" id="' + item.placeNo + '">자세히보기</button></div>' +
		                			'<div class="card-body">' + item.placeDayOff + '<br>' + item.placeDayOn + '</div>' +
		                			'<div class="card-footer">' + item.placeTel +'</div>' +
								'</div>';
		                
		            });
		            $('#menu_wrap').html(list);
		        }
		    });
		}

		
		function createMarkerAndInfoWindow(item, map) {
		    var position = new kakao.maps.LatLng(item.placeLat, item.placeLon);
		    var content = '<div>' + item.placeName + '</div><div><button class="detail-btn" id="' + item.placeNo + '">자세히보기</button></div>';
			
				
			
		    var marker = new kakao.maps.Marker({
		        map: map,
		        position: position
		    });
		
		    var infowindow = new kakao.maps.InfoWindow({
		        content: content
		    });
		
		    kakao.maps.event.addListener(marker, 'click', function() {
		        if (lastInfowindow) {
		            lastInfowindow.close();
		        }
		        
		        infowindow.open(map, marker);
		        lastInfowindow = infowindow;
		    });
		}
		
		function makeOverListener(map, marker, infowindow) {
		    return function() {
		        infowindow.open(map, marker);
		    };
		}

		
		function makeOutListener(infowindow) {
		    return function() {
		        infowindow.close();
		    };
		}

		function clickListener(map, marker, infowindow) {
		    return function() {
		        infowindow.open(map, marker);
		    };
		}


		
		
		// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
		if (navigator.geolocation) {
			
			// GeoLocation을 이용해서 접속 위치를 얻어옵니다
			navigator.geolocation.getCurrentPosition(function(position) {

				var lat = position.coords.latitude, // 위도
				lon = position.coords.longitude; // 경도

				var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
				message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다
				
				map.setCenter(locPosition);
				moveMarkers()
			});

		} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

			var locPosition = new kakao.maps.LatLng(33.450701, 126.570667), message = 'geolocation을 사용할수 없어요..'

			displayMarker(locPosition, message);
		}
		
		$(() => {
			
			$('#wrap').on('click','.comment_btn', e => {
				$(e.target).parent().siblings('.comment_writer').html(replyWrite('comment_write'));
			});
			$('#wrap').on('click','.write-btn-cansle', e => {
				$(e.target).parent().parent().html('');
			});
			$('#wrap').on('click','.comment_write_btn', e => {
				const $comment = $(e.target).siblings('.write_content').val();
				
				const $replyNo = $(e.target).parents('.comment_writer').parent().attr('id').substr(6);
				
				const $placeNoComment = $(e.target).parents('.menu_footer').siblings('.menu_head').attr('id');
				
				$.ajax({
					url : '${sessionScope.path}/date/comment',
					method : 'post',
					data : {
						memberNo : '${sessionScope.loginUser.memberNo}',
						commentContent : $comment,
						replyNo : $replyNo
					},
					success : result => {
						if(result == 'Y'){
							detailDateAjax($placeNoComment);
						}
					}
				});
				
				
				
			});
			
			$('#wrap').on('click','.reply_write .reply_write_btn', e => {
				const $reply = $('.reply_write .write_content');
				console.log($reply.val());
				const $placeNoReply = $(e.target).parents('.menu_footer').siblings('.menu_head').attr('id');
				console.log($placeNoReply);
				$.ajax({
					url : '${sessionScope.path}/date',
					method : 'post',
					data : {
						memberNo : '${sessionScope.loginUser.memberNo}',
						replyContent : $reply.val(),
						boardNo : boardNo
					},
					success : result => {
						if(result == 'Y'){
							detailDateAjax($placeNoReply);
						}
					}
				});
			});
			
			
			$('#wrap').on('click','.detail-btn', e => {
				const $placeNo = $(e.target).attr('id');
				detailDateAjax($placeNo);
				
			});
			
			$('#wrap').on('click','.menu_close', e => {
				$(e.target).parents('#menu_detail').css('display','none');
			});
			
		});
		function resize(obj) {
            obj.style.height = '1px';
            obj.style.height = (3 + obj.scrollHeight) + 'px';
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
		function replyWrite(write) {
			if(write != 'reply_write'){
				btnText = '<button class="write-btn-cansle">취소</button>'
			} else{
				btnText = '';
			}
			
			return '<div class="' + write + '">' +
        	'<div class="reply_writer">${sessionScope.loginUser.nickname}</div>' +
        	'<div class="reply_write_content">' +
        		'<textarea class="write_content" placeholder="댓글을 남겨보세요" onkeydown="resize(this)" onkeyup="resize(this)"></textarea>' +
        		'<button class="' + write + '_btn">등록</button>' + btnText +
        	'</div>' +
        '</div>';			
		}
		
		function detailDateAjax($placeNo) {
			$.ajax({
				url : '${sessionScope.path}/date/'+ $placeNo,
				success: result => {
					
					let createDate = result.createDate.date;
					let createTime = result.createDate.time;
					let replyList = result.replyList;
					
					var fullDate = new Date(createDate.year, createDate.month - 1, createDate.day, createTime.hour, createTime.minute ,createTime.second);
					boardNo = result.boardNo;
					let text = '<div class="menu_head" id="' + $placeNo + '">' +
						            '<div class="menu_heads">' +
					                '<div class="menu_title">' + result.boardTitle  +'</div>' +
					                '<div class="menu_close">X</div>' +
					            '</div>' + 
					            '<div class="menu_heads">' +
					                '<div class="heads_content">' +
					                    '<div>' + result.memberNo + '</div>' +
					                    '<div>' +
					                        '<div class="menu_create_date">' + dateFormat(fullDate) + ' 조회  ' + result.boardCount + '</div>' +
					                    '</div>' +
					                '</div>' +
								'</div>' +
					            
					        '</div>' +
							        '<div class="menu_body">' +
							            '<div class="menu_content">' +
							             	result.boardContent +
							                '<div class="menu_like">좋아요 ' + result.boardLike + ' 댓글 ' + replyList.length + '</div>' +
							            '</div>' +
							        '</div>' +
			
							        '<div class="menu_footer">' +
							            '<div class="footer_title">댓글</div>';
							            if('${sessionScope.loginUser}' != ''){
							            text += replyWrite("reply_write");
							            }
							            text += '<div class="footer_content">';
							               
							               for(let i in replyList){
							            	   let commentList = replyList[i].commentList;
											   
							            	   let replyCreateDate = replyList[i].createDate.date;
							            	   let replyCreateTime = replyList[i].createDate.time;
							            	   var replyDate = new Date(replyCreateDate.year, replyCreateDate.month - 1, replyCreateDate.day, replyCreateTime.hour, replyCreateTime.minute ,replyCreateTime.second);
							            	   text += '<div class="reply" id="reply_' + replyList[i].replyNo + '">' +
							            		   			'<div class="reply_writer">' + replyList[i].replyWriter + '</div>' +
							                    			'<div class="reply_content">' + replyList[i].replyContent + '</div>' +
							                    			'<div class="reply_createDate">' + dateFormat(replyDate) + '&emsp;<a class="comment_btn">답글쓰기</a></div>' +
							                    			'<div class="comment_writer"></div>' +
							                    		'</div>';
							                    		for(let j in commentList){
							                    			
							                    			if(replyList[i].replyNo == commentList[j].replyNo){
							                    				if(commentList[j].commentContent != null){
									                    			let commentCreateDate = commentList[j].createDate.date;
									                    			let commentCreateTime = commentList[j].createDate.time;
									                    			
									                    			var commentDate = new Date(commentCreateDate.year, commentCreateDate.month - 1, commentCreateDate.day, commentCreateTime.hour, commentCreateTime.minute ,commentCreateTime.second);
								                    				text += '<div class="comment">' +
											                    				'<div class="reply_writer">' + commentList[j].commentWriter + '</div>' +
												                    			'<div class="reply_content">' + commentList[j].commentContent + '</div>' +
												                    			'<div class="reply_createDate">' + dateFormat(commentDate) + '</div>' +
												                    		'</div>';
							                    				}
							                    				
							                    			}
							                    		}
							               }

							                text += '</div></div>';
							                
					$('#menu_detail').css('display','block').html(text);

				}
				
				
			});
		}
	</script>
	
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>