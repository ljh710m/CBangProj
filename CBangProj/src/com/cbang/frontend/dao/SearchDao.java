package com.cbang.frontend.dao;

import java.util.Iterator;
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
		
		Iterator<String> keys = map.keySet().iterator();
		while(keys.hasNext()) {
			String key = keys.next();
			System.out.println(key+":"+ map.get(key));			
		}
		
		return sqlMapper.selectList("SearchRoom",map);
	}	
	
}
