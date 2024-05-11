<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<link rel="stylesheet" href="resources/css/hospital/hospitalMain.css"/>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=265dcb92e33a3dc46e2d0249640f425e"></script>
	
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	
	<div class="wrap">
		<div class="map_wrap">
			<div id="map" style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
	
			<div id="menu_wrap" class="bg_white">
				<ul id="placesList"></ul>
				<div id="pagination"></div>
			</div>
		</div>
	</div>
	
	<script>
	
		/* 지도 생성 */
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 3 // 지도의 확대 레벨 
		},
		map = new kakao.maps.Map(mapContainer, mapOption), // 지도를 생성합니다
		lastInfowindow = null, // 인포 윈도우 상태확인용
		markers = [], // 마커를 담을 배열입니다
		infowindow = new kakao.maps.InfoWindow({ // 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
			zIndex : 1
		}); 
		zoomControl = new kakao.maps.ZoomControl(), // 지도에 확대 축소 컨트롤을 생성한다
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT); // 지도의 우측에 확대 축소 컨트롤을 추가한다
		
		
		/* HTML5의 geolocation으로 사용할 수 있는지 확인합니다 */
		if (navigator.geolocation) { // GeoLocation을 이용해서 접속 위치를 얻어옵니다
			navigator.geolocation.getCurrentPosition(position => {
				var lat = position.coords.latitude, // 위도
				lon = position.coords.longitude, // 경도
				locPosition = new kakao.maps.LatLng(lat, lon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
				
				map.setCenter(locPosition);
			});
		} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
			var locPosition = new kakao.maps.LatLng(33.450701, 126.570667), 
			message = 'geolocation을 사용할수 없어요..';
		
			displayMarker(locPosition, message);
		}
		
		
		$(() => {
			moveMarkers();
		});
		
		kakao.maps.event.addListener(map, 'dragend', () => {
			moveMarkers();
		});
		
		mapContainer.addEventListener ('wheel', event => {
			moveMarkers();
		});
		
		
		// 지도 영역에 해당하는 DB값 불러오기
	    function moveMarkers(){
		    var bounds = map.getBounds();
		    var neLat = bounds.getNorthEast().getLat();
		    var neLng = bounds.getNorthEast().getLng();
		    var swLat = bounds.getSouthWest().getLat();
		    var swLng = bounds.getSouthWest().getLng();

		    $.ajax({
		    	url : "places/P1/" + neLat + "/" + neLng + "/" + swLat + "/" + swLng,
		    	success : result => {
		    		
    		    	var listEl = document.getElementById('placesList');
		            listEl.innerHTML = '';
    		    	var itemStr = '',

		            menuEl = document.getElementById('menu_wrap');
    		    	
		            result.forEach((result, index) => {
		            	markersAndInfowindow(result, map);
		            	itemStr += '<li class="item">'
		            			 + '<span class="markerbg"></span>'
			            		 + '<div class="info">'
			            		 + '<h5>' + result.placeName + '</h5>'
								 + '<span>' + result.newAddr + '</span>'
								 + '<span class="jibun gray">' + result.oldAddr + '</span>'
								 + '<span class="tel">' + result.placeTel  + '</span>'
								 + '</div>'
								 + '</li>';
		            });
		            
		            listEl.innerHTML += itemStr;
		    
				}
			});
	    }
	    
		
		/* 마커랑 인포윈도우 추가 */
	    function markersAndInfowindow(result, map){
			
			// 마커 이미지의 이미지 주소입니다
			var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png",
		    imageSize = new kakao.maps.Size(24, 35),  // 마커 이미지의 크기
        	markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize),
		    position = new kakao.maps.LatLng(result.placeLat, result.placeLon), // 마커 좌표를 생성합니다    
			
		    marker = new kakao.maps.Marker({ // 마커를 생성합니다
		        map: map, // 마커를 표시할 지도
		        position: position, // 마커를 표시할 위치
		        image : markerImage // 마커 이미지 
		    }),
		    
		    infowindow = new kakao.maps.InfoWindow({
    		    position : position, 
    		    content : '<div>' + result.placeName + '</div>'
    		});
    		  
    		// 마커에 클릭 이벤트를 등록한다 (우클릭 : rightclick)
    		kakao.maps.event.addListener(marker, 'click', function() {
    			if (lastInfowindow) {
		            lastInfowindow.close();
		        }
		        infowindow.open(map, marker);
		        lastInfowindow = infowindow;
    		});
		}
		
	    function removeMarker() {
	        for ( var i = 0; i < markers.length; i++ ) {
	            markers[i].setMap(null);
	        }   
	        markers = [];
	    }
	    
		
	</script>
<jsp:include page="../common/footer.jsp" />
</body>
</html>