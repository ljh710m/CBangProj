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

}
