package model;

public class BuildingOptionListDto {
	
	private String option_code;
	private String name;
	
	public BuildingOptionListDto(String option_code, String name) {		
		this.option_code = option_code;
		this.name = name;
	}
	
	//게터]
	public String getOption_code() {
		return option_code;
	}
	public String getName() {
		return name;
	}
	
	//세터]
	public void setOption_code(String option_code) {
		this.option_code = option_code;
	}

	public void setName(String name) {
		this.name = name;
	}
	
}
