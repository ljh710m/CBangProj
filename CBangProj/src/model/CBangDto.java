package model;

import java.sql.Date;

public class CBangDto {
	
	private String memeber_no;//회원 번호
	private String name;//이름
	private String email;//이메일
	private String password;//비밀번호
	private String phone;//핸드폰 번호
	private String profile_photo;//프로필 사진
	private Date join_date;//가입일
	private String job;//직책
	private String office_no;//중개 등록번호
	private String path_code;//회원가입 경로
	private String office_name;//중개사무소명
	private String permit_no;//사업자 등록번호
	private String office_address;//중개사무소 주소
	private String represent;//중개사 대표자명
	private String office_phone;//대표번호
	
	public CBangDto(String memeber_no, String name, String email, String password, String phone, String profile_photo,
			Date join_date, String job, String office_no, String path_code, String office_name, String permit_no,
			String office_address, String represent, String office_phone) {
		this.memeber_no = memeber_no;
		this.name = name;
		this.email = email;
		this.password = password;
		this.phone = phone;
		this.profile_photo = profile_photo;
		this.join_date = join_date;
		this.job = job;
		this.office_no = office_no;
		this.path_code = path_code;
		this.office_name = office_name;
		this.permit_no = permit_no;
		this.office_address = office_address;
		this.represent = represent;
		this.office_phone = office_phone;
	}
	
	public String getMemeber_no() {
		return memeber_no;
	}
	public void setMemeber_no(String memeber_no) {
		this.memeber_no = memeber_no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getProfile_photo() {
		return profile_photo;
	}
	public void setProfile_photo(String profile_photo) {
		this.profile_photo = profile_photo;
	}
	public Date getJoin_date() {
		return join_date;
	}
	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getOffice_no() {
		return office_no;
	}
	public void setOffice_no(String office_no) {
		this.office_no = office_no;
	}
	public String getPath_code() {
		return path_code;
	}
	public void setPath_code(String path_code) {
		this.path_code = path_code;
	}
	public String getOffice_name() {
		return office_name;
	}
	public void setOffice_name(String office_name) {
		this.office_name = office_name;
	}
	public String getPermit_no() {
		return permit_no;
	}
	public void setPermit_no(String permit_no) {
		this.permit_no = permit_no;
	}
	public String getOffice_address() {
		return office_address;
	}
	public void setOffice_address(String office_address) {
		this.office_address = office_address;
	}
	public String getRepresent() {
		return represent;
	}
	public void setRepresent(String represent) {
		this.represent = represent;
	}
	public String getOffice_phone() {
		return office_phone;
	}
	public void setOffice_phone(String office_phone) {
		this.office_phone = office_phone;
	}
	
	
}
