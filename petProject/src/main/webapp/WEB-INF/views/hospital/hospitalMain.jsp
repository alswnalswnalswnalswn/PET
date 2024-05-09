<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동물병원</title>
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=265dcb92e33a3dc46e2d0249640f425e"></script>
	<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=LIBRARY"></script> -->
	<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>  -->
	
<style>
#wrap {
	width: 1200px;
	height: 1000px;
	margin: auto;
}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />

	<div id="wrap">
		<div id="map" style="width: 1200px; height: 800px;"></div>
	</div>

	<script>
			var positions = [];
			
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				level : 3 // 지도의 확대 레벨 
			};
			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
			
			
			
			
			// 지도가 이동, 확대, 축소로 인해 지도영역이 변경되면 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
			kakao.maps.event.addListener(map, 'bounds_changed', function() {            
				
				// 지도 드래깅 이벤트를 등록한다 (드래그 시작 : dragstart, 드래그 종료 : dragend)
				kakao.maps.event.addListener(map, 'dragend', function () {
					positions = [];
				});
				
				// 휠 이벤트
				mapContainer.addEventListener ('wheel', event => {
					positions = [];
				});
				
			    // 지도 영역정보를 얻어옵니다 
			    var bounds = map.getBounds();
			    
			    var neLat = bounds.getNorthEast().getLat();
			    var neLng = bounds.getNorthEast().getLng();
			    var swLat = bounds.getSouthWest().getLat();
			    var swLng = bounds.getSouthWest().getLng();
			    
			    //console.log(neLat);
			    //console.log(neLng);
			    //console.log(swLat);
			    //console.log(swLng);
			    
			    $.ajax({
			    	url : "searchPlace",
			    	data : {
			    		categoryCode : 'P1',
			    		neLat : neLat,
			    		neLng : neLng,
			    		swLat : swLat,
			    		swLng : swLng
			    	},
			    	success : result => {
			    		//console.log(result);
			    		
			    		// 마커를 표시할 위치와 title 객체 배열입니다 
			    		for(let i in result){
			    			positions[i] = {
			    							latlng: new kakao.maps.LatLng(result[i].placeLat, result[i].placeLon),
			    							placeName: '<div>'+ result[i].placeName +'</div>',
			    							newAddr : '<div>'+ result[i].newAddr +'</div>',
			    							
			    			}
			    		}
			    		console.log(positions);
			    		for (var i = 0; i < positions.length; i ++) {
			    		    
			    			// 마커를 생성합니다
			    		    var marker = new kakao.maps.Marker({
						        map: map, // 마커를 표시할 지도
						        position: positions[i].latlng // 마커의 위치
						    });
			    		    
			    		    var infowindow = new kakao.maps.InfoWindow({
			    		    	content: positions[i].placeName // 인포윈도우에 표시할 내용
			    			});
			    		    
			    		    var iwContent = positions[i].placeName + positions[i].newAddr, iwRemoveable = true;
			    		    	
			    		    var infowindow1 = new kakao.maps.InfoWindow({
			    		        content: iwContent, // 인포윈도우에 표시할 내용
			    		        removeable : iwRemoveable
			    			});
			    		    
			    		    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
				    		kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
				    	    kakao.maps.event.addListener(marker, 'click', clickListener(map, marker, infowindow1));
	    			}
				}
			    });
			});
			
			// 마우스 호버 시 인포윈도우를 여는 클로저를 만드는 함수입니다 
			function makeOverListener(map, marker, infowindow) {
			    return function() {
			        infowindow.open(map, marker);
			    };
			}

			// 마우스 호버 시 인포윈도우를 닫는 클로저를 만드는 함수입니다 
			function makeOutListener(infowindow) {
			    return function() {
			        infowindow.close();
			    };
			}
			
			// 마커에 click 이벤트를 등록합니다
			function clickListener(map, marker, infowindow) {
			    return function() {
			    	infowindow.open(map, marker);
				}
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
					
				});
	
			} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
	
				var locPosition = new kakao.maps.LatLng(33.450701, 126.570667), message = 'geolocation을 사용할수 없어요..'
	
				displayMarker(locPosition, message);
			}

		
	</script>




	<jsp:include page="../common/footer.jsp" />
</body>
</html>