package model;

public class AdminPrivilegeDto {
	
	private String privilege_code;
	private String privilege_info;
	
	public AdminPrivilegeDto(String privilege_code, String privilege_info) {		
		this.privilege_code = privilege_code;
		this.privilege_info = privilege_info;
	}

	//게터]
	public String getPrivilege_code() {
		return privilege_code;
	}
	public String getPrivilege_info() {
		return privilege_info;
	}
	
	//세터]
	public void setPrivilege_code(String privilege_code) {
		this.privilege_code = privilege_code;
	}
	public void setPrivilege_info(String privilege_info) {
		this.privilege_info = privilege_info;
	}
}
