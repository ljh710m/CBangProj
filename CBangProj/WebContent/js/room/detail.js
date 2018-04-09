$(function() {
	var lat = $('#lat').val();
	var lng = $('#lng').val();
	
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
    mapOption = {
        center: new daum.maps.LatLng(lat, lng), // 지도의 중심좌표
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
    	center : new daum.maps.LatLng(lat, lng),  // 원의 중심좌표 입니다
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
         
    /* 주변 편의시설 지도 표시 */
    //카테고리] SW8:지하철, CS2:편의점, CE7:카페, BK9:은행, PO3:문화기관
    //place_name:장소명, 업체명
    //distance	중심좌표까지의 거리(x,y 파라미터를 준 경우에만 존재). 단위 meter
    //x: X 좌표값 혹은 longitude
    //y: Y 좌표값 혹은 latitude
    var category = ["SW8","CS2","CE7","BK9","PO3"];
    
    //장소 검색 객체 생성
    var places = new daum.maps.services.Places(map);
    
    // 마커이미지의 주소와, 크기로 마커 이미지를 생성하여 리턴하는 함수
    // 1:지하철, 2:편의점, 3:카페, 4:은행, 5:관공서
    function createMarkerImage(index) {
        var markerImage = new daum.maps.MarkerImage(        		
        		"/CBangProj/images/room/icon_roadview_0"+index+".png", new daum.maps.Size(35, 35));
        return markerImage;
    }    	
    
	var subwayMarkers = [], //지하철 마커 객체를 가지고 있을 배열
	storeMarkers = [], // 편의점 마커 객체를 가지고 있을 배열
	coffeeMarkers = [], // 카페 마커 객체를 가지고 있을 배열
    bankMarkers = [], // 은행 마커 객체를 가지고 있을 배열
    publicMarkers = []; //관공서 마커 객체를 가지고 있을 배열
	var order;
	// 좌표와 마커이미지를 받아 마커를 생성하여 리턴하는 함수입니다
	function createMarker(place,image) {
	    var marker = new daum.maps.Marker({	    	
	        position: new daum.maps.LatLng(place.y, place.x), //마커의 좌표
	        image: image, //마커의 이미지
	        map : map //마커가 올라갈 지도
	    });
	    
	    daum.maps.event.addListener(marker, 'click', function() {
        	$('.marker-info').remove();               	
        	$('#marker-alert').html('<div class="marker-info" style="padding:5px;">'+place.place_name+" "+place.distance+'(m)</div>');
        	$('.marker-info').animate({opacity:'0'},3000);
        });
	    
	    return marker;  
	}  
	
	function createMarkers(index){
		switch(index){
			case 0:
				places.categorySearch(category[0], subwaySearchCB, {useMapBounds:true, useMapCenter:true});			
				break;
			case 1:
				places.categorySearch(category[1], storeSearchCB, {useMapBounds:true, useMapCenter:true});
				break;
			case 2:
				places.categorySearch(category[2], coffeeSearchCB, {useMapBounds:true, useMapCenter:true});
				break;
			case 3:
				places.categorySearch(category[3], bankSearchCB, {useMapBounds:true, useMapCenter:true});
				break;
			default:
				places.categorySearch(category[4], publicSearchCB, {useMapBounds:true, useMapCenter:true});							
		}
							
	}
	
	function subwaySearchCB(data, status, pagination) {		
		if(status === daum.maps.services.Status.OK) {			
			for(var j=0; j<data.length; j++) {			
				var marker = createMarker(data[j], createMarkerImage(1));				
				subwayMarkers.push(marker);				
			}
		}		
	}
	function storeSearchCB(data, status, pagination) {		
		if(status === daum.maps.services.Status.OK) {			
			for(var j=0; j<data.length; j++) {			
				var marker = createMarker(data[j], createMarkerImage(2));
				storeMarkers.push(marker);				
			}
		}		
	}
	function coffeeSearchCB(data, status, pagination) {		
		if(status === daum.maps.services.Status.OK) {			
			for(var j=0; j<data.length; j++) {			
				var marker = createMarker(data[j], createMarkerImage(3));
				coffeeMarkers.push(marker);
			}			
		}
	}
	function bankSearchCB(data, status, pagination) {		
		if(status === daum.maps.services.Status.OK) {			
			for(var j=0; j<data.length; j++) {			
				var marker = createMarker(data[j], createMarkerImage(4));
				bankMarkers.push(marker);
			}
		}		
	}
	function publicSearchCB(data, status, pagination) {		
		if(status === daum.maps.services.Status.OK) {			
			for(var j=0; j<data.length; j++) {			
				var marker = createMarker(data[j], createMarkerImage(5));
				publicMarkers.push(marker);
			}			
		}	
	}
		
	createMarkers(0);
	createMarkers(1);
	createMarkers(2);
	createMarkers(3);
	createMarkers(4);
		
	// 마커들의 지도 표시 여부를 설정하는 함수
	function setStoreMarkers(index, map) {
		switch(index){
			case 0:
				for(var i=0; i<subwayMarkers.length;i++) {
					subwayMarkers[i].setMap(map);
				}
				break;
			case 1:
				for(var i=0; i<storeMarkers.length;i++) {
					storeMarkers[i].setMap(map);
				}
				break;
			case 2:
				for(var i=0; i<coffeeMarkers.length;i++) {
					coffeeMarkers[i].setMap(map);
				}
				break;
			case 3:
				for(var i=0; i<bankMarkers.length;i++) {
					bankMarkers[i].setMap(map);
				}
				break;
			default:
				for(var i=0; i<publicMarkers.length;i++) {
					publicMarkers[i].setMap(map);
				}				
		}	          
	}
	
	//아이콘 클릭시 맵에 표시/감추기 기능을 하는 함수
    $('.menus > ul > li').click(function(){    	    	
    	$(this).children().toggleClass('active');
    	if($(this).children().hasClass('active')){
    		setStoreMarkers($(this).index(),map);    			
    	}
    	else{
    		setStoreMarkers($(this).index(),null);    		    		
    	}    	
    });
    
    //사진 슬라이드 기능
    var index = 1;
    var totalPhoto = $('#totalIndex').html();    
    $('.prev').click(function() {    	
    	if(index != 1){
    		index--;
    	}
    	else{
    		index=totalPhoto;
    	}    	
    	$('#currentIndex').html(index);
    	    	
    	if(index-1 < 1 ){
    		$('.photo[data-index='+totalPhoto+']').css({'transform':'translate(-640px, 0px)','transition-duration': '0ms'});
    	}
    	else{
    		$('.photo[data-index='+(index-1)+']').css({'transform':'translate(-640px, 0px)','transition-duration': '0ms'});    		
    	}    	
    	$('.photo[data-index='+index+']').css({'transform':'translate(0px, 0px)','transition-duration': '300ms'});    	
    	if(index+1 > totalPhoto){
    		$('.photo[data-index=1]').css({'transform':'translate(640px, 0px)','transition-duration': '0ms'});
    	}
    	else{
    		$('.photo[data-index='+(index+1)+']').css({'transform':'translate(640px, 0px)','transition-duration': '300ms'});    		
    	}
    });
    $('.next').click(function() {    	
    	if(index != totalPhoto){
    		index++;
    	}
    	else{
    		index=1;
    	}
    	$('#currentIndex').html(index);
    	if(index-1 < 1 ){
    		$('.photo[data-index='+totalPhoto+']').css({'transform':'translate(-640px, 0px)','transition-duration': '0ms'});
    	}
    	else{
    		$('.photo[data-index='+(index-1)+']').css({'transform':'translate(-640px, 0px)','transition-duration': '300ms'});    		
    	}
    	$('.photo[data-index='+index+']').css({'transform':'translate(0px, 0px)','transition-duration': '300ms'});    	
    	if(index+1 > totalPhoto){
    		$('.photo[data-index=1]').css({'transform':'translate(640px, 0px)','transition-duration': '0ms'});
    	}
    	else{
    		$('.photo[data-index='+(index+1)+']').css({'transform':'translate(640px, 0px)','transition-duration': '0ms'});    		
    	}
    });
    
    // 가격정보 여러개일 시
    $('#price_info').hover(function() {// 마우스 오버
    	$('.list-wrap').prop("hidden",false);    	    	
    }, function() {// 마우스 아웃
    	$('.list-wrap').prop("hidden",true);
    });
    
    // 평/면적 변경
    $('.btn-pyeong').click(function(){
    	var area = $('#area').html();
    	var total_area = $('#total_area').html();
    	
    	if($('#area').next().html()=="P"){
    		$('#area').html((area*3.3058).toFixed(1));
    		$('#total_area').html((total_area*3.3058).toFixed(1))
    		$('#area').next().html("m").parent().append($('<sup/>').html("2"));
    		$('#total_area').next().html("m").parent().append($('<sup/>').html("2"));
    	}
    	else{
    		$('#area').html((area/3.3058).toFixed(1));
    		$('#total_area').html((total_area/3.3058).toFixed(1))
    		$('#area').next().html("P").parent().children('sup').remove();
    		$('#total_area').next().html("P").parent().children('sup').remove();   		    		
    	}    	
    });
    
    //찜 버튼 클릭
    $('#favorite').click(function(){
    	var member_no = $('#fmember_no').val();
    	var room_no = $('#froom_no').val();
    	if(member_no==""){
    		customAlert("warning", "찜하기는 로그인 후 이용가능합니다.");
    		return false;
    	}
    	
    	$(this).toggleClass('active');
    	if($(this).hasClass('active')){
    		$.ajax({
    			type:'post',
    			url:'/CBangProj/Room/Favorite.do',
    			data :
    			{
    				mode : "insert",
    				member_no: member_no,
    				room_no: room_no    							
    			},
    			dataType: 'text',
    			success:function(data){
    				if(data == "Y"){
    					customAlert("info", "현재 매물을 찜하였습니다.");
    				}
    			},
    			error:function(){
    				customAlert("error","찜 하기 오류");
    			}
    		});    		
    	}
    	else{
    		$.ajax({
    			type:'post',
    			url:'/CBangProj/Room/Favorite.do',
    			data :
    			{
    				mode : "delete",
    				member_no: member_no,
    				room_no: room_no    							
    			},
    			dataType: 'text',
    			success:function(data){
    				if(data == "Y"){
    					customAlert("info", "현재 매물에 찜하기가 취소되었습니다.");
    				}
    			},
    			error:function(){
    				customAlert("error","찜 하기 취소 오류");
    			}
    		});
    		
    	}
    });    
    
    //연락처 보기 클릭시
    $('#contactButton').click(function(){
    	$('#modelContact').modal();   	
    });
    
    //연락받기 클릭시(중개일 경우)
    $('#contactBtn').click(function(){
    	
    	var member_no = $('#member_no').html();
    	var room_no = $('#room_no').html();
    	var contact_info = $('#contact_info').val(); 
    	
    	if(contact_info == ""){
    		customAlert("error","남기실 연락처를 입력해주세요.");
    		return;
    	}
    	
    	if(member_no != ""){
    		$.ajax({
    			type:'post',
    			url:'/CBangProj//Room/Contact.do',
    			data :
    			{
    				member_no: member_no,
    				room_no: room_no,
    				contact_info: contact_info				
    			},
    			dataType: 'text',
    			success:function(data){
    				if(data == "Y"){
    					customAlert("info", "연락처를 남기는데 성공하였습니다.");
    				}
    			},
    			error:function(){
    				customAlert("error","연락요청 오류");
    			}
    		});
    	}
    	else{
    		customAlert("error","로그인 후 이용해주세요.");
    		$('#modelContact').modal('hide');    		
    		$('#modalLogin').modal();
    	}
    	
    });
    
    /* 스크롤바 감지 */
    $(document).scroll(function(){
    	var top = $('.neighborhood').offset().top - $('.infos').height();
    	var position = top - 60;
    	
    	if ($(document).scrollTop() >= position) {
    		$('.infos').attr("style", "position:absolute;top:"+top+"px;");    		
    	}
    	else{
    		$('.infos').removeAttr("style");
    	}  	    	
    });  
    
});
