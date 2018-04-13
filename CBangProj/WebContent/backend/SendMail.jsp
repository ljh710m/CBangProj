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
	<title>매물 목록</title>

	<!-- Basic CSS -->
	<link href="<c:url value='/vendor/sufee/css/normalize.css'/>" rel="stylesheet">	
	<link href="<c:url value='/vendor/sufee/css/bootstrap.min.css'/>" rel="stylesheet">
	<link href="<c:url value='/vendor/sufee/scss/style.css'/>" rel="stylesheet">	
	<link href="<c:url value='/vendor/sufee/css/font-awesome.min.css'/>" rel="stylesheet">
	<link href="<c:url value='/vendor/sufee/css/themify-icons.css'/>" rel="stylesheet">     
    <link href="<c:url value='/vendor/sufee/css/flag-icon.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/vendor/sufee/css/cs-skin-elastic.css'/>" rel="stylesheet">
    
    <!-- JQuery CSS -->
    <link href="<c:url value='/vendor/jquery/css/jquery-ui.css'/>" rel="stylesheet">    
	<!-- Fonts -->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>
    
    <!-- Custom styles -->
    <link href="<c:url value='/css/util/alert.css'/>" rel="stylesheet">
    <link href="<c:url value='/css/util/pagination.css'/>" rel="stylesheet">
    <style>
    	ol li:hover{
    		color: blue;
    		font-weight: bold;
    </style>
    <!-- Basic script -->
    <script src="<c:url value='/vendor/jquery/jquery-3.3.1.min.js'/>"></script>
    <script type="text/javascript">

	    $(function(){          
	    	$('#btn-upload').click(function(e){  
	    		$("input:file").click();               
	    		var ext = $("input:file").val().split(".").pop().toLowerCase();
	    		if(ext.length > 0){
	    			if($.inArray(ext, ["gif","png","jpg","jpeg"]) == -1) { 
	    				alert("gif,png,jpg 파일만 업로드 할수 있습니다.");
	    				return false;  
	    			}                  
	    		}
	    		$("input:file").val().toLowerCase();
	    	});                         
	    });
	  
	    
	    $(function (){
	    	$('#popup').click(function(e){
	    	 window.open("Popup.jsp", "a", "width=600, height=700, left=100, top=50");
	    	});
	    });
	    
	    $(function (){
	    	$('#popup2').click(function(e){
	    	 window.open("Popup.jsp", "a", "width=600, height=700, left=100, top=50");
	    	});
	    });
    </script>
</head>
<body>
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
                        <h1>메일 쓰기</h1>
                    </div>
                </div>
            </div>
            <div class="col-sm-8">
                <div class="page-header float-right">
                    <div class="page-title">
                        <ol class="breadcrumb text-right" style="cursor: pointer;">
                            <li>회원 목록</li>
                            <li>내용</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
		
		<!-- content -->
        <div class="content mt-3">
        	<div class="row animated fadeIn">
        		<!-- 건물 옵션 -->     		       
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            <strong class="card-title">회원 목록</strong>
                        </div>
                        <div class="card-body">
                        	<div class="row">
	                        	<div class="col-lg-12">
	                        		 <div class="row form-group">
			                            <div class="col col-md-1"><label for="text-input" class=" form-control-label">받는 사람</label></div>
			                            <div class="col-12 col-md-10">
			                            	<input type="text" id="text-input" name="text-input" placeholder="메일 주소를 입력하세요" class="form-control">
			                            </div>
			                            <div><button class="btn btn-secondary" id="popup">주소록</button></div>
			                         </div>
			                         <div class="row form-group">
			                            <div class="col col-md-1"><label for="text-input" class=" form-control-label">참조</label></div>
			                            <div class="col-12 col-md-10">
			                            	<input type="text" id="text-input" name="text-input" placeholder="참조할 주소를 입력하세요" class="form-control">
			                            </div>
			                            <div><button class="btn btn-secondary" id="popup2">주소록</button></div>
			                         </div>
			                         <div class="row form-group">
			                            <div class="col col-md-1"><label for="text-input" class=" form-control-label">제목</label></div>
			                            <div class="col-12 col-md-10"><input type="text" id="text-input" name="text-input" placeholder="제목을 입력하세요" class="form-control"></div>
			                         </div>
			                         <div class="row form-group">
			                            <div class="col col-md-5" >
			                            	<label for="text-input" class=" form-control-label">파일 첨부</label>
			                           		<a href="#caret-square-o-down"><i class="fa fa-caret-square-o-down"></i></a>
						                    <div style="padding-left: 100px; margin-top: -35px;">
						                    <input type='file' id='file' name='file' style="width: 0;height: 0;" />
						                    <button type="file" id="btn-upload" class="btn btn-primary btn-sm" >
						                        <i class="fa fa-dot-circle-o"></i> 파일 선택
						                    </button>
						                    <button type="reset" class="btn btn-danger btn-sm">
						                       <i class="fa fa-ban"></i> 파일 삭제
						                    </button>
						                    </div>
			                            </div>
			                         </div>
			                         <div class="col-lg-12">
		                    			 <div class="card" style="margin-left: 88px; ">
							                 <div class="card-body card-block">
						                       <form action="" method="post" enctype="multipart/form-data" class="form-horizontal">
						                          <div class="col-lg-12">
								                    <div class="card">
								                        <div class="card-body">
								                            <table class="table table-bordered">
								                              <thead class="thead-dark">
								                                <tr>
								                                  <th scope="col" style="width:5%;"><input type="checkbox"/></th>
								                                  <th scope="col" style="width:85%;">파일명</th>
								                                  <th scope="col">파일 크기</th>
								                                </tr>
								                              </thead>
								                              <tbody>
								                                <tr>
								                                  <th scope="row"><input type="checkbox"/></th>
								                                  <td>Otto</td>
								                                  <td>@mdo</td>
								                                </tr>
								                              </tbody>
								                            </table>
								                        </div>
								                    </div>
								                </div>
						                      </form>
							                </div>		                      
							                 
							            </div>
			                  		</div>
		                      </div>
	                     </div>
                  	 </div>	                  		
                  </div>
               </div>
           </div><!-- 건물 옵션 -->
                <!-- 방종류 -->
               <div class="row animated fadeIn">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            <strong class="card-title">내용</strong>
                        </div>
                        <div class="card-body">
                        	<div class="row">
	                        	<div class="col-lg-12">                      	
		                            <table class="table table-hover">
		                            	 <div class="row form-group">
				                            <div class="col-12 col-md-12"><textarea name="textarea-input" id="textarea-input" rows="9" placeholder="내용을 입력하세요" class="form-control"></textarea></div>
				                         </div>
			                  		</table>
			                  		<!-- pagination start-->
				                    <div id="pagingR">
				                    	${roomPaging}		                	
					                </div>
					                <!-- pagination end-->
		                  		</div>
		                  		
	                  		</div> 
                        </div>
                        <div style="padding-left: 540px;">             	
		                    <button type="submit" class="btn btn-primary btn-lg " >
		                        <i class="fa fa-dot-circle-o"></i> 전송
		                    </button>
		                    
		                    <button type="reset" class="btn btn-danger btn-lg ">
		                       <i class="fa fa-ban"></i> 취소
		                    </button>
						</div>
                    </div>
                </div>                     	
        	</div>      	
        </div> <!-- .content -->
    </div><!-- /#right-panel -->
    <!-- Right Panel -->

	<!-- Basic script -->	
    <script src="<c:url value='/vendor/jquery/jquery-3.3.1.min.js'/>"></script>    
    <script src="<c:url value='/vendor/jquery/jquery-ui.min.js'/>"></script>    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>    
    <script src="<c:url value='/vendor/sufee/js/plugins.js'/>"></script>
    <script src="<c:url value='/vendor/sufee/js/main.js'/>"></script>
    <!-- Additional Script -->
    <script src="<c:url value='/js/util/alert.js'/>"></script>
    <script src="<c:url value='/js/manage/optionmanage.js'/>"></script>            
       
</body>
</html>