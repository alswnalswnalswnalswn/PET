<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동물병원</title>
	<link rel="stylesheet" href="resources/css/hospital/hospitalMain.css"/>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=265dcb92e33a3dc46e2d0249640f425e"></script>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	
	<div id="wrap">
		<div id="map" style="width: 1200px; height: 800px;">
			<div id="menu_wrap" class="bg_white">
				<ul id="placesList"></ul>
				<div id="pagination"></div>
			</div>
			<div id="menu_detail"></div>
		</div>
	</div>
	
	<script>
		
		/**** 지도 생성 ****/
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 3 // 지도의 확대 레벨 
		};
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		var zoomControl = new kakao.maps.ZoomControl(); // 지도에 확대 축소 컨트롤을 생성한다
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT); // 지도의 우측에 확대 축소 컨트롤을 추가한다
	
		
		/**** HTML5의 geolocation으로 사용할 수 있는지 확인합니다 ****/
		if (navigator.geolocation) { // GeoLocation을 이용해서 접속 위치를 얻어옵니다
			navigator.geolocation.getCurrentPosition(position => {
				var lat = position.coords.latitude, // 위도
				lon = position.coords.longitude, // 경도
				locPosition = new kakao.maps.LatLng(lat, lon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
				
				map.setCenter(locPosition);
			});
		} 
		else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
			var locPosition = new kakao.maps.LatLng(33.450701, 126.570667), message = 'geolocation을 사용할수 없어요..';
			displayMarker(locPosition, message);
		}
		
		/**** 지도 영역 바뀌는 동작이 끝날때마다 실행되게끔 ****/
		kakao.maps.event.addListener(map, 'dragend', function () {
			positions = [];
			moveMarkers();
		});
		
		mapContainer.addEventListener ('wheel', event => {
			positions = [];
			moveMarkers();
		});
		
		
		// 지도 영역정보를 얻어옵니다 
	    function moveMarkers(){
		    var bounds = map.getBounds();
		    var neLat = bounds.getNorthEast().getLat();
		    var neLng = bounds.getNorthEast().getLng();
		    var swLat = bounds.getSouthWest().getLat();
		    var swLng = bounds.getSouthWest().getLng();

		    $.ajax({
		    	url : "places/P1/" + neLat + "/" + neLng + "/" + swLat + "/" + swLng,
		    	success : result => {
		    		
		    		for(let i in result){
		    			positions[i] = {
		    							latlng : new kakao.maps.LatLng(result[i].placeLat, result[i].placeLon),
		    							placeLat : result[i].placeLat,
		    							placeLon : result[i].placeLon,
		    							placeName : result[i].placeName,
		    							newAddr : result[i].newAddr,
		    							oldAddr : result[i].oldAddr,
		    							placeDayOff : result[i].placeDayOff,
		    							placeDayOn : result[i].placeDayOn,
		    							placeNo : result[i].placeNo,
		    							placeTel : result[i].placeTel
		    			}
		    		}
		    		//console.log(result);
		    		console.log(positions);
		    		/*
		    		addMarkersAndInfowindow(positions, map);
		    		displayPlaces(positions);
		    		*/
				}
			});
	    }
		
		
		
		/**** 지도영역이 변경되면 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다 ****/
		/*
		kakao.maps.event.addListener(map, 'bounds_changed', () => {        
			
			// 기존 추가된 마커 삭제
			deleteMarkers();
			
		   
		});
		
		
		*/
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	</script>
	
	
	
	
	
	
	
	
	
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>