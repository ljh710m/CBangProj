package model;

public class TradeTypeDto {
	
	private String deposit1;
	private String deposit2;
	private String month_price;
	private String room_no;
	
	//게터]
	public String getDeposit1() {
		return deposit1;
	}
	public String getDeposit2() {
		return deposit2;
	}
	public String getMonth_price() {
		return month_price;
	}
	public String getRoom_no() {
		return room_no;
	}
	
	//세터]
	public void setDeposit1(String deposit1) {
		this.deposit1 = deposit1;
	}
	public void setDeposit2(String deposit2) {
		this.deposit2 = deposit2;
	}
	public void setMonth_price(String month_price) {
		this.month_price = month_price;
	}
	public void setRoom_no(String room_no) {
		this.room_no = room_no;
	}
}
