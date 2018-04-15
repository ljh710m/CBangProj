package model;

public class RoomOptionCheckDto {
		
	private String option_code;
	private String name;
	private Boolean check;
	
	//게터]
	public String getName() {
		return name;
	}		
	public String getOption_code() {
		return option_code;
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
	public void setOption_code(String option_code) {
		this.option_code = option_code;
	}
}
	
