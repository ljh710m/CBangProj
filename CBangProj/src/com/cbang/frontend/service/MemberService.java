package com.cbang.frontend.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cbang.frontend.dao.MemberDao;

import model.MemberDto;

@Service("memberService")
public class MemberService {

	//DAO계열 클래스 주입받기]
	@Resource(name="memberDao")
	private MemberDao dao;
		
	public int insert(MemberDto dto) {		
		
		return dao.insert(dto);		
	}

}
