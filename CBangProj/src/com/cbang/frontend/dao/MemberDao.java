package com.cbang.frontend.dao;

import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import model.MemberDto;
import util.PBKDF2;

@Repository
public class MemberDao {
	
	@Resource(name="sqlMapper")
	private SqlSessionTemplate sqlMapper;
	
	public int insert(MemberDto dto) {		
		try {
			dto.setPassword(PBKDF2.createHash(dto.getPassword()));
		} catch (Exception e) {}		
		
		return sqlMapper.insert("MemberInsert", dto);		
	}
	
	public MemberDto login(Map map) {
				
		return sqlMapper.selectOne("MemberLogin", map);
	}

}
