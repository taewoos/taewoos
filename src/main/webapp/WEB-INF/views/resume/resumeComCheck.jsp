<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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
				<small><fmt:formatDate value="${article.resCrr[0].crrAddt}"
						pattern="yyyy-MM-dd" /> 입사<br> <fmt:formatDate
						value="${article.resCrr[0].crrGrdt}" pattern="yyyy-MM-dd" /> 퇴사 </small>
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

			<table class="table table-hover col-md-8 rec_check_list" id="resedu">
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
							<td><fmt:formatDate value="${edu.eduAddt}"
									pattern="yyyy-MM-dd" /></td>
							<td><fmt:formatDate value="${edu.eduGrdt}"
									pattern="yyyy-MM-dd" /></td>
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
			<table class="table table-hover col-md-8 rec_check_list" id="rescrr">
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
							<td><fmt:formatDate value="${crr.crrAddt}"
									pattern="yyyy-MM-dd" /></td>
							<td><fmt:formatDate value="${crr.crrGrdt}"
									pattern="yyyy-MM-dd" /></td>
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
			<table class="table table-hover col-md-8 rec_check_list" id="rescert">
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
							<td><fmt:formatDate value="${cert.certDate}"
									pattern="yyyy-MM-dd" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

		</div>

		<hr>

		<div class="row">

			<div class="col-md-8 res_check_prog">

				<h2>진행 단계</h2>
				<h1 id="step" style="text-align: center">심사 진행 중</h1>

			</div>



		</div>


		<div class="row">


			<form>
				<div class="col-md-2">
					<h2>
						서류 <small>1차</small>
					</h2>
					<button type="button" class="btn btn-default btn-insert"
						name="reqPreg" id="1stPass" style="margin-top: 0px;">합격</button>
					<button type="button" class="btn btn-default btn-cancel"
						name="reqPreg" id="1stFail">합격 취소</button>
				</div>


				<div class="col-md-2">
					<h2>
						면접 <small>2차</small>
					</h2>
					<button type="button" class="btn btn-default btn-insert"
						name="reqPreg" id="2ndPass" style="margin-top: 0px;">합격</button>
					<button type="button" class="btn btn-default btn-cancel"
						name="reqPreg" id="2ndFail">합격 취소</button>
				</div>


				<div class="col-md-2">
					<h2>최종</h2>
					<button type="button" class="btn btn-default btn-insert"
						name="reqPreg" id="3rdPass" style="margin-top: 0px;">합격</button>
					<button type="button" class="btn btn-default btn-cancel"
						name="reqPreg" id="3rdFail">합격 취소</button>
				</div>

				<div class="col-md-3">
					<button type="button" class="btn btn-default btn-del btn-lg"
						name="reqPreg" id="Fail">불합격</button>

				</div>

				<div class="col-md-4 res_check_download">
					<button type="button" class="btn btn-default btn-modif btn-lg"
						id="excelDownload">이력서 다운로드</button>
				</div>
			</form>
		</div>


	</div>

	<%@ include file="../include/footer.jsp"%>


	<table class="table table-hover col-md-8 rec_check_list" id="resinfo"
		style="visibility: hidden;">
		<thead>
			<tr>
				<th>이름</th>
				<th>생년월일</th>
				<th>휴대폰번호</th>
				<th>이메일</th>
				<th>주소</th>
			</tr>
		</thead>
		<tbody>

			<tr>
				<td>${article.resName}</td>
				<td>${article.resBirth}</td>
				<td>${article.resPhone1}-${article.resPhone2}-${article.resPhone3}</td>
				<td>${article.resEmail}</td>
				<td>${article.resAddrbasic}&nbsp;${article.resAddrdetail}</td>
			</tr>
		</tbody>
	</table>


	<script>
		$(document)
				.ready(
						function() {
							const fileLoca = '${article.resFile[0].fileLoca}';
							const fileName = '${article.resFile[0].fileName}';
							const src = '<c:url value="/resume/display?fileLoca='
									+ fileLoca
									+ '&fileName='
									+ fileName
									+ '" />'

							console.log(src);
							$('#fileImg').attr('src', src);

							//////////////////////////////////////////////////////////////////////////////////////////////
							const reqPreg = '${article.reqStep[0].reqPreg}';

							console.log(reqPreg);

							if (reqPreg == '5') {
								$('#step').text('심사 대기');
							} else if (reqPreg == '1') {
								$('#step').text('서류 합격');
							} else if (reqPreg == '2') {
								$('#step').text('면접 합격');
							} else if (reqPreg == '3') {
								$('#step').text('최종 합격');
							} else {
								$('#step').text('불합격');
							}

							///////////////////////////////////////////////////////////////////////

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
							})

							/////////////////////////////////////////////////////////////

							const excelDownload = document
									.querySelector('#excelDownload');

							window.addEventListener('DOMContentLoaded',
									function() {

										excelDownload.addEventListener('click',
												exportExcel);

									});

							function exportExcel() {
								console.log(reqPreg);

								var workBook = XLSX.utils.book_new();

								XLSX.utils.book_append_sheet(workBook,
										XLSX.utils.table_to_sheet(document
												.getElementById('resinfo')),
										"resinfo");
								XLSX.utils.book_append_sheet(workBook,
										XLSX.utils.table_to_sheet(document
												.getElementById('resedu')),
										"resedu");
								XLSX.utils.book_append_sheet(workBook,
										XLSX.utils.table_to_sheet(document
												.getElementById('rescrr')),
										"rescrr");
								XLSX.utils.book_append_sheet(workBook,
										XLSX.utils.table_to_sheet(document
												.getElementById('rescert')),
										"rescert");

								workBookOut = XLSX.writeFile(workBook,
										'Resume.xlsx', {
											bookType : 'xlsx',
											type : 'binary'
										});

								saveAs(new Blob([ s2ab(workBookOut) ], {
									type : "application/octet-stream"
								}), excelHandler.getExcelFileName());
							}

							var excelHandler = {
								getExcelFileName : function() {
									return '${article.resName}'; //파일명
								}
							}

							function s2ab(s) {
								var buf = new ArrayBuffer(s.length); //convert s to arrayBuffer
								var view = new Uint8Array(buf); //create uint8array as viewer
								for (var i = 0; i < s.length; i++)
									view[i] = s.charCodeAt(i) & 0xFF; //convert to octet
								return buf;
							}

							/////////////////////////////////////////////////////////////////////////////////////

							//1차 합격 
							$('#1stPass')
									.click(
											function() {

												// 5:심사 대기 1:1차 합격 2:2차 합격 3:3차합격 4:불합격  
												const reqPreg = '${article.reqStep[0].reqPreg}';
												const resNo = '${article.resNo}';
												//
												if (reqPreg !== '5') {
													alert('서류 심사단계가 아닙니다!');
													return;
												} else
													(reqPreg == '5')

												$
														.ajax({
															type : 'post',
															url : '<c:url value="/resume/reqstepUpdate"/>',
															data : JSON
																	.stringify({
																		'resNo' : resNo,
																		'reqPreg' : '1',
																	}),
															contentType : 'application/json; charset=utf-8',
															dataType : 'text',

															success : function(
																	result) {
																if (result === 'UpdateSuccess') {
																	alert('정상 처리되었습니다.');
																	location
																			.reload(true);
																} else {
																	alert('서류합격 처리에 실패했습니다. 관리자에게 문의 해 주세요.');
																}
															},
															error : function() {
																alert('서류합격 처리에 실패했습니다. 관리자에게 문의 해 주세요.');
															}

														}); //ajax				
											}); // 1차 합격 

							//2차 합격 
							$('#2ndPass')
									.click(
											function() {

												// 5:심사 대기 1:1차 합격 2:2차 합격 3:3차합격 4:불합격  
												const reqPreg = '${article.reqStep[0].reqPreg}';
												const resNo = '${article.resNo}';
												//
												if (reqPreg !== '1') {
													alert('면접 심사단계가 아닙니다!');
													return;
												} else
													(reqPreg == '1')

												$
														.ajax({
															type : 'post',
															url : '<c:url value="/resume/reqstepUpdate"/>',
															data : JSON
																	.stringify({
																		'resNo' : resNo,
																		'reqPreg' : '2',
																	}),
															contentType : 'application/json; charset=utf-8',
															dataType : 'text',

															success : function(
																	result) {
																if (result === 'UpdateSuccess') {
																	alert('정상 처리되었습니다.');
																	location
																			.reload(true);
																} else {
																	alert('면접합격 처리에 실패했습니다. 관리자에게 문의 해 주세요.');
																}
															},
															error : function() {
																alert('면접합격 처리에 실패했습니다. 관리자에게 문의 해 주세요.');
															}

														}); //ajax				
											}); // 2차 합격 

							//3차 합격 
							$('#3rdPass')
									.click(
											function() {

												// 5:심사 대기 1:1차 합격 2:2차 합격 3:3차합격 4:불합격  
												const reqPreg = '${article.reqStep[0].reqPreg}';
												const resNo = '${article.resNo}';
												//
												if (reqPreg !== '2') {
													alert('최종 심사단계가 아닙니다!');
													return;
												} else
													(reqPreg == '2')

												$
														.ajax({
															type : 'post',
															url : '<c:url value="/resume/reqstepUpdate"/>',
															data : JSON
																	.stringify({
																		'resNo' : resNo,
																		'reqPreg' : '3',
																	}),
															contentType : 'application/json; charset=utf-8',
															dataType : 'text',

															success : function(
																	result) {
																if (result === 'UpdateSuccess') {
																	alert('정상 처리되었습니다.');
																	location
																			.reload(true);
																} else {
																	alert('최종합격 처리에 실패했습니다. 관리자에게 문의 해 주세요.');
																}
															},
															error : function() {
																alert('최종합격 처리에 실패했습니다. 관리자에게 문의 해 주세요.');
															}

														}); //ajax				
											}); // 3차 합격

							//1차 합격 취소
							$('#1stFail')
									.click(
											function() {

												// 5:심사 대기 1:1차 합격 2:2차 합격 3:3차합격 4:불합격  
												const reqPreg = '${article.reqStep[0].reqPreg}';
												const resNo = '${article.resNo}';
												//
												if (reqPreg !== '1') {
													alert('서류 심사단계가 아닙니다!');
													return;
												} else
													(reqPreg == '1')

												if (confirm('정말 합격취소하시겠습니까?'))

												{
													$
															.ajax({
																type : 'post',
																url : '<c:url value="/resume/reqstepUpdate"/>',
																data : JSON
																		.stringify({
																			'resNo' : resNo,
																			'reqPreg' : '5',
																		}),
																contentType : 'application/json; charset=utf-8',
																dataType : 'text',

																success : function(
																		result) {
																	if (result === 'UpdateSuccess') {
																		alert('정상 처리되었습니다.');
																		location
																				.reload(true);
																	} else {
																		alert('서류합격취소 처리에 실패했습니다. 관리자에게 문의 해 주세요.');
																	}
																},
																error : function() {
																	alert('서류합격취소 처리에 실패했습니다. 관리자에게 문의 해 주세요.');
																}

															}); //ajax
												} // 합격 취소 confirm
												else {
													alert("취소하셨습니다.");
													return false;
												}
											}); // 1차 합격 취소	

							//2차 합격 취소
							$('#2ndFail')
									.click(
											function() {

												// 5:심사 대기 1:1차 합격 2:2차 합격 3:3차합격 4:불합격  
												const reqPreg = '${article.reqStep[0].reqPreg}';
												const resNo = '${article.resNo}';
												//
												if (reqPreg !== '2') {
													alert('면접 심사단계가 아닙니다!');
													return;
												} else
													(reqPreg == '2')

												if (confirm('정말 합격취소하시겠습니까?'))

												{
													$
															.ajax({
																type : 'post',
																url : '<c:url value="/resume/reqstepUpdate"/>',
																data : JSON
																		.stringify({
																			'resNo' : resNo,
																			'reqPreg' : '1',
																		}),
																contentType : 'application/json; charset=utf-8',
																dataType : 'text',

																success : function(
																		result) {
																	if (result === 'UpdateSuccess') {
																		alert('정상 처리되었습니다.');
																		location
																				.reload(true);
																	} else {
																		alert('면접합격취소 처리에 실패했습니다. 관리자에게 문의 해 주세요.');
																	}
																},
																error : function() {
																	alert('면접합격취소 처리에 실패했습니다. 관리자에게 문의 해 주세요.');
																}

															}); //ajax
												} // 합격 취소 confirm
												else {
													alert("취소하셨습니다.");
													return false;
												}
											}); // 2차 합격 취소		

							//3차 합격 취소
							$('#3rdFail')
									.click(
											function() {

												// 5:심사 대기 1:1차 합격 2:2차 합격 3:3차합격 4:불합격  
												const reqPreg = '${article.reqStep[0].reqPreg}';
												const resNo = '${article.resNo}';
												//
												if (reqPreg !== '3') {
													alert('최종 심사단계가 아닙니다!');
													return;
												} else
													(reqPreg == '3')

												if (confirm('정말 합격취소하시겠습니까?'))

												{
													$
															.ajax({
																type : 'post',
																url : '<c:url value="/resume/reqstepUpdate"/>',
																data : JSON
																		.stringify({
																			'resNo' : resNo,
																			'reqPreg' : '2',
																		}),
																contentType : 'application/json; charset=utf-8',
																dataType : 'text',

																success : function(
																		result) {
																	if (result === 'UpdateSuccess') {
																		alert('정상 처리되었습니다.');
																		location
																				.reload(true);
																	} else {
																		alert('최종합격취소 처리에 실패했습니다. 관리자에게 문의 해 주세요.');
																	}
																},
																error : function() {
																	alert('최종합격취소 처리에 실패했습니다. 관리자에게 문의 해 주세요.');
																}

															}); //ajax
												} // 합격 취소 confirm
												else {
													alert("취소하셨습니다.");
													return false;
												}
											}); // 3차 합격 취소	

							//불합격 
							$('#Fail')
									.click(
											function() {

												// 5:심사 대기 1:1차 합격 2:2차 합격 3:3차합격 4:불합격  
												const reqPreg = '${article.reqStep[0].reqPreg}';
												const resNo = '${article.resNo}';
												//

												if (confirm('정말 불합격하시겠습니까? \n불합격 시 재심사가 불가능합니다!'))

												{
													$
															.ajax({
																type : 'post',
																url : '<c:url value="/resume/reqstepUpdate"/>',
																data : JSON
																		.stringify({
																			'resNo' : resNo,
																			'reqPreg' : '4',
																		}),
																contentType : 'application/json; charset=utf-8',
																dataType : 'text',

																success : function(
																		result) {
																	if (result === 'UpdateSuccess') {
																		alert('정상 처리되었습니다.');
																		location
																				.reload(true);
																	} else {
																		alert('불합격 처리에 실패했습니다. 관리자에게 문의 해 주세요.');
																	}
																},
																error : function() {
																	alert('불합격 처리에 실패했습니다. 관리자에게 문의 해 주세요.');
																}

															}); //ajax
												} // 합격 취소 confirm
												else {
													alert("취소하셨습니다.");
													return false;
												}
											}); // 3차 합격 취소	

						});
	</script>