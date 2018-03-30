package com.cbang.frontend.dao;

import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import model.MembershipDto;
import util.PBKDF2;

@Repository
public class PLoginDao {
	
	@Resource(name="sqlMapper")
	private SqlSessionTemplate sqlMapper;
	
	public int insert(MembershipDto dto) {
		try {
			dto.setPassword(PBKDF2.createHash(dto.getPassword()));
			
		} catch (Exception e) {System.out.println("PLoginDao Error");}
		
		return sqlMapper.insert("PLoginInsert", dto);
	}
	
	public int pInsert(MembershipDto dto) {
		try {
			dto.setPassword(PBKDF2.createHash(dto.getPassword()));
			
		} catch (Exception e) {System.out.println("PLoginDao Error");}
		
		return sqlMapper.insert("PLoginPInsert", dto);
	}
	
	public MembershipDto login(Map map) {
		return sqlMapper.selectOne("PLoginMembership", map);
	}

}