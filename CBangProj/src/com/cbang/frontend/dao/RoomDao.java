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
		System.out.println("방등록");		
												
		return roomDto.getRoom_no();
	}
	
	public void insertDetail(DetailDto detailDto) {
		sqlMapper.insert("DetailInsert",detailDto);
		System.out.println("상세보기 등록");	
	}	
		
	public void insertBuildingOption(Map<String, Object> map) {
		sqlMapper.insert("BuildingOptionInsert",map);
		System.out.println("빌딩옵션 등록");
	}
	
	public void insertRoomOption(Map<String, Object> map) {
		sqlMapper.insert("RoomOptionInsert",map);
		System.out.println("매물옵션 등록");
	}
	
	public void insertTradeType(Map<String, Object> map) {
		sqlMapper.insert("TradeTypeInsert",map);
		System.out.println("거래형식 등록");		
	}
	
}
