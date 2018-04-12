package model;

public class FavoriteCountDto {
	
	private String room_no;
	private int count;
	
	//게터]
	public String getRoom_no() {
		return room_no;
	}
	public int getCount() {
		return count;
	}
	
	//세터]
	public void setRoom_no(String room_no) {
		this.room_no = room_no;
	}
	public void setCount(int count) {
		this.count = count;
	}
}
