package model;

public class JoinPathCountDto {
	
	private String path_code;
	private String path_type;
	private String count;
		
	public JoinPathCountDto() {}
	public JoinPathCountDto(String path_code, String path_type, String count) {		
		this.path_code = path_code;
		this.path_type = path_type;
		this.count = count;
	}
	
	//게터]
	public String getPath_code() {
		return path_code;
	}
	public String getPath_type() {
		return path_type;
	}
	public String getCount() {
		return count;
	}
	
	//세터]
	public void setPath_code(String path_code) {
		this.path_code = path_code;
	}
	public void setPath_type(String path_type) {
		this.path_type = path_type;
	}
	public void setCount(String count) {
		this.count = count;
	}

}
