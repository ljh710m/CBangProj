package model;

public class ContactRoomDto {
	
	private String member_no;
	private String room_no;
	private String contact_info;//남긴 연락처
	
	//게터]
	public String getMember_no() {
		return member_no;
	}
	public String getRoom_no() {
		return room_no;
	}
	public String getContact_info() {
		return contact_info;
	}
	
	//세터]
	public void setMember_no(String member_no) {
		this.member_no = member_no;
	}
	public void setRoom_no(String room_no) {
		this.room_no = room_no;
	}
	public void setContact_info(String contact_info) {
		this.contact_info = contact_info;
	}
}
