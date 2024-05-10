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
	<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=LIBRARY"></script> -->
	<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>  -->
	
<style>
	
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />

	<div id="wrap">
		<div id="map" style="width: 1200px; height: 800px;">
			<div id="menu_wrap" class="bg_white">
				<ul id="placesList"></ul>
				<div id="pagination"></div>
			</div>
			<div id="menu_detail">
				
			</div>
		</div>
	</div>

	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 3 // 지도의 확대 레벨 
		};
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		// 지도에 확대 축소 컨트롤을 생성한다
		var zoomControl = new kakao.maps.ZoomControl();

		// 지도의 우측에 확대 축소 컨트롤을 추가한다
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

		// 마커를 담을 배열입니다
		var markers = [];
		
		// 장소 담는 배열
		var positions = [];
		
		// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({zIndex:1});
		
		// 지도 확대/축소/이동 시 마커 삭제 함수
		function deleteMarkers(){
			// 지도 드래깅 이벤트를 등록한다 (드래그 시작 : dragstart, 드래그 종료 : dragend)
			kakao.maps.event.addListener(map, 'dragend', function () {
				positions = [];
			});
			// 휠 이벤트
			mapContainer.addEventListener ('wheel', event => {
				positions = [];
			});
		}
				
		// 지도가 이동, 확대, 축소로 인해 지도영역이 변경되면 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'bounds_changed', function() {            
			
			deleteMarkers();
			
		    // 지도 영역정보를 얻어옵니다 
		    var bounds = map.getBounds();
		    
		    var neLat = bounds.getNorthEast().getLat();
		    var neLng = bounds.getNorthEast().getLng();
		    var swLat = bounds.getSouthWest().getLat();
		    var swLng = bounds.getSouthWest().getLng();
		    
		    $.ajax({
		    	url : "places/P1/" + neLat + "/" + neLng + "/" + swLat + "/" + swLng,
		    	data : {
		    		categoryCode : 'P1',
		    		neLat : neLat,
		    		neLng : neLng,
		    		swLat : swLat,
		    		swLng : swLng
		    	},
		    	success : result => {
		    		// 마커를 표시할 위치와 title 객체 배열입니다 
		    		for(let i in result){
		    			positions[i] = {
		    							latlng: new kakao.maps.LatLng(result[i].placeLat, result[i].placeLon),
		    							placeName: '<div>'+ result[i].placeName +'</div>',
		    							newAddr : result[i].newAddr,
		    							oldAddr : result[i].oldAddr,
		    							placeDayOff : result[i].placeDayOff,
		    							placeDayOn : result[i].placeDayOn,
		    							placeNo : result[i].placeNo,
		    							placeTel : result[i].placeTel
		    			}
		    		}
		    		// console.log(positions);
		    		
		    		for (var i = 0; i < positions.length; i ++) {
		    		    
		    			// 마커를 생성합니다
		    		    var marker = new kakao.maps.Marker({
					        map: map, // 마커를 표시할 지도
					        position: positions[i].latlng // 마커의 위치
					    });
		    		    
		    			// infowindow 배열 선언
		    		    var infowindow = new kakao.maps.InfoWindow({
		    		    	content: positions[i].placeName // 인포윈도우에 표시할 내용
		    			});
		    		    
		    		    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
			    		kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
			    	    kakao.maps.event.addListener(marker, 'click', clickListener(map, marker, infowindow));
			    	   
			    	    displayPlaces(positions);
		    		}
		    		
		    		
		    		
		    		
			}
		    });
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
		/*
		// 검색 결과 목록과 마커를 표출하는 함수입니다
		function displayPlaces(places) {

		    var listEl = document.getElementById('placesList'), 
		    menuEl = document.getElementById('menu_wrap'),
		    fragment = document.createDocumentFragment(), 
		    bounds = new kakao.maps.LatLngBounds(), 
		    listStr = '';
		    
		    // 검색 결과 목록에 추가된 항목들을 제거합니다
		    removeAllChildNods(listEl);

		    // 지도에 표시되고 있는 마커를 제거합니다
		    removeMarker();
		    
		    for ( var i=0; i<places.length; i++ ) {

		        // 마커를 생성하고 지도에 표시합니다
		        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
		            marker = addMarker(placePosition, i), 
		            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
		        // LatLngBounds 객체에 좌표를 추가합니다
		        bounds.extend(placePosition);

		        // 마커와 검색결과 항목에 mouseover 했을때
		        // 해당 장소에 인포윈도우에 장소명을 표시합니다
		        // mouseout 했을 때는 인포윈도우를 닫습니다
		        	(function(marker, title) {
		            kakao.maps.event.addListener(marker, 'mouseover', function() {
		                displayInfowindow(marker, title);
		            });

		            kakao.maps.event.addListener(marker, 'mouseout', function() {
		                infowindow.close();
		            });
		            
		            kakao.maps.event.addListener(marker, 'click', function() {
		                alert('오케이');
		            });

		            itemEl.onmouseover =  function () {
		                displayInfowindow(marker, title);
		            };

		            itemEl.onmouseout =  function () {
		                infowindow.close();
		            };
		        })(marker, places[i].place_name);

		        fragment.appendChild(itemEl);
		    }

		    // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
		    listEl.appendChild(fragment);
		    menuEl.scrollTop = 0;

		    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
		    map.setBounds(bounds);
		}
		*/
		
		
		
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