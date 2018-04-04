package com.cbang.frontend.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cbang.frontend.dao.SearchDao;

import model.SearchDto;

@Service("searchService")
public class SearchService {
	
	//DAO계열 클래스 주입받기]
	@Resource(name="searchDao")
	private SearchDao searchDao;
	
	public List<SearchDto> searchRoom(Map map){		
		Map initMap = new HashMap<>();
		initMap.put("trade_type","All");
		initMap.put("rent_type","All");
		initMap.put("room_type","All");				
		initMap.put("deposit1s",0);
		initMap.put("deposit1e",999999);
		initMap.put("deposit2s",0);
		initMap.put("deposit2e",999999);
		initMap.put("month1",0);
		initMap.put("month2",999999);		
		initMap.put("area1",0);
		initMap.put("area2",99999);
		initMap.put("floor1",-1);
		initMap.put("floor2",50);		
						
		return searchDao.searchRoom(initMap);
	}

}
