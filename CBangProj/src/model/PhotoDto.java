package model;

public class PhotoDto {
	
	private String photo_id;
	private String room_no;
	private String photo_path;
	private String name;
	
	//게터]
	public String getPhoto_id() {
		return photo_id;
	}
	public String getRoom_no() {
		return room_no;
	}
	public String getPhoto_path() {
		return photo_path;
	}
	public String getName() {
		return name;
	}
	
	//세터]
	public void setPhoto_id(String photo_id) {
		this.photo_id = photo_id;
	}
	public void setRoom_no(String room_no) {
		this.room_no = room_no;
	}
	public void setPhoto_path(String photo_path) {
		this.photo_path = photo_path;
	}
	public void setName(String name) {
		this.name = name;
	}
}
