package model;

public class RoomDto {

	private String room_no;
	private String member_no;	
	private String floor;
	private String area;
	private String location_code;
	private String rent_type;
	private String trade_type;
	private String rm_type_code;
	private String deposit1;
	private String deposit2;
	private String month_price;
	private String state;
	private java.sql.Date start_date;
	
	//게터]
	public String getRoom_no() {
		return room_no;
	}
	public String getMember_no() {
		return member_no;
	}
	public String getFloor() {
		return floor;
	}
	public String getArea() {
		return area;
	}
	public String getLocation_code() {
		return location_code;
	}
	public String getRent_type() {
		return rent_type;
	}
	public String getTrade_type() {
		return trade_type;
	}
	public String getRm_type_code() {
		return rm_type_code;
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
	public String getState() {
		return state;
	}
	public java.sql.Date getStart_date() {
		return start_date;
	}
	
	//세터]
	public void setRoom_no(String room_no) {
		this.room_no = room_no;
	}
	public void setMember_no(String member_no) {
		this.member_no = member_no;
	}
	public void setFloor(String floor) {
		this.floor = floor;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public void setLocation_code(String location_code) {
		this.location_code = location_code;
	}
	public void setRent_type(String rent_type) {
		this.rent_type = rent_type;
	}
	public void setTrade_type(String trade_type) {
		this.trade_type = trade_type;
	}
	public void setRm_type_code(String rm_type_code) {
		this.rm_type_code = rm_type_code;
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
	public void setState(String state) {
		this.state = state;
	}
	public void setStart_date(java.sql.Date start_date) {
		this.start_date = start_date;
	}	
	
}
