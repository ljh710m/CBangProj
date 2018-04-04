package model;

public class SearchDto {
	private String room_no;//매물번호
	private String rent_type;//매물종류:월세or전세
	private String deposit1;//전세금
	private String deposit2;//보증금
	private String month_price;//월세
	private String trade_type;//거래종류:중개or직거래
	private String room_type;//방종류
	private String floor;//해당층수
	private String area;//전용면적
	private boolean parking;//주차여부
	private boolean pat;//반려동물
	private boolean short_term;//단기임대
	private String common_charge;//관리비
	private String room_title;//방제목
	private String stored_file_name;//사진명
	private String lat;//위도
	private String lng;//경도
	
	//게터]
	public String getRoom_no() {
		return room_no;
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
	public String getTrade_type() {
		return trade_type;
	}
	public String getRoom_type() {
		return room_type;
	}
	public String getFloor() {
		return floor;
	}
	public String getArea() {
		return area;
	}
	public boolean isParking() {
		return parking;
	}
	public boolean isPat() {
		return pat;
	}
	public boolean isShort_term() {
		return short_term;
	}
	public String getCommon_charge() {
		return common_charge;
	}
	public String getRoom_title() {
		return room_title;
	}
	public String getStored_file_name() {
		return stored_file_name;
	}	
	public String getLat() {
		return lat;
	}
	public String getLng() {
		return lng;
	}
	
	//세터]
	public void setRoom_no(String room_no) {
		this.room_no = room_no;
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
	public void setTrade_type(String trade_type) {
		this.trade_type = trade_type;
	}
	public void setRoom_type(String room_type) {
		this.room_type = room_type;
	}
	public void setFloor(String floor) {
		this.floor = floor;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public void setParking(boolean parking) {
		this.parking = parking;
	}
	public void setPat(boolean pat) {
		this.pat = pat;
	}
	public void setShort_term(boolean short_term) {
		this.short_term = short_term;
	}
	public void setCommon_charge(String common_charge) {
		this.common_charge = common_charge;
	}
	public void setRoom_title(String room_title) {
		this.room_title = room_title;
	}
	public void setStored_file_name(String stored_file_name) {
		this.stored_file_name = stored_file_name;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	public void setLng(String lng) {
		this.lng = lng;
	}
}
