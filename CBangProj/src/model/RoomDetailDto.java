package model;

public class RoomDetailDto {
	private String room_no;//매물번호
	private String rent_type;//매물종류:월세or전세
	private String deposit1;//전세금
	private String deposit2;//보증금
	private String month_price;//월세
	private String trade_type;//거래종류:중개or직거래
	private String room_type;//방종류
	private String floor;//해당층수
	private String total_floor;//건물층수
	private String area;//전용면적
	private String total_area;//공급면적 
	private boolean parking;//주차여부
	private boolean pat;//반려동물
	private boolean short_term;//단기임대
	private String elevator;//엘리베이터
	private String move_date;//입구가능일
	private String common_charge;//관리비
	private String charge_list;//관리비포함 항목
	private String heating;//난방종류
	private String room_title;//방제목
	private String room_desc;//상세 설명
	private String memo;//비공개 메모
	private String sido;//(시/도)
	private String sigungu;//(시/군/구)
	private String bname;//동
	private String lat;//위도
	private String lng;//경도
	private String member_no;//회원 번호
	private String name;//이름
	private String phone;//핸드폰 번호
	private String profile_photo;//프로필
	private String job;//직책
	private String office_no;//중개등록번호
	private boolean favorite;//찜 여부

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
	public String getTotal_floor() {
		return total_floor;
	}
	public String getArea() {
		return area;
	}
	public String getTotal_area() {
		return total_area;
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
	public String getElevator() {
		return elevator;
	}
	public String getMove_date() {
		return move_date;
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
	public String getRoom_title() {
		return room_title;
	}
	public String getRoom_desc() {
		return room_desc;
	}
	public String getMemo() {
		return memo;
	}
	public String getSido() {
		return sido;
	}
	public String getSigungu() {
		return sigungu;
	}
	public String getBname() {
		return bname;
	}
	public String getLat() {
		return lat;
	}
	public String getLng() {
		return lng;
	}
	public String getMember_no() {
		return member_no;
	}
	public String getPhone() {
		return phone;
	}
	public String getProfile_photo() {
		return profile_photo;
	}
	public String getJob() {
		return job;
	}
	public String getOffice_no() {
		return office_no;
	}	
	public String getName() {
		return name;
	}
	public boolean isFavorite() {
		return favorite;
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
	public void setTotal_floor(String total_floor) {
		this.total_floor = total_floor;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public void setTotal_area(String total_area) {
		this.total_area = total_area;
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
	public void setElevator(String elevator) {
		this.elevator = elevator;
	}
	public void setMove_date(String move_date) {
		this.move_date = move_date;
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
	public void setRoom_title(String room_title) {
		this.room_title = room_title;
	}
	public void setRoom_desc(String room_desc) {
		this.room_desc = room_desc;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public void setSido(String sido) {
		this.sido = sido;
	}
	public void setSigungu(String sigungu) {
		this.sigungu = sigungu;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	public void setLng(String lng) {
		this.lng = lng;
	}
	public void setMember_no(String member_no) {
		this.member_no = member_no;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public void setProfile_photo(String profile_photo) {
		this.profile_photo = profile_photo;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public void setOffice_no(String office_no) {
		this.office_no = office_no;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setFavorite(boolean favorite) {
		this.favorite = favorite;
	}	
}
