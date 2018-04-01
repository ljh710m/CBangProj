package model;

public class LocationsDto {
	
	private String location_code;
	private String roadAddress;
	private String jibunAddress;
	private String lat;
	private String lng;
	private String sido;
	private String sigungu;
	private String bname;
	private String bname1;
	
	//게터]
	public String getLocation_code() {
		return location_code;
	}
	public String getRoadAddress() {
		return roadAddress;
	}
	public String getJibunAddress() {
		return jibunAddress;
	}
	public String getLat() {
		return lat;
	}
	public String getLng() {
		return lng;
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
	public String getBname1() {
		return bname1;
	}
	
	//세터]
	public void setLocation_code(String location_code) {
		this.location_code = location_code;
	}
	public void setRoadAddress(String roadAddress) {
		this.roadAddress = roadAddress;
	}
	public void setJibunAddress(String jibunAddress) {
		this.jibunAddress = jibunAddress;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	public void setLng(String lng) {
		this.lng = lng;
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
	public void setBname1(String bname1) {
		this.bname1 = bname1;
	}
	
}
