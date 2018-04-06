package com.cbang.frontend.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cbang.frontend.dao.SearchDao;

import model.BuildingOptionDto;
import model.BuildingOptionListDto;
import model.RoomTypesDto;
import model.SearchDto;

@Service("searchService")
public class SearchService {
	
	//DAO계열 클래스 주입받기]
	@Resource(name="searchDao")
	private SearchDao searchDao;
	
	public Map<String, List> listsMap(){		
		Map<String, List> map = new HashMap<>();
		
		List<BuildingOptionListDto> buildingOptions = searchDao.buildingOptions();
		List<RoomTypesDto> roomTypes = searchDao.roomTypes();
		
		map.put("buildingOptions", buildingOptions);
		map.put("roomTypes", roomTypes);
		
		return map;
	}
	
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
		
		List<SearchDto> list = searchDao.searchRoom(initMap);		
		List<BuildingOptionDto>	buildingOptionList = searchDao.buildingOptionList(initMap);
		for(int i=0; i<buildingOptionList.size(); i++) {			
			if(buildingOptionList.get(i).getName().equals("주차가능")) {				
				for(int j=0; j<list.size();j++) {					
					if(list.get(j).getRoom_no().equals(buildingOptionList.get(i).getRoom_no())) {						
						list.get(j).setParking(true);
						break;
					}
				}
			}
			if(buildingOptionList.get(i).getName().equals("반려동물")) {				
				for(int j=0; j<list.size();j++) {					
					if(list.get(j).getRoom_no().equals(buildingOptionList.get(i).getRoom_no())) {						
						list.get(j).setPat(true);
						break;
					}
				}				
			}
			if(buildingOptionList.get(i).getName().equals("단기임대")) {				
				for(int j=0; j<list.size();j++) {					
					if(list.get(j).getRoom_no().equals(buildingOptionList.get(i).getRoom_no())) {						
						list.get(j).setShort_term(true);
						break;
					}
				}				
			}
		}
		
		return list;
	}

}
