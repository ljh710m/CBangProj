package com.cbang.frontend.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import model.LocationsDto;

@Repository
public class LocationsDao {
	
	@Resource(name="sqlMapper")
	private SqlSessionTemplate sqlMapper;
	
	public String insert(LocationsDto dto) {
		sqlMapper.insert("LocationsInsert", dto);
				
		return dto.getLocation_code();		
	}	

}
