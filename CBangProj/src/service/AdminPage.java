package service;

import java.util.List;

import model.AdminDto;

public class AdminPage {
	
	private int total;
	private List<AdminDto> content;
	
	public AdminPage(int total, List<AdminDto> content) {		
		this.total = total;
		this.content = content;		
	}

	public int getTotal() {
		return total;
	}
	
	public boolean hasNoAdmin() {
		return total==0;
	}
	
	public boolean hasAdmin() {
		return total > 0;
	}

	public List<AdminDto> getContent() {
		return content;
	}
	
}
