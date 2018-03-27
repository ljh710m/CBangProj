<%@page import="jdbc.connection.ConnectionProvider"%>
<%@page import="model.MembershipDto"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model.dao.MembershipDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%	

	//한글처리]
	request.setCharacterEncoding("UTF-8");
	//검색과 관련된 파라미터 받기]
	String searchColumn = request.getParameter("searchColumn");
	String searchWord   = request.getParameter("searchWord");
	//검색후 페이징과 관련된 파라미터를 전달할 값을 저장할 변수]
	String addQuery="";			
	//전체 목록 가져오기]
	MembershipDao dao = new MembershipDao();
	Map<String,Object> map = new HashMap<String,Object>();
	if(searchColumn !=null){
		addQuery+="searchColumn="+searchColumn+"&searchWord="+searchWord+"&";
		map.put("searchColumn",searchColumn);
		map.put("searchWord",searchWord);
	}
	//페이징을 위한 로직 시작]
	
	//전체 레코드 수
 	int totalRecordCount = dao.getTotalRecordCount(map);

	//페이지 사이즈
	int pageSize=10;
	//블락페이지
	int blockPage=10;
	//전체 페이지수]
	int totalPage =(int)Math.ceil((double)totalRecordCount/pageSize);
	//현재 페이지를 파라미터로 받기]
	int nowPage = request.getParameter("nowPage")==null ? 1 : Integer.parseInt(request.getParameter("nowPage"));
	//시작 및 끝 ROWNUM구하기]
	int start= (nowPage-1)*pageSize +1;
	int end  = nowPage*pageSize;
	map.put("start",start);
	map.put("end",end);
	//페이징을 위한 로직 끝]	
	List<MembershipDto> list=dao.membershipList(ConnectionProvider.getConnection(), start, end);
	//자원반납
	dao.close();

%>  --%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <link href="<c:url value='/images/favicon.ico'/>" rel="shortcut icon" />
	<title>CBang Admin</title>

	<!-- Basic CSS -->
	<link href="<c:url value='/vendor/sufee/css/normalize.css'/>" rel="stylesheet">
	<link href="<c:url value='/vendor/sufee/css/bootstrap.css'/>" rel="stylesheet">
	<link href="<c:url value='/vendor/sufee/scss/style.css'/>" rel="stylesheet">
	<link href="<c:url value='/vendor/sufee/css/font-awesome.min.css'/>" rel="stylesheet">
	<link href="<c:url value='/vendor/sufee/css/themify-icons.css'/>" rel="stylesheet">     
    <link href="<c:url value='/vendor/sufee/css/flag-icon.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/vendor/sufee/css/cs-skin-elastic.css'/>" rel="stylesheet">    
	<!-- Fonts -->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>
    
    <!-- Custom styles -->
    <link href="<c:url value='/css/util/alert.css'/>" rel="stylesheet">
    
</head>
<body>

	<!-- Modal -->
	  <div class="modal fade" id="myModal" role="dialog">
	    <div class="modal-dialog">
	    
	      <!-- Modal content-->
	      <div class="modal-content">
	        <div class="modal-header">
	          <h4 class="modal-title">상세보기</h4>
	          <button type="button" class="close" data-dismiss="modal">×</button>
	        </div>
	        <div class="modal-body">
	        	<div style="display: inline-block;">
	        		<img style="margin-top: 100%;margin-left: 30px;" 
	        		class="modal-profile_photo" src="<c:url value='/images/account/blankImage.jpg' />" alt="프로필사진" />
	        	</div>
	        	<div style="display: inline-block;float: right;width: 60%">
	        		중개등록번호:<label class="modal-office_no"></label>
	        		<br />
	        		회원명:<label class="modal-name"></label>
	        		<br />
	        		휴대폰 번호:<label class="modal-phone"></label>
	        		<br />
	        		E-mail:<label class="modal-email"></label>
	        		<br />
	        		사업자 등록번호:<label class="modal-permit_no"></label>
	        		<br />
	        		중개사무소 주소:<label class="modal-address"></label>
	        		<br />
	        		중개사무소 대표자명:<label class="modal-represent"></label>
	        		<br />
	        		대표번호:<label class="modal-office_phone"></label>
	        		<br />
	        		직책:<label class="modal-job"></label>
	        		<br />
	        		가입일:<label class="modal-join_date"></label>
	        		<br />
	        		가입 경로코드:<label class="modal-path_code"></label>
	        		<br />
	        		가입 경로:<label class="modal-path_type"></label>
	        		<br />
	        	</div>
	          
	        </div>
	        <div class="modal-footer">
	          <button type="button" class="btn btn-delete">탈퇴</button>
	          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	        </div>
	      </div>
	      
	    </div>
	  </div>
    <!-- Left Panel -->
    <jsp:include page="/backend/template/LeftPanel.jsp"/>
	
    <!-- Right Panel -->
    <div id="right-panel" class="right-panel">
        <!-- Header-->
        <jsp:include page="/backend/template/Header.jsp"/>
        
        <div class="breadcrumbs">
            <div class="col-sm-4">
                <div class="page-header float-left">
                    <div class="page-title">
                        <h1>중개사 회원 관리(<%-- <%=nowPage %>/<%=totalPage %>--%>)</h1>
                    </div>
                </div>
            </div>
            <div class="col-sm-8">
                <div class="page-header float-right">
                    <div class="page-title">
                        <ol class="breadcrumb text-right">
                            <li class="active">회원 리스트</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
		
		<!-- content -->
        <div class="content mt-3">        	
        	<div class="col-sm-12">
        		<div>
					<table class="table table-hover">
						<thead>
							<tr>
								<th>#</th>
								<th>중개사 회원번호</th>
								<th>회원 Email</th>
								<th>회원명</th>
								<th>휴대폰 번호</th>
								<th>상세보기</th>
							</tr>
						</thead>
						<c:if test="${not empty list }" var="result">
							<c:forEach items="${list }" var="list" varStatus="loop">
								<tbody>
									<tr style="cursor: pointer;">
										<th scope="row" style="width: 5%;text-align: left;">${loop.index+1 }</th>
										<td style="width: 20%;text-align: left;">${list.office_no }</td>
										<td style="width: 30%;">${list.email }</td>
										<td style="width: 10%;">${list.name }</td>
										<td style="width: 15%;">${list.phone }</td>
										<td hidden>${list.path_type }</td>
										<td hidden>${list.path_code }</td>
										<td hidden>${list.join_date }</td>
										<td hidden>${list.job }</td>
										<td hidden>${list.office_phone }</td>
										<td hidden>${list.permit_no }</td>
										<td hidden>${list.represent }</td>
										<td hidden>${list.address }</td>
										<td style="width: 5%;"><a href="#" data-toggle="modal"
											data-target="#myModal" class="viewModal">보기</a></td>
									</tr>
								</tbody>
							</c:forEach>
						</c:if>
						<c:if test="${not result }">
							<tbody>
								<tr>
									<td colspan="6">등록된 중개사회원이 없습니다.</td>
								</tr>
							</tbody>
						</c:if>
					</table>
					<nav>
				<ul class="pagination">
					<li><a href="#" aria-label="Previous"> <span
							aria-hidden="true">&laquo;</span>
					</a></li>
					<li><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li><a href="#" aria-label="Next"> <span
							aria-hidden="true">&raquo;</span>
					</a></li>
				</ul>
			</nav>
        		</div>
        	</div>
		</div> <!-- .content -->
    </div><!-- /#right-panel -->
    <!-- Right Panel -->
	
	<!-- /.modal -->
	<!-- Basic script -->
    <script src="<c:url value='/vendor/jquery/jquery-3.3.1.min.js'/>"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>    
    <script src="<c:url value='/vendor/sufee/js/plugins.js'/>"></script>
    <script src="<c:url value='/vendor/sufee/js/main.js'/>"></script>
    
    <!-- Additional Script -->  
    <script src="<c:url value='/js/util/alert.js'/>"></script>
    <script src="<c:url value='/js/admin/membership.js'/>"></script>  
</body>
</html>