<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<link href="<c:url value='/vendor/sufee/css/bootstrap.min.css'/>" rel="stylesheet">
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
	        		<img alt="프로필사진" />
	        	</div>
	        	<div style="display: inline-block;float: right;width: 60%">
	        		중개사 회원번호:<label class="modal-office_no"></label>
	        		<br />
	        		E-mail:<label class="modal-email"></label>
	        		<br />
	        		회원명:<label class="modal-name"></label>
	        		<br />
	        		휴대폰 번호:<label class="modal-phone"></label>
	        		<br />
	        	</div>
	          
	        </div>
	        <div class="modal-footer">
	          <button type="button" class="btn btn-edit">수정</button>
	          <button type="button" class="btn btn-delete">삭제</button>
	          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
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
                        <h1>중개사 회원 관리</h1>
                    </div>
                </div>
            </div>
            <div class="col-sm-8">
                <div class="page-header float-right">
                    <div class="page-title">
                        <ol class="breadcrumb text-right">
                            <li class="active">Dashboard</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
		
		<!-- content -->
        <div class="content mt-3">        	
        	<div class="col-sm-10 col-sm-offset-1">
        		<div>
        			<table class="table table-hover">
        				<thead>
        				<tr>
        				<th>#</th>
        					<th>중개사 회원번호</th>
        					<th>회원 Email</th>
        					<th>회원명</th>
        					<th>휴대폰 번호</th>
        					<th>상세보기(관리)</th>
        				</tr>
        				</thead>
        				
        				<c:forEach items="${list }" var="list">
	        				<tbody>
	        					<tr style="cursor: pointer;">
		        					<th scope="row">회원NO</th>
		        					<td>${list.office_no }</td>
		        					<td>${list.email }</td>
		        					<td>${list.name }</td>
		        					<td>${list.phone }</td>
		        					<td>
		        					<a href="#" data-toggle="modal" data-target="#myModal" class="viewModal">보기</a>
		        					</td>
		        				</tr>
	        				</tbody>
        				</c:forEach>
        			</table>
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
    <script>
    (function($){
        $('.viewModal').click(function(){
        	var memberIdx = $(this).parent().parent().find('td:eq(0)').html();
        	var memberEmail = $(this).parent().parent().find('td:eq(1)').html();
        	var memberName = $(this).parent().parent().find('td:eq(2)').html();
        	var memberPhone = $(this).parent().parent().find('td:eq(3)').html();
				$('.modal-office_no').html(memberIdx);
				$('.modal-email').html(memberEmail);
				$('.modal-name').html(memberName);
				$('.modal-phone').html(memberPhone);
            });
	})(jQuery);
    </script>
</body>
</html>