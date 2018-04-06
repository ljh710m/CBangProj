var gbl_data;
$.ajax({
		type:'POST',
		url:'/CBangProj/Search/MapSearch.do',		
		dataType:'json',
		async:false, // true: 비동기, false: 동기
		success:function(data){
			gbl_data =data;			
		}
});

var markerList = [];
var markerLength = 0;
function initMap() {	
	var map = new google.maps.Map(document.getElementById('map'), {
		zoom: 8,
		center: {lat: 36.2683, lng: 127.6358},		
		maxZoom: 16, //최대 줌 레벨
		minZoom: 8 //최소 줌 레벨
	}); 
	
	// 자바 스크립트  Array.prototype.map()
	// var 변수 = 요소가 포함된 배열 개체.map(function(배열 요소의 값, 인덱스){
	//		return new google.maps.Marker({
	//			position : {lat: 위도값, lng: 경도값 }
	//		});
	// });	
	var markers = gbl_data.map(function(location, i) {		
    	return new google.maps.Marker({
    		position: new google.maps.LatLng(location.lat,location.lng),
    		title: location.room_no
    	});
	});
	
	/* 기존 코드
	var markers = locations.map(function(location, i) {		
    	return new google.maps.Marker({
    		position: location
    	});
    });	*/
		
	// Add a marker clusterer to manage the markers.
	var markerCluster = new MarkerClusterer(map, markers,
			{
				//imagePath: '/CBangProj/vendor/googlemaps/images/m',				
				averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정		        
		        minimumClusterSize : 1 //클러스터링 할 최소 마커 수 (default: 2) 
			}
	);
	
	//var markerLength = 0;
	//var markerList = [];
	// idle:중심 좌표나 확대 수준이 변경되면 발생한다. 현재 맵 범위좌표 확인.		
	google.maps.event.addListener(map, 'idle', function(){
		markerLength = 0;
		markerList = [];
	    startLat = map.getBounds().getSouthWest().lat();	    
	    startLng = map.getBounds().getSouthWest().lng();
	    endLat = map.getBounds().getNorthEast().lat();
	    endLng = map.getBounds().getNorthEast().lng();	    
	    for(var i=0; i<markers.length; i++){
	    	if (parseFloat(startLat) <= parseFloat(markers[i].getPosition().lat()) && parseFloat(startLng) <= parseFloat(markers[i].getPosition().lng()) && parseFloat(endLat) >= parseFloat(markers[i].getPosition().lat()) && parseFloat(endLng) >= parseFloat(markers[i].getPosition().lng())){
	    		markerLength++;
	    		markerList.push(gbl_data[i]);	    		
	    	}
	    }	    
	    
	    if(markerLength == 0) $('.ListZero').removeClass('hidden');
	    else $('.ListZero').addClass('hidden');
	    
	    $('.ListLoading').css('visibility', "visible");
	    $('.icon-text strong').html(markerLength);
	    paging(markerLength,1);
	    if(markerLength < 15) list(1,markerLength);
	    else list(1,15);
	});
}

//페이징
function paging(markerLength,nowPage){	
	
	var pageSize = 15;
	var blockPage = 10;
	var totalPage= Math.ceil(markerLength/pageSize);	
	var intTemp = parseInt((nowPage-1)/blockPage) * blockPage + 1;
	
	var pagination = $('.Pagination');
	pagination.html("");
	if(markerLength == 0) return;
	
	if(intTemp != 1){
		pagination.append($('<li/>').append($('<a/>').addClass('Pagination-item Pagination-item--prev').html("&lt; PREV").click(function(){
			var prevPage = $('.Pagination li:eq(1) a').html()-1;
			paging(markerLength,prevPage);			
			list((prevPage-1)*pageSize +1,(prevPage*pageSize));
		})));
	}
	else{
		pagination.append($('<li/>').append($('<a/>').addClass('Pagination-item Pagination-item--prev disable').html("&lt; PREV")));
	}
	
	//페이지 표시 제어를 위한 변수
	var blockCount = 1;
	//페이지를 뿌려주는 로직
	//블락 페이지 수만큼 혹은 마지막 페이지가 될때까지 페이지를 표시한다.
	while(blockCount <= blockPage && intTemp <= totalPage){  // 페이지 오버 를 체크		
		//현재 페이지를 의미함
		if(intTemp == nowPage){
			pagination.append($('<li/>').append($('<a/>').addClass('Pagination-item active').html(intTemp).click(function(){
				$('.Pagination-item.active').removeClass("active");
	    		$(this).addClass("active");
	    		list(($(this).html()-1)*pageSize +1,($(this).html()*pageSize));	    		
	    	})));
		}
	    else{
	    	 pagination.append($('<li/>').append($('<a/>').addClass('Pagination-item').html(intTemp).click(function(){
	    		 $('.Pagination-item.active').removeClass("active");
	    		 $(this).addClass("active");
	    		 list(($(this).html()-1)*pageSize +1,($(this).html()*pageSize));	    		
	    	 })));
	    }
		intTemp = intTemp + 1;
		blockCount = blockCount + 1;		
	}
	if(intTemp <= totalPage){		
		pagination.append($('<li/>').append($('<a/>').addClass('Pagination-item Pagination-item--next').html('NEXT &gt;').click(function (){
			paging(markerLength,intTemp);
			list((intTemp-1)*pageSize +1,(intTemp*pageSize));			
		})));
	}
	else{
		pagination.append($('<li/>').append($('<a/>').addClass('Pagination-item Pagination-item--next disable').html('NEXT &gt;')));		
	}	
}

//리스트
function list(start,end){
	console.log(markerList);
	var roomList = $('.Room-list');
	roomList.html("");
	
	if(markerLength != 0){
		for(var i=start-1;i<end;i++){			
			var li = $('<li/>').addClass("Room-item");
			var a = $('<a/>').attr('href',"/CBangProj/Room/Detail.do?roomNo="+markerList[i].room_no);
			var previewDiv = $('<div/>').addClass("RoomItem-preview__mask")
			.append($('<div/>').addClass("RoomItem-preview__image"))
			.append($('<div/>').addClass("RoomItem-preview__image").attr('style',"background-image:url(../Upload/"+markerList[i].stored_file_name+")"))
			.append($('<div/>').addClass("RoomItem-preview__cover"));
					
			var priceDiv = ""
			if(markerList[i].rent_type == "전세"){
				var deposit1=markerList[i].deposit1;
				if(deposit1 >= 10000){
					deposit1 = parseInt(deposit1/10000)+"억"+deposit1%10000;
				}
				
				priceDiv = $('<div/>').addClass("RoomItem-price")
					.append($('<p/>')
						.append($('<span/>').addClass("RoomItem-price__type").html("전세"))		
						.append($('<span/>').addClass("RoomsItem-price__title is-1").html(deposit1)));			
			}
			else{
				var deposit2=markerList[i].deposit2;
				if(deposit2 >= 10000){
					deposit2 = parseInt(deposit2/10000)+"억"+deposit2%10000;
				}
				priceDiv = $('<div/>').addClass("RoomItem-price")
					.append($('<p/>')
						.append($('<span/>').addClass("RoomItem-price__type").html("월세"))		
							.append($('<span/>').addClass("RoomsItem-price__title is-0").html(deposit2+"/"+markerList[i].month_price)));		
			}
			
			var summaryDiv = $('<span/>').addClass("RoomItem-summary")
						.append($('<span/>').html(markerList[i].room_type+" "))
						.append($('<span/>').html(" "+markerList[i].floor+"층 "))
						.append($('<span/>').html(" "+markerList[i].area+"m²"));
			
			if(markerList[i].common_charge != null){				
				summaryDiv.append($('<span/>').html(" 관리비 "+markerList[i].common_charge+"만원"));
			}
			
			var bOptionDiv = $('<div/>').addClass("RoomItem-types types")
						.append($('<span/>').addClass("tag").html("#"+markerList[i].trade_type));
			
			if(markerList[i].parking){
				bOptionDiv.append($('<span/>').addClass("tag").html("#주차"));
			}
			if(markerList[i].pat){
				bOptionDiv.append($('<span/>').addClass("tag").html("#반려동물"));			
			}
			if(markerList[i].short_term){
				bOptionDiv.append($('<span/>').addClass("tag").html("#단기가능"));			
			}			
		
			roomList.append(li.append(a
						.append(previewDiv)
						.append($('<div/>').addClass("RoomItem-detail")
								.append($('<div/>').addClass("RoomItem-info")
										.append($('<div/>').addClass("RoomItem-header")
												.append(priceDiv)
												.append($('<div/>').addClass("RoomItem-icons")
														.append($('<span/>').addClass("room-favorite")
																.append($('<i/>').addClass("dabang-icon icon-size-2xl far fa-heart"))
																)
														)
												)
												.append(summaryDiv													
												)
												.append(bOptionDiv
												)
												.append($('<span/>').addClass("RoomItem-title").html(markerList[i].room_title))
										)
								)
						
						)	
			);			
			
		}
		
	}
	else{//검색된 방이 없을 경우
		
	}
	$('.ListLoading').attr('style',"visibility:hidden;");
	
}