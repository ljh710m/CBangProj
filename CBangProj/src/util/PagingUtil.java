package util;

public class PagingUtil {

	public static String pagingText(int totalRecordCount,int pageSize,int blockPage,int nowPage,String page){
		String pagingStr="";
		
		//1.전체 페이지 구하기
		int totalPage= (int)(Math.ceil(((double)totalRecordCount/pageSize)));
		
		int intTemp = ((nowPage - 1) / blockPage) * blockPage + 1;
	
		//처음 및 이전을 위한 로직
		if(intTemp != 1){
            pagingStr+="<li><a class=\"Pagination-item Pagination-item--prev\" href='"+page+"nowPage="+(intTemp -blockPage)+"'>&lt; PREV</a></li>";
		}
		else {
			pagingStr+="<li><a class=\"Pagination-item Pagination-item--prev\">&lt; PREV</a></li>";
		}
		
		//페이지 표시 제어를 위한 변수
		int blockCount = 1;
		
		//페이지를 뿌려주는 로직
		//블락 페이지 수만큼 혹은 마지막 페이지가 될때까지 페이지를 표시한다1 
		while(blockCount <= blockPage && intTemp <= totalPage){  // 페이지 오버 를 체크
				//현재 페이지를 의미함
			if(intTemp == nowPage){
				pagingStr+="<li><a class=\"Pagination-item active\">"+intTemp+"</a></li>";				
			}
		    else		    	
				pagingStr+="<li><a class=\"Pagination-item\" href='"+page+"nowPage="+intTemp+"'>"+intTemp+"</a></li>";
		       
			intTemp = intTemp + 1;
			blockCount = blockCount + 1;
		
		}

		//다음 및 마지막을 위한 로직
			
		if(intTemp <= totalPage){
			pagingStr+="<li><a class=\"Pagination-item Pagination-item--next\" href="+page+"nowPage="+intTemp+">NEXT &gt;</a></li>";
		}
		else {
			pagingStr+="<li><a class=\"Pagination-item Pagination-item--next\">NEXT &gt;</a></li>";
		}
		
		return pagingStr;
	}
	
}
