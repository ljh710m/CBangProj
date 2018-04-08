package model;

public class OfficeDto {
	
	private String office_no;//중개등록번호
	private String office_name;//중개사무소명
	private String permit_no;//사업자등록번호
	private String address;//중개사무소 주소
	private String represent;//대표자명
	private String office_phone;//대표번호
	private String office_photo;//중개등록증
	private String permit_photo;//사업자등록증
	
	//게터]
	public String getOffice_no() {
		return office_no;
	}
	public String getOffice_name() {
		return office_name;
	}
	public String getPermit_no() {
		return permit_no;
	}
	public String getAddress() {
		return address;
	}
	public String getRepresent() {
		return represent;
	}
	public String getOffice_phone() {
		return office_phone;
	}
	public String getOffice_photo() {
		return office_photo;
	}
	public String getPermit_photo() {
		return permit_photo;
	}
	
	//세터]
	public void setOffice_no(String office_no) {
		this.office_no = office_no;
	}
	public void setOffice_name(String office_name) {
		this.office_name = office_name;
	}
	public void setPermit_no(String permit_no) {
		this.permit_no = permit_no;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public void setRepresent(String represent) {
		this.represent = represent;
	}
	public void setOffice_phone(String office_phone) {
		this.office_phone = office_phone;
	}
	public void setOffice_photo(String office_photo) {
		this.office_photo = office_photo;
	}
	public void setPermit_photo(String permit_photo) {
		this.permit_photo = permit_photo;
	}
}
