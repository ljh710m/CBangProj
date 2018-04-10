package com.cbang.frontend.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import model.BuildingOptionDto;
import model.SearchDto;

@Repository
public class FavoriteDao {
	@Resource(name="sqlMapper")
	private SqlSessionTemplate sqlMapper;
	
	public List<SearchDto> favoritedRoom(String member_no){
		
		return sqlMapper.selectList("FavoritedRoom", member_no);
	}
	
	public List<SearchDto> contactedRoom(String member_no){
		
		return sqlMapper.selectList("ContactedRoom", member_no);
	}
		
	public List<BuildingOptionDto> buildingOptionRoom(List<SearchDto> list){
		
		return sqlMapper.selectList("BuildingOptionList", list);
	}

}
