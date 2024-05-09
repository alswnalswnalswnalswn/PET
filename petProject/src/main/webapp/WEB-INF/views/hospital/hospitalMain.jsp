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
			    		positions = [];
			    		for(let i in result){
			    			positions[i] = {
			    							latlng: new kakao.maps.LatLng(result[i].placeLat, result[i].placeLon),
			    							title: result[i].placeName
			    			}
			    		}
			    		
			    		for (var i = 0; i < positions.length; i ++) {
			    		    // 마커를 생성합니다
							addmarker(positions[i].latlng);			    		  
			    		}
	    			}		
				});
			});
			
			kakao.maps.event.addListener(map, 'bounds_changed', function() {
								
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
			    		positions = [];
			    		for(let i in result){
			    			positions[i] = {
			    							latlng: new kakao.maps.LatLng(result[i].placeLat, result[i].placeLon),
			    							title: result[i].placeName
			    			}
			    		}
			    		
			    		for (var i = 0; i < positions.length; i ++) {
			    		    // 마커를 생성합니다
							addmarker(positions[i].latlng);			    		  
			    		}
	    			}		
				});
			});
			
    		function addmarker(position){
    			 var marker = new kakao.maps.Marker({
	    		        map: map, // 마커를 표시할 지도
	    		        position: position, // 마커를 표시할 위치
    		     });
    			 
    			// 마커에 mouseover 이벤트를 등록합니다
   			    kakao.maps.event.addListener(marker, 'mouseover', function() {

   			        // 클릭된 마커가 없고, mouseover된 마커가 클릭된 마커가 아니면
   			        // 마커의 이미지를 오버 이미지로 변경합니다
   			        if (!selectedMarker || selectedMarker !== marker) {
   			            marker.setImage(overImage);
   			        }
   			    });

    			    // 마커에 mouseout 이벤트를 등록합니다
    			    kakao.maps.event.addListener(marker, 'mouseout', function() {

    			        // 클릭된 마커가 없고, mouseout된 마커가 클릭된 마커가 아니면
    			        // 마커의 이미지를 기본 이미지로 변경합니다
    			        if (!selectedMarker || selectedMarker !== marker) {
    			            marker.setImage(normalImage);
    			        }
    			    });

    			    // 마커에 click 이벤트를 등록합니다
    			    kakao.maps.event.addListener(marker, 'click', function() {

    			        // 클릭된 마커가 없고, click 마커가 클릭된 마커가 아니면
    			        // 마커의 이미지를 클릭 이미지로 변경합니다
    			        if (!selectedMarker || selectedMarker !== marker) {

    			            // 클릭된 마커 객체가 null이 아니면
    			            // 클릭된 마커의 이미지를 기본 이미지로 변경하고
    			            !!selectedMarker && selectedMarker.setImage(selectedMarker.normalImage);

    			            // 현재 클릭된 마커의 이미지는 클릭 이미지로 변경합니다
    			            marker.setImage(clickImage);
    			        }

    			        // 클릭된 마커를 현재 클릭된 마커 객체로 설정합니다
    			        selectedMarker = marker;
    			    });
    			
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