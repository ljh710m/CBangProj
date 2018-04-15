package com.cbang.frontend.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cbang.frontend.dao.RoomManageDao;

import model.FavoriteCountDto;
import model.RoomManageDto;

@Service("roomManageService")
public class RoomManageService {
	
	@Resource(name="roomManageDao")
	RoomManageDao dao;
	
	public List<RoomManageDto> selectList(Map map){
				
		List<RoomManageDto> list = dao.selectList(map);
		List<FavoriteCountDto> countList = dao.selectFavoriteCount();
		
		for(int i=0; i<countList.size(); i++) {			
			for(int j=0; j<list.size(); j++) {
				if(countList.get(i).getRoom_no().equals(list.get(j).getRoom_no())) {
					list.get(j).setFavoriteCount(countList.get(i).getCount());
					break;
				}
			}
		}
		
		return list;
	}
	
	public int getTotalRowCount(String member_no) {
		
		return dao.getTotalRowCount(member_no);		
	}
	
	public void modifyMemo(Map map) {
		dao.updateMemo(map);
	}
	
	public void roomComplete(Map map) {
		dao.roomComplete(map);
	}
	
	public void roomDelete(Map map) {
		dao.roomDelete(map);
	}
	
	public List<RoomManageDto> selectContactList(Map map){
		
		List<RoomManageDto> list = dao.selectContactList(map);
		List<FavoriteCountDto> countList = dao.selectFavoriteCount();
		
		for(int i=0; i<countList.size(); i++) {			
			for(int j=0; j<list.size(); j++) {
				if(countList.get(i).getRoom_no().equals(list.get(j).getRoom_no())) {
					list.get(j).setFavoriteCount(countList.get(i).getCount());
					break;
				}
			}
		}
		
		return list;
	}
	
	public int getTotalContactCount(String member_no) {
		
		return dao.getTotalContactCount(member_no);
	}
	
}
