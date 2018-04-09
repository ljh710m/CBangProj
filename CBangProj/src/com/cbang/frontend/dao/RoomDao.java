package com.cbang.frontend.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import model.BuildingOptionDto;
import model.DetailDto;
import model.OfficeDto;
import model.PhotoDto;
import model.RoomDetailDto;
import model.RoomDto;
import model.RoomOptionCheckDto;
import model.RoomOptionDto;
import model.TradeTypeDto;

@Repository
public class RoomDao {
	
	@Resource(name="sqlMapper")
	private SqlSessionTemplate sqlMapper;
		
	public String insertRoom(RoomDto roomDto) {
		sqlMapper.insert("RoomInsert", roomDto);			
												
		return roomDto.getRoom_no();
	}
	
	public void insertDetail(DetailDto detailDto) {
		sqlMapper.insert("DetailInsert",detailDto);	
	}	
		
	public void insertBuildingOption(Map<String, Object> map) {
		sqlMapper.insert("BuildingOptionInsert",map);		
	}
	
	public void insertRoomOption(Map<String, Object> map) {
		sqlMapper.insert("RoomOptionInsert",map);		
	}
	
	public void insertTradeType(Map<String, Object> map) {
		sqlMapper.insert("TradeTypeInsert",map);			
	}
	
	public void insertFile(Map<String, Object> map) {
		sqlMapper.insert("FileInsert",map);
	}
	
	public RoomDetailDto selectRoom(String room_no) {
		
		return sqlMapper.selectOne("RoomDetail",room_no);
	}
	
	public List<BuildingOptionDto> selectBuildingOption(String room_no){
		
		return sqlMapper.selectList("RoomBuildingOption", room_no);
	}
	
	public List<RoomOptionDto> selectOption(String room_no){
		
		return sqlMapper.selectList("RoomOption",room_no);
	}
	
	public List<RoomOptionCheckDto> selectOptionList(){
		
		return sqlMapper.selectList("RoomOptionList");
	}
	
	public List<PhotoDto> selectPhotoList(String room_no){
		
		return sqlMapper.selectList("RoomPhotos",room_no);
	}
	
	public List<TradeTypeDto> selectTradeType(String room_no){
		
		return sqlMapper.selectList("RoomTradeType",room_no);
	}
	
	public OfficeDto selectOfficeInfo(String office_no) {
		
		return sqlMapper.selectOne("OfficeInfo", office_no);
	}
	
	public void insertRoomContact(Map map) {
		sqlMapper.insert("RoomContact", map);		
	}
	
	public void insertRoomFavorite(Map map) {
		sqlMapper.insert("RoomFavorite",map);
	}
	
	public void deleteRoomFavorite(Map map) {
		sqlMapper.insert("RoomFavoriteCancle",map);
	}
	
	public int selectOneFavorite(Map map) {
		int count = sqlMapper.selectOne("RoomFavoriteCheck",map);
				
		return count;
	}
}