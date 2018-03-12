package service;

import java.util.Map;

public class RegisterRequest {
	
	private String id;
	private String name;
	private String password;
	private String confirmPassword;	
	private String email;
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getConfirmPassword() {
		return confirmPassword;
	}
	
	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	//password 필드와 confirmPassword 필드 값이 같은지 검사한다.
	public boolean isPasswordEqualToConfirm() {
		return password != null && password.equals(confirmPassword);
	}
	//각 필드의 데이터가 유효한지 검사한다. 파라미터로 전달받는 errors 맵 객체는 에러 정보를 담기 위해 사용.
	//필드 값이 올바르지 않은 경우 errors 맵 객체에 키 값으로 TRUE 값을 추가한다.
	//errors 파라미터는 RegisterHandler에서 생성해서 전달한다.
	public void validate(Map<String, Boolean> errors) {
		checkEmpty(errors, id, "id");
		checkEmpty(errors, name, "name");
		checkEmpty(errors, password, "password");
		checkEmpty(errors, confirmPassword, "confirmPassword");
		checkEmpty(errors, email, "email");
		if(!errors.containsKey("confirmPassword")) {
			if(!isPasswordEqualToConfirm()) {
				errors.put("notMatch", Boolean.TRUE);
			}
		}
	}
	//value가 값이 없는 경우 errors 맵 객체의 fieldName 키에 TRUE를 값으로 추가한다.
	private void checkEmpty(Map<String, Boolean> errors, String value, String fieldName) {
		if (value == null || value.isEmpty())
			errors.put(fieldName, Boolean.TRUE);		
	}
}
