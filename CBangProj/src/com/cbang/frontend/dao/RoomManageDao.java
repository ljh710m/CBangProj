package com.cbang.frontend.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import model.FavoriteCountDto;
import model.RoomManageDto;

@Repository
public class RoomManageDao {
	
	@Resource(name="sqlMapper")
	private SqlSessionTemplate sqlMapper;
	
	//전체 목록]
	public List<RoomManageDto> selectList(Map map){
		
		return sqlMapper.selectList("RoomManageList",map);
	}
	
	//총 레코드 수]
	public int getTotalRowCount(String member_no) {
				
		return sqlMapper.selectOne("RoomTotalCount",member_no);
	}
	
	//찜 숫자]
	public List<FavoriteCountDto> selectFavoriteCount() {
		
		return sqlMapper.selectList("RoomFavoriteCount");
	}	
	
	//메모 수정]
	public void updateMemo(Map map) {
		sqlMapper.update("RoomUpdateMemo",map);				
	}
	
	//거래 완료 처리]
	public void roomComplete(Map map) {
		sqlMapper.insert("RoomComplete1",map);
		sqlMapper.update("RoomComplete2",map);				
	}
	
	//삭제 처리]
	public void roomDelete(Map map) {
		sqlMapper.delete("RoomDelete1", map);
		sqlMapper.delete("RoomDelete2", map);
		sqlMapper.delete("RoomDelete3", map);
		sqlMapper.delete("RoomDelete4", map);
		sqlMapper.delete("RoomDelete5", map);
		sqlMapper.delete("RoomDelete6", map);
		sqlMapper.delete("RoomDelete7", map);
		sqlMapper.delete("RoomDelete8", map);
		sqlMapper.delete("RoomDelete9", map);
		sqlMapper.delete("RoomDelete10", map);
	}
	
	//연락온 매물]
	public List<RoomManageDto> selectContactList(Map map){
		
		return sqlMapper.selectList("RoomContactList",map);
	}
	
	//연락온 매물 레코드 수]
	public int getTotalContactCount(String member_no) {
		
		return sqlMapper.selectOne("RoomContactCount",member_no);		
	}

}
