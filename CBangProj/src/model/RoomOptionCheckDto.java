package model;

public class RoomOptionCheckDto {
		
	private String name;
	private Boolean check;
	
	//게터]	
	public String getName() {
		return name;
	}		
	public Boolean getCheck() {
		return check;
	}
	
	//세터]	
	public void setName(String name) {
		this.name = name;
	}
	public void setCheck(Boolean check) {
		this.check = check;
	}
}
