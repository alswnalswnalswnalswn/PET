<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동물병원</title>

<link rel="stylesheet" href="resources/css/hospital/hospitalMain.css" />
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=265dcb92e33a3dc46e2d0249640f425e"></script>

</head>
<body>
	<jsp:include page="../common/header.jsp" />

	<div class="hospital_wrap">
		<div class="map_wrap">
			<div id="map"
				style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>

			<div id="menu_wrap" class="bg_white">
				<ul id="placesList"></ul>
				<div id="pagination"></div>
			</div>

			<div id="menu_detail" class="bg_white">
				<div id="placeName"></div>
				<div id="newAddr"></div>
				<div id="oldAddr"></div>
				<div id="placeDayOn"></div>
				<div id="placeDayOff"></div>
				<div id="placeTel"></div>
				<button class="btn btn-secondary" onclick="reservation(this.value);" id="reserBtn">예약하기</button>

				<div id="reserInfo">
					<span>원하시는 예약 날짜를 선택해주세요.</span>

					<div class="sec_cal">
						<div class="cal_nav">
							<a class="nav-btn go-prev">prev</a>
							<div class="year-month"></div>
							<a class="nav-btn go-next">next</a>
						</div>
						<div class="cal_wrap">
							<div class="days">
								<div class="day">MON</div>
								<div class="day">TUE</div>
								<div class="day">WED</div>
								<div class="day">THU</div>
								<div class="day">FRI</div>
								<div class="day">SAT</div>
								<div class="day">SUN</div>
							</div>
							<div class="dates">
							</div>
						</div>
					</div>
				</div>
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
		
		var hospitalList = [];
		
		
		$(() => {
			moveMarkers();
			calendarInit();
		});
		
		kakao.maps.event.addListener(map, 'dragend', () => {
			moveMarkers();
		});
		
		mapContainer.addEventListener ('wheel', event => {
			moveMarkers();
		});
		
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
		    		
					hospitalList = result;
					
    		    	var listEl = document.getElementById('placesList');
		            listEl.innerHTML = '';
    		    	var itemStr = '',

		            menuEl = document.getElementById('menu_wrap');
    		    	
		            result.forEach((result, index) => {
		            	markersAndInfowindow(result, map);
		            	itemStr += '<li class="item" id="li' + result.placeNo + '">' // id에 pk를 넣어서 클릭시 해당 병원의 상세정보 확인
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
		
	    var hospital = '';
	    // 상세 div 표시 함수
	   
       	$(() => {
       		$('#placesList').on('click', '.item', e => {
       			
       			$('#menu_detail').css('display','block');
				
       			const test = $(e.currentTarget).attr('id').substring(2);
       			
       			for(let i in hospitalList){
       				if(hospitalList[i].placeNo == test){
       					hospital = hospitalList[i];
       				}
       			}

       			$('#placeName').html(hospital.placeName);
       			$('#newAddr').html(hospital.newAddr);
       			$('#oldAddr').html(hospital.oldAddr);
       			$('#placeDayOn').html(hospital.placeDayOn);
       			$('#placeDayOff').html(hospital.placeDayOff);
       			$('#placeTel').html(hospital.placeTel);
       			
       			if(hospital.placeDayOn === '정보없음'){
       				$('#reserBtn').css('display','none');
       				$('#reserInfo').css('display','none');
       			}else {
       				$('#reserBtn').css('display','block');
	       			$('#reserBtn').val(hospital.placeNo);
       			}
       			
       		});
       	});
	    
       	function calendarInit() {

       	    // 날짜 정보 가져오기
       	    var date = new Date(); // 현재 날짜(로컬 기준) 가져오기

       	    // 캘린더 렌더링
       	    renderCalender(date);

       	    function renderCalender(date) {
				
       	        // 렌더링을 위한 데이터 정리
       	        var currentYear = date.getFullYear(),
       	        currentMonth = date.getMonth(),
       	        currentDate = date.getDate();

       	        // 이전 달의 마지막 날 날짜와 요일 구하기
       	        var startDay = new Date(currentYear, currentMonth, 0);
       	        var prevDate = startDay.getDate();
       	        var prevDay = startDay.getDay();

       	        // 이번 달의 마지막날 날짜와 요일 구하기
       	        var endDay = new Date(currentYear, currentMonth + 1, 0);
       	        var nextDate = endDay.getDate();
       	        var nextDay = endDay.getDay();

       	        // 현재 월 표기
       	        $('.year-month').text(currentYear + '.' + (currentMonth + 1));

       	        // 렌더링 html 요소 생성
       	        calendar = document.querySelector('.dates')
       	        calendar.innerHTML = '';
       	        
       	        // 지난달
       	        for (var i = prevDate - prevDay + 1; i <= prevDate; i++) {
       	            calendar.innerHTML = calendar.innerHTML + '<div class="day prev disable">' + i + '</div>'
       	        }
       	        // 이번달
       	        for (var i = 1; i <= nextDate; i++) {
       	            calendar.innerHTML = calendar.innerHTML + '<div class="day current">' + i + '</div>'
       	        }
       	        // 다음달
       	        for (var i = 1; i <= (7 - nextDay == 7 ? 0 : 7 - nextDay); i++) {
       	            calendar.innerHTML = calendar.innerHTML + '<div class="day next disable">' + i + '</div>'
       	        }

       	        // 오늘 날짜 표기
       	        if (date.getMonth() == currentMonth) {
       	            todayDate = date.getDate();
       	            var currentMonthDate = document.querySelectorAll('.dates .current');
       	            currentMonthDate[todayDate -1].classList.add('today');
       	        }
       	    }

       	    // 이전달로 이동
       	    $('.go-prev').on('click', () => {
       	        thisMonth = new Date(currentYear, currentMonth - 1, 1);
       	        renderCalender(thisMonth);
       	    });

       	    // 다음달로 이동
       	    $('.go-next').on('click', () => {
       	        thisMonth = new Date(currentYear, currentMonth + 1, 1);
       	        renderCalender(thisMonth); 
       	    });
       	}
	    
	    function reservation(result){
	    	// console.log(result);
	    	$('#reserInfo').css('display', 'block');
	    }
		
	</script>
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>