package model;

public class MemberDto {
	private String member_no;
	private String name;
	private String email;
	private String password;
	private String phone;
	private String profile_photo;
	private java.sql.Date join_date;
	private String job;
	private String office_no;
	private String path_code;
	
	//게터]
	public String getMember_no() {
		return member_no;
	}
	public String getName() {
		return name;
	}
	public String getEmail() {
		return email;
	}
	public String getPassword() {
		return password;
	}
	public String getPhone() {
		return phone;
	}
	public String getProfile_photo() {
		return profile_photo;
	}
	public java.sql.Date getJoin_date() {
		return join_date;
	}
	public String getJob() {
		return job;
	}
	public String getOffice_no() {
		return office_no;
	}
	public String getPath_code() {
		return path_code;
	}
	
	//세터]
	public void setMember_no(String member_no) {
		this.member_no = member_no;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public void setProfile_photo(String profile_photo) {
		this.profile_photo = profile_photo;
	}
	public void setJoin_date(java.sql.Date join_date) {
		this.join_date = join_date;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public void setOffice_no(String office_no) {
		this.office_no = office_no;
	}
	public void setPath_code(String path_code) {
		this.path_code = path_code;
	}
}
