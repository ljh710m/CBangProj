package model;

public class RoomOptionDto {
	
	private String room_no;
	private String option_code;
	private String name;
	
	//게터]
	public String getRoom_no() {
		return room_no;
	}
	public String getOption_code() {
		return option_code;
	}
	public String getName() {
		return name;
	}
	
	//세터]
	public void setRoom_no(String room_no) {
		this.room_no = room_no;
	}
	public void setOption_code(String option_code) {
		this.option_code = option_code;
	}
	public void setName(String name) {
		this.name = name;
	}	

}
