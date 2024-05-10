<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
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
	background: rgb(255,255,255,0.7);
}

</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	
	<div id="wrap">
		<div id="menu_wrap" style="z-index: 2">
		</div>
		<div id="map" style="width: 1200px; height: 500px;z-index: 1">
			
		</div>
	</div>
	<script>
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
		        url: "places/P2/" + neLat + "/" + neLng + "/" + swLat + "/" + swLng,
		        success: function(result) {
		            var divList = document.getElementById('placesList');
		            var positions = [];
					
		            result.forEach( item => {
		            	console.log(item);
		                createMarkerAndInfoWindow(item, map);
		            });
		        }
		    });
		}

		
		function createMarkerAndInfoWindow(item, map) {
		    var position = new kakao.maps.LatLng(item.placeLat, item.placeLon);
		    var content = '<div>' + item.placeName + '</div><div><button id="' + item.placeNo + '">자세히보기</button></div>';
		
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


		});
		
	</script>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>