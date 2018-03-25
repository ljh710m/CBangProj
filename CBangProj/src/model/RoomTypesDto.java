package model;

public class RoomTypesDto {
	
	private String rm_type_code;
	private String room_type;
	
	public RoomTypesDto(String rm_type_code, String room_type) {		
		this.rm_type_code = rm_type_code;
		this.room_type = room_type;
	}
	
	//게터]
	public String getRm_type_code() {
		return rm_type_code;
	}
	public String getRoom_type() {
		return room_type;
	}
	
	//세터]
	public void setRm_type_code(String rm_type_code) {
		this.rm_type_code = rm_type_code;
	}
	public void setRoom_type(String room_type) {
		this.room_type = room_type;
	}
}
