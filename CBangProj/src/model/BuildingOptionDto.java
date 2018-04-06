package model;

public class BuildingOptionDto {
	
	private String option_code;
	private String room_no;
	private String name;
	
	//게터]
	public String getOption_code() {
		return option_code;
	}
	public String getRoom_no() {
		return room_no;
	}
	public String getName() {
		return name;
	}
	
	//세터
	public void setOption_code(String option_code) {
		this.option_code = option_code;
	}
	public void setRoom_no(String room_no) {
		this.room_no = room_no;
	}
	public void setName(String name) {
		this.name = name;
	}
}
