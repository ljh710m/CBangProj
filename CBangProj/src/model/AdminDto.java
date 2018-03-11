package model;

public class AdminDto {
	
	private String admin_code;
	private String id;
	private String password;
	private String name;
	private String email;
	private String privilege_code;
			
	public AdminDto(String admin_code, String id, String password, String name, String email, String privilege_code) {		
		this.admin_code = admin_code;
		this.id = id;
		this.password = password;
		this.name = name;
		this.email = email;
		this.privilege_code = privilege_code;
	}
	
	//게터]
	public String getAdmin_code() {
		return admin_code;
	}
	public String getId() {
		return id;
	}
	public String getPassword() {
		return password;
	}
	public String getName() {
		return name;
	}
	public String getEmail() {
		return email;
	}
	public String getPrivilege_code() {
		return privilege_code;
	}
	
	//세터]
	public void setAdmin_code(String admin_code) {
		this.admin_code = admin_code;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setPrivilege_code(String privilege_code) {
		this.privilege_code = privilege_code;
	}
	
	
	public boolean matchPassword(String pwd) {
		return password.equals(pwd);
	}

}
