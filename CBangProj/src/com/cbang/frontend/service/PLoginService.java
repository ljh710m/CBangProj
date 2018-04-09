package com.cbang.frontend.service;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cbang.frontend.dao.PLoginDao;

import model.MembershipDto;
import model.dao.MembershipDao;

@Service("pLoginService")
public class PLoginService {

	@Resource(name="PLoginDao")
	private PLoginDao dao;
	
	public int insert(MembershipDto dto) {
		return dao.insert(dto);
	}
	
	public int pInsert(MembershipDto dto) {
		return dao.pInsert(dto);
	}
	
	public String selectMember_no(String office_no) {
		return dao.selectMember_no(office_no);
	}

	public int isPermit_no(Map map) {
		return dao.isPermit_no(map);
	}
	
	public int updatePhoto(Map map) {
		return dao.updatePhoto(map);
	}
	
	public void updatePhoto2(Map map) {
		dao.updatePhoto2(map);
	}
	
}
