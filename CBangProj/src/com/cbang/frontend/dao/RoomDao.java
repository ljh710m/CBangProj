package com.cbang.frontend.dao;

import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import model.DetailDto;
import model.RoomDto;

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
	
}
