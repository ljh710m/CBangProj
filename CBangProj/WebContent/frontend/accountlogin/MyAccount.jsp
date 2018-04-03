<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <link href="<c:url value='/images/favicon.ico'/>" rel="shortcut icon" />
	
	 <!-- Bootstrap core CSS -->
    <link href="<c:url value='/vendor/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet">
    <!-- Bootstrap theme -->
    <link href="<c:url value='/vendor/bootstrap/css/bootstrap-theme.min.css'/>" rel="stylesheet">
    <!-- Google fonts -->
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
    <!-- Font Awesome font -->
    <link href="<c:url value='/vendor/fontawesome/css/fa-regular.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/vendor/fontawesome/css/fa-solid.min.css'/>" rel="stylesheet">        
    <link href="<c:url value='/vendor/fontawesome/css/fa-brands.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/vendor/fontawesome/css/fontawesome.min.css'/>" rel="stylesheet">        
	
   
	<link href="<c:url value='/css/navbar.css'/>" rel="stylesheet">
    <link href="<c:url value='/css/myaccount.css'/>" rel="stylesheet">
    <link href="<c:url value='/css/main.css'/>" rel="stylesheet">
    <link href="<c:url value='/css/footer.css'/>" rel="stylesheet">
    
	<jsp:include page="/frontend/template/Navbar.jsp"/>
	<div class="myaccount-wrap">
		<div id="myaccount-component">
			<div class="myaccount-container">
				<div class="myaccount-content">
					<div class="myaccount-title-wrap">
						<h2 style="margin: 0;margin-bottom: 50px;">
							<img class="myimg" alt="내 계정"
								src="../../images/accountlogin/MyAccount.png">
						</h2>
					</div>
					<div class="content-myaccount-wrap">
						<form class="myaccount-form" id="FILE_FORM" method="post" enctype="multipart/form-data" action="">
							<div class="table-wrap">
								<div class="myaccount-table-header">
									<h3 class="myaccount-title">개인정보</h3>
									<button class="unregister-right myaccount-btn-unregister btn-no-border-unregister btn-no-bg-unregister"
										style="cursor: pointer;">회원탈퇴</button>
								</div>
								<table class="myaccount-table">
									<caption class="myaccount-caption">공인중개사 정보</caption>
									<colgroup class="myaccount-colgroup">
										<col style="width: 141px;">
										<col>
									</colgroup>
									<tbody class="myaccount-tbody">
										<tr>
											<th>프로필</th>
											<td><div class="MyProfile MyProfile--register">
													<div class="MyProfile-img"></div>
													<div class="MyProfile-img">
														<div class="MyProfile-upload" style="display: inline-block; position: static; z-index: 1; cursor: pointer;">
															사진변경
														</div>
														<div class="moxie-shim moxie-shim-html5"
															id="myaccount-image" 
															style="left: -1px; top: 73px; width: 92px; height: 18px; overflow: hidden; position: absolute; z-index: 0;">
															<input id="myaccount-image-input" name="myaccount-image-input"
																style="left: 0px; top: 0px; width: 100%; height: 100%; font-size: 999px; position: absolute; opacity: 0;"
																type="file" accept="image/png,image/gif,image/jpeg">
														</div>
													</div>
												</div></td>
										</tr>
										<tr>
											<th>본인 성명</th>
											<td>
												<div>
													<input name="name" class="input1 myaccount-form-control" required=""
														type="text" value="${sessionScope.name}">
												</div>
											</td>
										</tr>
										<tr>
											<th>이메일 주소</th>
											<td>${sessionScope.email}</td>
										</tr>
										<tr>
											<th rowspan="1">휴대폰 번호</th>
											<td><div class="myaccount-Phone">

													<div class="myaccount-Phone-auth"></div>

													<select name="0" disabled="" class="myaccount-form-control"
														required=""><option value="">번호선택</option>
														<option value="010">010</option>
														<option value="011">011</option>
														<option value="016">016</option>
														<option value="017">017</option>
														<option value="018">018</option>
														<option value="019">019</option>
													</select>
													<span class="myaccount-input-dash">-</span> 
													<input name="1" disabled=""
													class="input2 myaccount-form-control" required=""
													type="number" maxlength="4" max="9999" value="">
													<span class="myaccount-input-dash">-</span>
													<input name="2"
													disabled="" class="input2 myaccount-form-control"
													required="" type="number" maxlength="4" max="9999" value="">
												<button class="myaccount-btn myaccount-btn-white-blue" type="button">변경</button>
												</div>
												</td>
										</tr>
										<tr>
											<th>비밀번호 변경</th>
											<td class="modify-password">
												<div>
													<input name="prevPassword" class="input1 myaccount-form-control"
														type="password" placeholder="현재 비밀번호" value="">
													<span style="margin-left: 15px;">현재 비밀번호를 입력하세요</span>
												</div>
												<div>
													<input name="newPassword" class="input1 myaccount-form-control"
														type="password" placeholder="변경될 비밀번호" value="">
													<span style="margin-left: 15px;">변경될 입력번호를 입력하세요</span>
												</div>
												<div>
													<input name="confirmPassword" class="input1 myaccount-form-control"
														type="password" placeholder="변경될 비밀번호 확인" value=""><span
														style="margin-left: 15px;">변경될
														비밀번호를 한 번 더 입력하세요</span>
												</div></td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="myaccount-table-button-wrap">
								<div>
									<button class="myaccount-btn btn-myaccount-gray myaccount-btn-xl myaccount-border-radius-large"
										style="margin-right: 16px;">
										<i class="far fa-times-circle myaccount-nbang-icon myaccount-icon-size-2xl"></i>
										<span class="myaccount-icon-text">취소</span>
									</button>
									<button class="myaccount-btn btn-myaccount-pink myaccount-btn-xl myaccount-border-radius-large"
										type="submit">
										<i class="far fa-check-circle myaccount-nbang-icon myaccount-icon-size-2xl"></i>
										<span class="myaccount-icon-text">확인</span>
									</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/frontend/template/Footer.jsp"/>
	<!-- Placed at the end of the document so the pages load faster -->
    <script src="<c:url value='/vendor/jquery/jquery-3.3.1.min.js'/>"></script>     
    <script src="<c:url value='/vendor/bootstrap/js/bootstrap.min.js'/>"></script>
    <script src="<c:url value='/js/common.js'/>"></script>
    <script>

	$('.MyProfile-upload').click(function(){
			$('#myaccount-image-input').click();
		});

    
	 var sel_file;
	 $(document).ready(function(){
		$("#myaccount-image-input").on("change",handleImgFileSelect);
		
	 });
	 function handleImgFileSelect(e){
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		filesArr.forEach(function(f){
			if(!f.type.match("image.*")){
				alert("확장자는 이미지 확장자만 가능합니다.");
				return;
			}
			sel_file = f;
			var reader = new FileReader();
			reader.onload = function(e){
				$(".MyProfile-img").css("background", 'url(' + e.target.result + ') no-repeat center center').css("background-size","100px 100px");
				
			}
			reader.readAsDataURL(f);
			
		});	
	 }
	
</script>
    	
