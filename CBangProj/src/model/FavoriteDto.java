package model;

public class FavoriteDto {
	
	private String member_no;//찜한 회원번호
	private String room_no;//찜한 매물번호
	
	//게터]
	public String getMember_no() {
		return member_no;
	}
	public String getRoom_no() {
		return room_no;
	}
	
	//세터]
	public void setMember_no(String member_no) {
		this.member_no = member_no;
	}
	public void setRoom_no(String room_no) {
		this.room_no = room_no;
	}	

}
