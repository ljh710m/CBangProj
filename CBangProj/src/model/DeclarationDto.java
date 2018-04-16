package model;

public class DeclarationDto {
	
	String fault_no;
	String type;
	String add_info;
	String phone;
	String room_no;
	String photo;
	String location_code;
	
	public DeclarationDto() {}

	public DeclarationDto(String fault_no, String type, String add_info, String phone, String room_no) {
		super();
		this.fault_no = fault_no;
		this.type = type;
		this.add_info = add_info;
		this.phone = phone;
		this.room_no = room_no;
	}
	
	public String getLocation_code() {
		return location_code;
	}

	public void setLocation_code(String location_code) {
		this.location_code = location_code;
	}

	public String getFault_no() {
		return fault_no;
	}
	public void setFault_no(String fault_no) {
		this.fault_no = fault_no;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getAdd_info() {
		return add_info;
	}
	public void setAdd_info(String add_info) {
		this.add_info = add_info;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getRoom_no() {
		return room_no;
	}
	public void setRoom_no(String room_no) {
		this.room_no = room_no;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}
	
}
