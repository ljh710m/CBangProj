package util;

public class MembershipPagingUtil {
	
	public static String pagingText(int totalRecordCount,int pageSize,int blockPage,int nowPage,String page){
		
		String pagingStr="<nav style='text-align: center;'><ul class='pagination'>";
		
		//전체 페이지 구하기
		int totalPage= (int)(Math.ceil(((double)totalRecordCount/pageSize)));
		
		int intTemp = ((nowPage - 1) / blockPage) * blockPage + 1;

		//이전을 위한 로직
		if(intTemp != 1){
			pagingStr+="<li>\r\n" +					
					"<a href='#' aria-label='Previous'>\r\n" + 
					"<span aria-hidden='true'>&laquo;</span>\r\n" + 
					"</a>\r\n" + 
					"</li>";			
		}
		
		//페이지 표시 제어를 위한 변수
		int blockCount = 1;
		
		//페이지를 뿌려주는 로직
		//블락 페이지 수만큼 혹은 마지막 페이지가 될때까지 페이지를 표시한다.
		while(blockCount <= blockPage && intTemp <= totalPage){  // 페이지 오버 를 체크
			//현재 페이지를 의미함
			if(intTemp == nowPage){
				//pagingStr+="<li><a href='#'><span style='Color:red'>"+intTemp+"</span></a></li>";
				pagingStr+="<li class='active'><a href='#'><span>"+intTemp+"</span></a></li>";
			}
		     else
		    	 pagingStr+="<li><a href='membership.admin?nowPage="+intTemp+"'>"+intTemp+"</a></li>";
		       
			intTemp = intTemp + 1;
			blockCount = blockCount + 1;		
		}

		//다음을 위한 로직
		if(intTemp <= totalPage){
			pagingStr+="<li>\r\n" + 
					"<a href='#' aria-label='Next'>\r\n" + 
					"<span aria-hidden='true'>&raquo;</span>\r\n" + 
					"</a>\r\n" + 
					"</li>\r\n";			   
		}
		pagingStr+="</ul></nav>";
		return pagingStr;
	}
	
}
