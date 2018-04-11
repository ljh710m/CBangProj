package com.cbang.frontend.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.cbang.frontend.dao.LocationsDao;
import com.cbang.frontend.dao.RoomDao;

import model.BuildingOptionDto;
import model.DetailDto;
import model.LocationsDto;
import model.OfficeDto;
import model.PhotoDto;
import model.RoomDetailDto;
import model.RoomDto;
import model.RoomOptionCheckDto;
import model.RoomOptionDto;
import model.TradeTypeDto;
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
	public String insert(LocationsDto locationDto, RoomDto roomDto, DetailDto detailDto,Map<String, Object> map, MultipartHttpServletRequest req) {		
		String locationCode = locationDao.insert(locationDto);
		roomDto.setLocation_code(locationCode);
		
		room_no = roomDao.insertRoom(roomDto);
		map.put("room_no", room_no);
		detailDto.setRoom_no(room_no);		
		
		try {
			List<Map<String,Object>> list = FileUpDownUtils.parseInsertFileInfo(req, room_no);
			map.put("fileList", list);
			roomDao.insertFile(map);
		} catch (Exception e) {e.printStackTrace();}
		
		roomDao.insertDetail(detailDto);
		if(map.containsKey("building_option")) roomDao.insertBuildingOption(map);
		if(map.containsKey("room_option")) roomDao.insertRoomOption(map);
		if(map.containsKey("tradeList")) roomDao.insertTradeType(map);
		
		return room_no;
	}
	
	public RoomDetailDto roomDetail(String room_no) {
		
		RoomDetailDto roomDetail = roomDao.selectRoom(room_no);
		switch(roomDetail.getRent_type()) {
			case "전세":
				if(Integer.parseInt(roomDetail.getDeposit1()) >= 10000) {
					if(Integer.parseInt(roomDetail.getDeposit1())%10000 == 0) {
						roomDetail.setDeposit1(Integer.parseInt(roomDetail.getDeposit1())/10000+"억원");
					}
					else {
						roomDetail.setDeposit1(Integer.parseInt(roomDetail.getDeposit1())/10000+"억"+Integer.parseInt(roomDetail.getDeposit1())%10000);					
					}
				}
				break;
			case "월세":
				if(Integer.parseInt(roomDetail.getDeposit2()) >= 10000) {
					if(Integer.parseInt(roomDetail.getDeposit2())%10000==0) {
						roomDetail.setDeposit2(Integer.parseInt(roomDetail.getDeposit2())/10000+"억원");
					}
					else {
						roomDetail.setDeposit2(Integer.parseInt(roomDetail.getDeposit2())/10000+"억"+Integer.parseInt(roomDetail.getDeposit2())%10000);	
					}
					
				}							
				break;		
		}
		
		List<BuildingOptionDto> buildingOption = roomDao.selectBuildingOption(room_no);
		for(int i=0; i<buildingOption.size(); i++) {
			switch(buildingOption.get(i).getName()) {
				case "주차가능":
					roomDetail.setParking(true);
					break;
				case "반려동물":
					roomDetail.setPat(true);
					break;
				case "단기임대":
					roomDetail.setShort_term(true);
					break;			
			}						
		}		
	
		return roomDetail;
	}
	
	public List<RoomOptionCheckDto> roomOption(String room_no){
		List<RoomOptionCheckDto> roomOptionList = roomDao.selectOptionList();
		
		List<RoomOptionDto> roomOption = roomDao.selectOption(room_no);
		for(int i=0; i<roomOption.size(); i++) {			
			switch(roomOption.get(i).getName()) {
				case "에어컨":
					roomOptionList.get(0).setCheck(true);
					break;
				case "세탁기":
					roomOptionList.get(1).setCheck(true);
					break;
				case "침대":
					roomOptionList.get(2).setCheck(true);
					break;
				case "책상":
					roomOptionList.get(3).setCheck(true);
					break;
				case "옷장":
					roomOptionList.get(4).setCheck(true);
					break;
				case "TV":
					roomOptionList.get(5).setCheck(true);
					break;
				case "신발장":
					roomOptionList.get(6).setCheck(true);
					break;
				case "냉장고":
					roomOptionList.get(7).setCheck(true);
					break;
				case "가스레인지":
					roomOptionList.get(8).setCheck(true);
					break;
				case "인덕션":
					roomOptionList.get(9).setCheck(true);
					break;
				case "전자레인지":
					roomOptionList.get(10).setCheck(true);
					break;
				case "전자도어락":
					roomOptionList.get(11).setCheck(true);
					break;
				case "비데":
					roomOptionList.get(12).setCheck(true);
					break;
			}
		}		
		
		return roomOptionList;		
	}
	
	public List<PhotoDto> roomPhotoList(String room_no){
		List<PhotoDto> roomPhotoList = roomDao.selectPhotoList(room_no);
		
		return roomPhotoList;
	}
	
	public List<TradeTypeDto> roomTradeType(String room_no){
		List<TradeTypeDto> roomTradeType = roomDao.selectTradeType(room_no);
		
		return roomTradeType;
	}
	
	public OfficeDto officeInfo(String office_no){
		
		return roomDao.selectOfficeInfo(office_no);
	}
	
	public void roomContact(Map map) {
		roomDao.insertRoomContact(map);
	}
	
	public void roomFavorite(Map map) {
		roomDao.insertRoomFavorite(map);
	}
	
	public void roomFavoriteCancle(Map map) {
		roomDao.deleteRoomFavorite(map);
	}
	
	public boolean roomFavoriteOne(String member_no, String room_no) {
		Map map = new HashMap<>();
		map.put("member_no", member_no);
		map.put("room_no", room_no);
		
		if(roomDao.selectOneFavorite(map)==1) {
			return true;
		}
		
		return false;	
	}
	
}