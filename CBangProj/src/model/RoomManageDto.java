package model;

public class RoomManageDto {
	
	private String room_no;//매물 번호
	private String room_type;//방 종류
	private String rent_type;//거래 종류
	private String deposit1;//전세금
	private String deposit2;//보증금
	private String month_price;//월세
	private String jibunAddress;//주소(지번)
	private String room_title;//방 제목
	private String memo;//비공개 메모
	private String state;//매물 상태
	private java.sql.Date start_date;//등록일
	private int favoriteCount;//찜 숫자
	private String stored_file_name;//대표사진
	
	//게터]
	public String getRoom_no() {
		return room_no;
	}
	public String getRoom_type() {
		return room_type;
	}
	public String getRent_type() {
		return rent_type;
	}
	public String getDeposit1() {
		return deposit1;
	}
	public String getDeposit2() {
		return deposit2;
	}
	public String getMonth_price() {
		return month_price;
	}
	public String getJibunAddress() {
		return jibunAddress;
	}
	public String getRoom_title() {
		return room_title;
	}
	public String getMemo() {
		return memo;
	}
	public String getState() {
		return state;
	}
	public java.sql.Date getStart_date() {
		return start_date;
	}
	public int getFavoriteCount() {
		return favoriteCount;
	}	
	public String getStored_file_name() {		
		return stored_file_name;
	}
	
	//세터]
	public void setRoom_no(String room_no) {
		this.room_no = room_no;
	}
	public void setRoom_type(String room_type) {
		this.room_type = room_type;
	}
	public void setRent_type(String rent_type) {
		this.rent_type = rent_type;
	}
	public void setDeposit1(String deposit1) {
		this.deposit1 = deposit1;
	}
	public void setDeposit2(String deposit2) {
		this.deposit2 = deposit2;
	}
	public void setMonth_price(String month_price) {
		this.month_price = month_price;
	}
	public void setJibunAddress(String jibunAddress) {
		this.jibunAddress = jibunAddress;
	}
	public void setRoom_title(String room_title) {
		this.room_title = room_title;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public void setState(String state) {
		this.state = state;
	}
	public void setStart_date(java.sql.Date start_date) {
		this.start_date = start_date;
	}
	public void setFavoriteCount(int favoriteCount) {
		this.favoriteCount = favoriteCount;
	}
	public void setStored_file_name(String stored_file_name) {
		this.stored_file_name = stored_file_name;
	}	
	
}

