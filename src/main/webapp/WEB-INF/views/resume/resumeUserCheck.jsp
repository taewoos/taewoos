<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../include/header.jsp"%>

<body>


	<div class="container res_check_wrap">
		<h1>이력서 조회</h1>
		<br>
		<hr>

		<div class="row">

			<div class="col-md-2 fileDiv">
				<img id="fileImg" src="<c:url value='/img/img_ready.png'/>">
			</div>

			<div>
				<h2 class="res_userName">${article.resName}
					&nbsp;<small>${article.resBirth}</small>
				</h2>
				<h4>
					휴대폰 <small>${article.resPhone1}-${article.resPhone2}-${article.resPhone3}</small>
				</h4>
				<h4>
					Email <small>${article.resEmail}</small>
				</h4>
				<h4>
					주소 <small>${article.resAddrbasic}&nbsp;${article.resAddrdetail}</small>
				</h4>
			</div>

		</div>
		<div class="row res_summary">
			<div class="col-md-offset-2  col-md-3">
				<h2>학력</h2>
				<h4>${article.resEdu[0].eduOrg}</h4>
				<small>${article.resEdu[0].eduState}</small>
			</div>
	
	
			<div class="col-md-3">
				<h2>경력</h2>
				<h4>${article.resCrr[0].crrCom}</h4>
				<small><fmt:formatDate value="${article.resCrr[0].crrAddt}" pattern="yyyy-MM-dd"/> 입사<br>
				<fmt:formatDate value="${article.resCrr[0].crrGrdt}" pattern="yyyy-MM-dd"/> 퇴사
				</small>
			</div>

			<div class="col-md-3">
				<h2>자격증</h2>
				<h4>${article.resCert[0].certName}</h4>
				<small>${article.resCert[0].certOrg}</small>
			</div>

		</div>

		<h1 class="ResDetail_wrap" id="EduDetail_wrap">
			학력사항 <a><img src="<c:url value='/img/viewMore.png' />" /> </a>
		</h1>

		<div class="row ResDetail" id="EduDetail">

			<table class="table table-hover col-md-8 rec_check_list">
				<thead>
					<tr>
						<th>학교/기관명</th>
						<th>전공</th>
						<th>입학일</th>
						<th>졸업일</th>
						<th>졸업여부</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach var="edu" items="${article.resEdu}">
						<tr>
							<td>${edu.eduOrg}</td>
							<td>${edu.eduMjr}</td>
							<td><fmt:formatDate value="${edu.eduAddt}" pattern="yyyy-MM-dd"/></td>
							<td><fmt:formatDate value="${edu.eduGrdt}" pattern="yyyy-MM-dd"/></td>
							<td>${edu.eduState}</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>

		</div>

		<h1 class="ResDetail_wrap" id="CrrDetail_wrap">
			경력사항 <a><img src="<c:url value='/img/viewMore.png' />" /> </a>
		</h1>

		<div class="row ResDetail" id="CrrDetail">

			<table class="table table-hover col-md-8 rec_check_list">
				<thead>
					<tr>
						<th>회사명</th>
						<th>부서명(담당업무)</th>
						<th>근무시작일</th>
						<th>근무종료일</th>
						<th>직위</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="crr" items="${article.resCrr}">
						<tr>
							<td>${crr.crrCom}</td>
							<td>${crr.crrDept}</td>
							<td><fmt:formatDate value="${crr.crrAddt}" pattern="yyyy-MM-dd"/></td>
							<td><fmt:formatDate value="${crr.crrGrdt}" pattern="yyyy-MM-dd"/></td>
							<td>${crr.crrPos}</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>

		</div>

		<h1 class="ResDetail_wrap" id="CertDetail_wrap">
			자격증 <a><img src="<c:url value='/img/viewMore.png' />" /> </a>
		</h1>

		<div class="row ResDetail" id="CertDetail">

			<table class="table table-hover col-md-8 rec_check_list">
				<thead>
					<tr>
						<th>자격증명</th>
						<th>발행기관</th>
						<th>취득일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="cert" items="${article.resCert}">
						<tr>
							<td>${cert.certName}</td>
							<td>${cert.certOrg}</td>
							<td><fmt:formatDate value="${cert.certDate}" pattern="yyyy-MM-dd"/></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

		</div>

		<hr>

		<div class="col-md-3 form-group res_write_btn_wrap">
		
		         <button class="btn btn-primary res_del_btn" id="delBtn">
            	<span>삭제</span>
         		</button>

			<button type="submit" class="btn btn-insert res_insert_btn"
				onclick="location.href='${pageContext.request.contextPath}/resume/resumeModify?resNo=${article.resNo}'">
				<span>이력서 수정</span>
			</button>
			<button type="submit" class="btn btn-cancel res_cancel_btn"
				onclick="location.href='${pageContext.request.contextPath}/resume/resumeList?pageNum=${p.pageNum}&cpp=${p.cpp}&condition=${p.condition}&keyword=${p.keyword}'">
				<span>목록</span>
			</button>

		</div>

		<input type="hidden" name="pageNum" value="${pc.paging.pageNum}">
		<input type="hidden" name="cpp" value="${pc.paging.cpp}"> <input
			type="hidden" name="condition" value="${pc.paging.condition}">
		<input type="hidden" name="keyword" value="${pc.paging.keyword}">
		<input type="hidden" value="${article.userId}">

		<form name="DeleteForm"action="" method="post">
			<input type="hidden" name="resNo" value="${article.resNo}">
		</form>

	</div>

	<%@ include file="../include/footer.jsp"%>

	<script>
		$(document).ready(
				function() {
					const fileLoca = '${article.resFile[0].fileLoca}';
					const fileName = '${article.resFile[0].fileName}';
					const src = '<c:url value="/resume/display?fileLoca='
							+ fileLoca + '&fileName=' + fileName + '" />'

					console.log(src);
					$('#fileImg').attr('src', src);

					$('#CrrDetail_wrap>a').click(function() {
						var submenu = $('#CrrDetail');
						
						if (submenu.is(":visible")) {
							submenu.slideUp();
						} else {
							submenu.slideDown();
						}
					}).mouseover(function() {
						$('#CrrDetail').slideDown();
					});
					
					$('#EduDetail_wrap>a').click(function() {
						var submenu = $('#EduDetail');
						
						if (submenu.is(":visible")) {
							submenu.slideUp();
						} else {
							submenu.slideDown();
						}
					}).mouseover(function() {
						$('#EduDetail').slideDown();
					});
					
					$('#CertDetail_wrap>a').click(function() {
						var submenu = $('#CertDetail');
						
						if (submenu.is(":visible")) {
							submenu.slideUp();
						} else {
							submenu.slideDown();
						}
					}).mouseover(function() {
						$('#CertDetail').slideDown();
					});
					
			    	$('#delBtn').click(function() {
						if(confirm('정말 삭제하시겠습니까?')) {
							$('form[name=DeleteForm]').attr('action', '<c:url value="/resume/resumeDelete" />');
							$('form[name=DeleteForm]').submit();
						}
					});

				});
	</script>