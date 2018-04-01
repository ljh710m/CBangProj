package model;

public class DetailDto {
	
	private String room_no;
	private String detail_addr;
	private String common_charge;
	private String charge_list;
	private String heating;
	private String elevator;
	private String move_date;
	private String total_floor;
	private String total_area;
	private String room_title;
	private String room_desc;
	private String memo;
	
	//게터]
	public String getRoom_no() {
		return room_no;
	}
	public String getDetail_addr() {
		return detail_addr;
	}
	public String getCommon_charge() {
		return common_charge;
	}
	public String getCharge_list() {
		return charge_list;
	}
	public String getHeating() {
		return heating;
	}
	public String getElevator() {
		return elevator;
	}
	public String getMove_date() {
		return move_date;
	}
	public String getTotal_floor() {
		return total_floor;
	}
	public String getTotal_area() {
		return total_area;
	}
	public String getRoom_title() {
		return room_title;
	}
	public String getRoom_desc() {
		return room_desc;
	}
	public String getMemo() {
		return memo;
	}
	
	//세터]
	public void setRoom_no(String room_no) {
		this.room_no = room_no;
	}
	public void setDetail_addr(String detail_addr) {
		this.detail_addr = detail_addr;
	}
	public void setCommon_charge(String common_charge) {
		this.common_charge = common_charge;
	}
	public void setCharge_list(String charge_list) {
		this.charge_list = charge_list;
	}
	public void setHeating(String heating) {
		this.heating = heating;
	}
	public void setElevator(String elevator) {
		this.elevator = elevator;
	}
	public void setMove_date(String move_date) {
		this.move_date = move_date;
	}
	public void setTotal_floor(String total_floor) {
		this.total_floor = total_floor;
	}
	public void setTotal_area(String total_area) {
		this.total_area = total_area;
	}
	public void setRoom_title(String room_title) {
		this.room_title = room_title;
	}
	public void setRoom_desc(String room_desc) {
		this.room_desc = room_desc;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
}
