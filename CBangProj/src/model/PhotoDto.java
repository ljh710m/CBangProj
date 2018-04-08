package model;

public class PhotoDto {
	
	private String photo_id;//사진코드
	private String room_no;//매물번호
	private String original_file_name;//원본 파일명
	private String stored_file_name;//저장 파일명
	private String file_size;//파일크기
	private String crea_dtm;//생성일
	private String del_gb;//대표구분
	
	//게터]
	public String getPhoto_id() {
		return photo_id;
	}
	public String getRoom_no() {
		return room_no;
	}
	public String getOriginal_file_name() {
		return original_file_name;
	}
	public String getStored_file_name() {
		return stored_file_name;
	}
	public String getFile_size() {
		return file_size;
	}
	public String getCrea_dtm() {
		return crea_dtm;
	}
	public String getDel_gb() {
		return del_gb;
	}
	
	//세터]
	public void setPhoto_id(String photo_id) {
		this.photo_id = photo_id;
	}
	public void setRoom_no(String room_no) {
		this.room_no = room_no;
	}
	public void setOriginal_file_name(String original_file_name) {
		this.original_file_name = original_file_name;
	}
	public void setStored_file_name(String stored_file_name) {
		this.stored_file_name = stored_file_name;
	}
	public void setFile_size(String file_size) {
		this.file_size = file_size;
	}
	public void setCrea_dtm(String crea_dtm) {
		this.crea_dtm = crea_dtm;
	}
	public void setDel_gb(String del_gb) {
		this.del_gb = del_gb;
	}	
}
