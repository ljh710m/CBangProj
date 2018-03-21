package model;

import java.sql.Date;

public class MembershipDto {
	
	private String member_no;
	private String name;
	private String email;
	private String password;
	private String phone;
	private String profile_photo;
	private Date join_date;
	private String job;
	private String office_no;
	private String path_code;
	private String office_name;
	private String permit_no;
	private String address;
	private String represent;
	private String office_phone;
	private String path_type;
	
	public MembershipDto(String member_no, String name, String email, String password, String phone,
			String profile_photo, Date join_date, String job, String office_no, String path_code, String office_name,
			String permit_no, String address, String represent, String office_phone, String path_type) {

		this.member_no = member_no;
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
		this.address = address;
		this.represent = represent;
		this.office_phone = office_phone;
		this.path_type = path_type;
	}

	public String getMember_no() {
		return member_no;
	}

	public void setMember_no(String member_no) {
		this.member_no = member_no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getOffice_email() {
		return email;
	}

	public void setOffice_email(String office_email) {
		this.email = office_email;
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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPath_type() {
		return path_type;
	}

	public void setPath_type(String path_type) {
		this.path_type = path_type;
	}	
	
	
	
}
