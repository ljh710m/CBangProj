$(function() {	
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
    mapOption = {
        center: new daum.maps.LatLng(37.47861, 126.8786259), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };
    
    //지도를 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    
    //지도 타입 변경 컨트롤을 생성한다
	var mapTypeControl = new daum.maps.MapTypeControl();

	// 지도의 상단 우측에 지도 타입 변경 컨트롤을 추가한다
	map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);
	
	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new daum.maps.ZoomControl();
	map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
	
    // 지도에 표시할 원을 생성합니다
    var circle = new daum.maps.Circle({
        center : new daum.maps.LatLng(37.47861, 126.8786259),  // 원의 중심좌표 입니다 
        radius: 50, // 미터 단위의 원의 반지름입니다 
        strokeWeight: '1.75px', // 선의 두께입니다 
        strokeColor: '#0958a6', // 선의 색깔입니다
        strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
        strokeStyle: 'solid', // 선의 스타일 입니다
        fillColor: '#368de0', // 채우기 색깔입니다
        fillOpacity: 0.7,  // 채우기 불투명도 입니다
    }); 

    // 지도에 원을 표시합니다 
    circle.setMap(map);
        
    //카테고리] SW8:지하철, CS2:편의점, CE7:카페, BK9:은행, PO3:문화기관
    //place_name:장소명, 업체명
    //distance	중심좌표까지의 거리(x,y 파라미터를 준 경우에만 존재). 단위 meter
    //x: X 좌표값 혹은 longitude
    //y: Y 좌표값 혹은 latitude
    var category = ["SW8","CS2","CE7","BK9","PO3"];
    
    //장소 검색 객체 생성
    var places = new daum.maps.services.Places(map);
    
    // 마커이미지의 주소와, 크기, 옵션으로 마커 이미지를 생성하여 리턴하는 함수
    function createMarkerImage(index) {
        var markerImage = new daum.maps.MarkerImage(
        		"../../images/room/icon_roadview_0"+index+".png", new daum.maps.Size(35, 35));        
        return markerImage;
    }
    // 좌표와 마커이미지를 받아 마커를 생성하여 리턴하는 함수
    function createMarker(place, image) {
        var marker = new daum.maps.Marker({
            position: new daum.maps.LatLng(place.y, place.x),
            image: image,
            map : map
        });
        
        // 마커에 클릭이벤트를 등록합니다
        daum.maps.event.addListener(marker, 'click', function() {
        	$('.marker-info').remove();               	
        	$('#marker-alert').html('<div class="marker-info" style="padding:5px;">'+place.place_name+'</div>');
        	$('.marker-info').animate({opacity:'0'},3000);
        });
        return marker;
    }
    // 지도에 마커를 표시하는 함수
    function displayMarker(place) {
        // 마커를 생성하고 지도에 표시합니다
        var marker = new daum.maps.Marker({
            map: map,
            position: new daum.maps.LatLng(place.y, place.x)            
        });
    }
    
    var markers = new Array(category.length);    
    for(var i=0; i<category.length; i++){    
    	places.categorySearch(category[i], placesSearchCB, {useMapBounds:true});
    	markers[i] = new Array();
    }
    var imgIndex=0;
    // 키워드 검색 완료 시 호출되는 콜백함수
	function placesSearchCB(data, status, pagination) {
		if(status === daum.maps.services.Status.OK) {
			imgIndex++;
			console.log("imgIndex"+imgIndex);
			for(var j=0; j<data.length; j++) {    				
				var marker = createMarker(data[j], createMarkerImage(imgIndex));
				
				//markers[imgIndex][j].push(marker);
			}
		}
		
	} 
    
    
    $('.menus > ul > li').click(function(){
    	console.log($(this).index());    	
    	$(this).children().toggleClass('active');
    	if($(this).children().hasClass('active')){
    		    		  		    		    		
    	}
    	else{
    		
    	}    	
    	
    });
    
    /* 스크롤바 감지 */
    $(document).scroll(function(){    	
    	if ($(document).scrollTop() >= 996) {
    		$('.infos').attr("style", "position:absolute;top:1075px;");    		
    	}
    	else{
    		$('.infos').removeAttr("style");
    	}  	    	
    });    
    
});
