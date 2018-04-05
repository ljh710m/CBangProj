package com.cbang.frontend.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import model.SearchDto;

@Repository
public class SearchDao {
	
	@Resource(name="sqlMapper")
	private SqlSessionTemplate sqlMapper;	
	
	public List<SearchDto> searchRoom(Map map){
				
		return sqlMapper.selectList("SearchRoom",map);
	}	
	
}
