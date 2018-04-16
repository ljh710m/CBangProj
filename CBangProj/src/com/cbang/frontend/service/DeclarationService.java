package com.cbang.frontend.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cbang.frontend.dao.DeclarationDao;
import com.cbang.frontend.dao.RoomDao;

import model.DeclarationDto;
import model.RoomDetailDto;

@Service("declarationService")
public class DeclarationService {
	
	@Resource(name="declarationDao")
	private DeclarationDao declarationDao;
	
	@Resource(name="roomDao")
	private RoomDao roomDao;
	
	public int update(Map<String, String> map) {
		int result = declarationDao.updateRoom(map);
		return result;
	}
	
	public void insert(Map<String, String> map) {
		declarationDao.insertFault(map);
	}
	
	

}
