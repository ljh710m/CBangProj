package com.cbang.frontend.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cbang.frontend.dao.FavoriteDao;
import com.cbang.frontend.dao.SearchDao;

import model.BuildingOptionDto;
import model.FavoriteDto;
import model.SearchDto;

@Service("favoriteService")
public class FavoriteService {	
	
	@Resource(name="searchDao")
	private SearchDao searchDao;
	
	@Resource(name="favoriteDao")
	private FavoriteDao favoriteDao;

	public List<SearchDto> visitedRoom(List<String> Roomlist, String member_no){
		List<SearchDto> list = favoriteDao.visitedRoom(Roomlist);
		
		if(member_no != null) {
			List<FavoriteDto> memberFavorite = searchDao.memberFavorite(member_no);
			if(memberFavorite != null) {
				for(int i=0; i<memberFavorite.size(); i++) {					
					for(int j=0; j<list.size(); j++) {						
						if(memberFavorite.get(i).getRoom_no().equals(list.get(j).getRoom_no())) {							
							list.get(j).setFavorite(true);							
							break;
						}
					}
				}				
			}
		}
		
		if(list.size() != 0) {
			List<BuildingOptionDto>	buildingOptionList = favoriteDao.buildingOptionRoom(list);
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
		}
		
		return list;	
		
	}
	
	public List<SearchDto> favoritedRoom(String member_no){	
		
		List<SearchDto> list = favoriteDao.favoritedRoom(member_no);
		
		for(int i=0; i<list.size(); i++) {
			list.get(i).setFavorite(true);
		}
		
		if(list.size() != 0) {
			List<BuildingOptionDto>	buildingOptionList = favoriteDao.buildingOptionRoom(list);
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
		}
		
		return list;		
	}
	
	public List<SearchDto> contactedRoom(String member_no){	
		
		List<SearchDto> list = favoriteDao.contactedRoom(member_no);
		
		List<FavoriteDto> memberFavorite = searchDao.memberFavorite(member_no);
		if(memberFavorite != null) {
			for(int i=0; i<memberFavorite.size(); i++) {					
				for(int j=0; j<list.size(); j++) {						
					if(memberFavorite.get(i).getRoom_no().equals(list.get(j).getRoom_no())) {							
						list.get(j).setFavorite(true);							
						break;
					}
				}
			}				
		}
		
		if(list.size() != 0) {
			List<BuildingOptionDto>	buildingOptionList = favoriteDao.buildingOptionRoom(list);
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
		}
		
		return list;		
	}
}
