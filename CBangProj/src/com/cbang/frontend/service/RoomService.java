package com.cbang.frontend.service;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.cbang.frontend.dao.LocationsDao;
import com.cbang.frontend.dao.RoomDao;

import model.DetailDto;
import model.LocationsDto;
import model.RoomDto;
import util.FileUpDownUtils;

@Service("roomService")
public class RoomService {

	//DAO계열 클래스 주입받기]
	@Resource(name="locationsDao")
	private LocationsDao locationDao;
	@Resource(name="roomDao")
	private RoomDao roomDao;
	private String room_no;
	
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor={Exception.class})
	public void insert(LocationsDto locationDto, RoomDto roomDto, DetailDto detailDto,Map<String, Object> map, MultipartHttpServletRequest req) {		
		String locationCode = locationDao.insert(locationDto);
		roomDto.setLocation_code(locationCode);
		
		room_no = roomDao.insertRoom(roomDto);
		map.put("room_no", room_no);
		detailDto.setRoom_no(room_no);

		FileUpDownUtils.

		roomDao.insertDetail(detailDto);
		if(map.containsKey("building_option")) roomDao.insertBuildingOption(map);
		if(map.containsKey("room_option")) roomDao.insertRoomOption(map);
		if(map.containsKey("tradeList")) roomDao.insertTradeType(map);
	}
}