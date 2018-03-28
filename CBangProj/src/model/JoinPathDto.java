package model;

public class JoinPathDto {
	
	private String path_code;
	private String path_type;
	
	public JoinPathDto(String path_code, String path_type) {		
		this.path_code = path_code;
		this.path_type = path_type;
	}
	
	//게터]
	public String getPath_code() {
		return path_code;
	}
	public String getPath_type() {
		return path_type;
	}

	//세터]
	public void setPath_code(String path_code) {
		this.path_code = path_code;
	}
	public void setPath_type(String path_type) {
		this.path_type = path_type;
	}
	
}
