package com.cbang.frontend.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import model.BuildingOptionDto;
import model.BuildingOptionListDto;
import model.FavoriteDto;
import model.RoomTypesDto;
import model.SearchDto;

@Repository
public class SearchDao {
	
	@Resource(name="sqlMapper")
	private SqlSessionTemplate sqlMapper;	
	
	public List<SearchDto> searchRoom(Map map){
				
		return sqlMapper.selectList("SearchRoom",map);
	}
	
	public List<BuildingOptionDto> buildingOptionList(Map map){
		
		return sqlMapper.selectList("BOptionList", map);
	}
	
	public List<BuildingOptionListDto> buildingOptions(){
		
		return sqlMapper.selectList("BOptions");
	}
	
	public List<RoomTypesDto> roomTypes(){
		
		return sqlMapper.selectList("RoomTypes");
	}
	
	public List<FavoriteDto> memberFavorite(String member_no){
		
		return sqlMapper.selectList("MemberFavorite",member_no);
	}
	
}
