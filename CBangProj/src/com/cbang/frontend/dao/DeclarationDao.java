package com.cbang.frontend.dao;

import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import model.DeclarationDto;

@Repository
public class DeclarationDao {

	@Resource(name="sqlMapper")
	private SqlSessionTemplate sqlMapper;
	
	public int updateRoom(Map<String, String> map) {
		return sqlMapper.update("UpdateRoom",map);
	}
	
	public int insertFault(Map<String, String> map) {
		return sqlMapper.insert("InsertFault", map);
	}
	
}
