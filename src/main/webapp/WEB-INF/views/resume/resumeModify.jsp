<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
   	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="../include/header.jsp"%>

<div class="container res_write_out_wrap">

   <div class="res_write_title">
      <p>이력서 수정</p>
      <hr>
   </div>

   <form action="<c:url value='/resume/resumeUpdate' />" method="post"
      enctype="multipart/form-data" name="updateForm"
      class="res_write_inner_wrap">
      <input type="text" name="resTitle" class="form-control"
         placeholder="이력서 제목" value="${article.resTitle}">
      <h3>인적사항</h3>
      <div class="res_write_con res_info clearfix">
         <div class="row input-group per_info">
            <div class="col-md-12 form-group picture fileDiv">
               <img id="fileImg" src="<c:url value='/img/img_ready.png' />">
            </div>
               <label for="file" class="form-label">프로필 사진 첨부</label>
                <input type="file" name="file" class="form-control-sm" id="file">

            <div class="col-md-2 form-group">
               <input type="text" name="resName" class="form-control"
                  id="user_name" placeholder="이름" value="${article.resName}">
            </div>
            <div class="col-md-3 form-group">
               <input type="date" name="resBirth" class="form-control"
                  id="user_birth" placeholder="생년월일" value="${article.resBirth}">
            </div>
            <div class="col-md-4 form-group">
               <input type="email" name="resEmail" class="form-control"
                  id="user_email" placeholder="you@email.com" value="${article.resEmail}">
            </div>

            <div class="form-group col-md-4 clearfix res_ph_wrap">

               <div class="input-group res_ph_input_wrap">
                  <select name="resPhone1" class="form-control res_phone" id="resPhone1" style="width:100px;" value="${article.resPhone1}">
                     <option>010</option>
                     <option>011</option>
                     <option>017</option>
                     <option>018</option>
                  </select>
                  
                  <div class="res_phone res_phone2">-</div>
                  
                   <input type="text" name="resPhone2" class="form-control res_phone"
                     id="resPhone2" placeholder="휴대폰 번호" style="width:200px;" value="${article.resPhone2}">
                  
                  <div class="res_phone res_phone2">-</div>
                  
                   <input type="text" name="resPhone3" class="form-control res_phone"
                     id="resPhone3" placeholder="휴대폰 번호" style="width:200px;" value="${article.resPhone3}">
               </div>
            </div>
            
            <div class="addr input-group col-md-8">
               <div class="form-group">
                  <input type="text" name="resAddrZipNum" id="resAddrZipNum" class="form-control" placeholder="우편번호" readonly>
                  <button type="button" class="btn btn-insert"
                     onclick="searchAddress()">주소찾기</button>
                  <input type="text" name="resAddrbasic" class="form-control"
                     id="resAddrBasic" placeholder="기본 주소" readonly value="${article.resAddrbasic}"> 
                  <input type="text" name="resAddrdetail" class="form-control"
                     id="resAddrDetail" placeholder="상세 주소" value="${article.resAddrdetail}">
               </div>
            </div>

         </div>
      </div>

      <h3>학력사항</h3>
		<div class="res_write_con">	
			<div class="row input-group" id="eduDiv">
			
				<div class="col-md-3 form-group">
					<input type="text" name="eduList[0].eduOrg" class="form-control" id="eduorg"
						placeholder="학교/기관 명" value="${article.resEdu[0].eduOrg}">
				</div>
				<div class="col-md-3 form-group">
					<input type="text" name="eduList[0].eduMjr" class="form-control" id="edumjr"
						placeholder="전공" value="${article.resEdu[0].eduMjr}">
				</div>
				<div class="col-md-2 form-group">
					<input type="date" name="eduList[0].eduAddt" class="form-control" id="eduaddt"
						required aria-required="true" data-placeholder="입학일 선택" value="<fmt:formatDate value="${article.resEdu[0].eduAddt}" pattern="yyyy-MM-dd"/>">
				</div>
				<div class="col-md-2 form-group">
					<input type="date" name="eduList[0].eduGrdt" class="form-control" id="edugrdt"
						required aria-required="true" data-placeholder="졸업일 선택" value="<fmt:formatDate value="${article.resEdu[0].eduGrdt}" pattern="yyyy-MM-dd"/>">
				</div>
				<div class="col-md-2 form-group">
					<select name="eduList[0].eduState" class="form-control" id="edustate" value="${article.resEdu[0].eduState}">
						
						<option>재학</option>
						<option>졸업</option>
						<option>졸업 예정</option>
					</select>
				</div>
				
				<div class="col-md-3 form-group">
					<input type="text" name="eduList[1].eduOrg" class="form-control" id="eduorg"
						placeholder="학교/기관 명" value="${article.resEdu[1].eduOrg}">
				</div>
				<div class="col-md-3 form-group">
					<input type="text" name="eduList[1].eduMjr" class="form-control" id="edumjr"
						placeholder="전공" value="${article.resEdu[1].eduMjr}">
				</div>
				<div class="col-md-2 form-group">
					<input type="date" name="eduList[1].eduAddt" class="form-control" id="eduaddt"
						required aria-required="true" data-placeholder="입학일 선택" value="<fmt:formatDate value="${article.resEdu[1].eduAddt}" pattern="yyyy-MM-dd"/>">
				</div>
				<div class="col-md-2 form-group">
					<input type="date" name="eduList[1].eduGrdt" class="form-control" id="edugrdt"
						required aria-required="true" data-placeholder="졸업일 선택" value="<fmt:formatDate value="${article.resEdu[1].eduGrdt}" pattern="yyyy-MM-dd"/>">
				</div>
				<div class="col-md-2 form-group">
					<select name="eduList[1].eduState" class="form-control" id="edustate" value="${article.resEdu[1].eduState}">
						
						<option>재학</option>
						<option>졸업</option>
						<option>졸업 예정</option>
					</select>
				</div>
				
				<div class="col-md-3 form-group">
					<input type="text" name="eduList[2].eduOrg" class="form-control" id="eduorg"
						placeholder="학교/기관 명" value="${article.resEdu[2].eduOrg}">
				</div>
				<div class="col-md-3 form-group">
					<input type="text" name="eduList[2].eduMjr" class="form-control" id="edumjr"
						placeholder="전공" value="${article.resEdu[2].eduMjr}">
				</div>
				<div class="col-md-2 form-group">
					<input type="date" name="eduList[2].eduAddt" class="form-control" id="eduaddt"
						required aria-required="true" data-placeholder="입학일 선택" value="<fmt:formatDate value="${article.resEdu[2].eduAddt}" pattern="yyyy-MM-dd"/>">
				</div>
				<div class="col-md-2 form-group">
					<input type="date" name="eduList[2].eduGrdt" class="form-control" id="edugrdt"
						required aria-required="true" data-placeholder="졸업일 선택" value="<fmt:formatDate value="${article.resEdu[2].eduGrdt}" pattern="yyyy-MM-dd"/>">
				</div>
				<div class="col-md-2 form-group">
					<select name="eduList[2].eduState" class="form-control" id="edustate" value="${article.resEdu[2].eduState}">
						
						<option>재학</option>
						<option>졸업</option>
						<option>졸업 예정</option>
					</select>
				</div>
				
				
			</div>
			
		</div>


		<h3>경력사항</h3>
		<div class="res_write_con">
			<div class="row input-group" id="crrDiv">
				<div class="col-md-2 form-group">
					<input type="text" name="crrList[0].crrCom" class="form-control" id="crrcom"
						placeholder="회사명" value="${article.resCrr[0].crrCom}">
				</div>
				<div class="col-md-4 form-group">
					<input type="text" name="crrList[0].crrDept" class="form-control" id="crrdept"
						placeholder="부서명(담당업무)" value="${article.resCrr[0].crrDept}">
				</div>
				<div class="col-md-2 form-group">
					<input type="date" name="crrList[0].crrAddt" class="form-control" id="crraddt"
						required aria-required="true" data-placeholder="입사일 선택" value="<fmt:formatDate value="${article.resCrr[0].crrAddt}" pattern="yyyy-MM-dd"/>">
				</div>
				<div class="col-md-2 form-group">
					<input type="date" name="crrList[0].crrGrdt" class="form-control" id="crrgrdt"
						required aria-required="true" data-placeholder="퇴사일 선택" value="<fmt:formatDate value="${article.resCrr[0].crrGrdt}" pattern="yyyy-MM-dd"/>">
				</div>
				<div class="col-md-2 form-group">
					<input type="text" name="crrList[0].crrPos" class="form-control" id="crrpos"
						placeholder="직위" value="${article.resCrr[0].crrPos}">
				</div>
			</div>
						<div class="row input-group" id="crrDiv">
				<div class="col-md-2 form-group">
					<input type="text" name="crrList[1].crrCom" class="form-control" id="crrcom"
						placeholder="회사명" value="${article.resCrr[1].crrCom}">
				</div>
				<div class="col-md-4 form-group">
					<input type="text" name="crrList[1].crrDept" class="form-control" id="crrdept"
						placeholder="부서명(담당업무)" value="${article.resCrr[1].crrDept}">
				</div>
				<div class="col-md-2 form-group">
					<input type="date" name="crrList[1].crrAddt" class="form-control" id="crraddt"
						required aria-required="true" data-placeholder="입사일 선택" value="<fmt:formatDate value="${article.resCrr[1].crrAddt}" pattern="yyyy-MM-dd"/>">
				</div>
				<div class="col-md-2 form-group">
					<input type="date" name="crrList[1].crrGrdt" class="form-control" id="crrgrdt"
						required aria-required="true" data-placeholder="퇴사일 선택" value="<fmt:formatDate value="${article.resCrr[1].crrGrdt}" pattern="yyyy-MM-dd"/>">
				</div>
				<div class="col-md-2 form-group">
					<input type="text" name="crrList[1].crrPos" class="form-control" id="crrpos"
						placeholder="직위" value="${article.resCrr[1].crrPos}">
				</div>
			</div>
			
									<div class="row input-group" id="crrDiv">
				<div class="col-md-2 form-group">
					<input type="text" name="crrList[2].crrCom" class="form-control" id="crrcom"
						placeholder="회사명" value="${article.resCrr[2].crrCom}">
				</div>
				<div class="col-md-4 form-group">
					<input type="text" name="crrList[2].crrDept" class="form-control" id="crrdept"
						placeholder="부서명(담당업무)" value="${article.resCrr[2].crrDept}">
				</div>
				<div class="col-md-2 form-group">
					<input type="date" name="crrList[2].crrAddt" class="form-control" id="crraddt"
						required aria-required="true" data-placeholder="입사일 선택" value="<fmt:formatDate value="${article.resCrr[2].crrAddt}" pattern="yyyy-MM-dd"/>">
				</div>
				<div class="col-md-2 form-group">
					<input type="date" name="crrList[2].crrGrdt" class="form-control" id="crrgrdt"
						required aria-required="true" data-placeholder="퇴사일 선택" value="<fmt:formatDate value="${article.resCrr[2].crrGrdt}" pattern="yyyy-MM-dd"/>">
				</div>
				<div class="col-md-2 form-group">
					<input type="text" name="crrList[2].crrPos" class="form-control" id="crrpos"
						placeholder="직위" value="${article.resCrr[2].crrPos}">
				</div>
			</div>
		
		</div>


		<h3>자격증</h3>
		<div class="res_write_con" id="certWrap">
			<div class="row input-group" id="certDiv">
				<div class="col-md-4 form-group">
					<input type="text" name="certList[0].certName" class="form-control"
						id="certname" placeholder="자격증명" value="${article.resCert[0].certName}">
				</div>
				<div class="col-md-4 form-group">
					<input type="text" name="certList[0].certOrg" class="form-control" id="certorg"
						placeholder="발행기관" value="${article.resCert[0].certOrg}">
				</div>
				<div class="col-md-3 form-group">
					<input type="date" name="certList[0].certDate" class="form-control"
						id="certdate" required aria-required="true" data-placeholder="취득일 선택" value="<fmt:formatDate value="${article.resCert[0].certDate}" pattern="yyyy-MM-dd"/>">
				</div>
				
			</div>
						<div class="row input-group" id="certDiv">
				<div class="col-md-4 form-group">
					<input type="text" name="certList[1].certName" class="form-control"
						id="certname" placeholder="자격증명" value="${article.resCert[1].certName}">
				</div>
				<div class="col-md-4 form-group">
					<input type="text" name="certList[1].certOrg" class="form-control" id="certorg"
						placeholder="발행기관" value="${article.resCert[1].certOrg}">
				</div>
				<div class="col-md-3 form-group">
					<input type="date" name="certList[1].certDate" class="form-control"
						id="certdate" required aria-required="true" data-placeholder="취득일 선택" value="<fmt:formatDate value="${article.resCert[1].certDate}" pattern="yyyy-MM-dd"/>"">
				</div>
				
			</div>
						<div class="row input-group" id="certDiv">
				<div class="col-md-4 form-group">
					<input type="text" name="certList[2].certName" class="form-control"
						id="certname" placeholder="자격증명" value="${article.resCert[2].certName}">
				</div>
				<div class="col-md-4 form-group">
					<input type="text" name="certList[2].certOrg" class="form-control" id="certorg"
						placeholder="발행기관" value="${article.resCert[2].certOrg}">
				</div>
				<div class="col-md-3 form-group">
					<input type="date" name="certList[2].certDate" class="form-control"
						id="certdate" required aria-required="true" data-placeholder="취득일 선택" value="<fmt:formatDate value="${article.resCert[2].certDate}" pattern="yyyy-MM-dd"/>"">
				</div>
				
			</div>
         
      </div>
      <hr>
      <div class="col-md-3 form-group res_write_btn_wrap">
      
      <input type="hidden" name="userId" value="${login.userId}">
      <input type="hidden" name="resNo" value="${article.resNo}">
      <input type="hidden" name="eduList[0].eduNo" value="${article.resEdu[0].eduNo}">
      <input type="hidden" name="eduList[1].eduNo" value="${article.resEdu[1].eduNo}">
      <input type="hidden" name="eduList[2].eduNo" value="${article.resEdu[2].eduNo}">
      <input type="hidden" name="crrList[0].crrNo" value="${article.resCrr[0].crrNo}">
      <input type="hidden" name="crrList[1].crrNo" value="${article.resCrr[1].crrNo}">
      <input type="hidden" name="crrList[2].crrNo" value="${article.resCrr[2].crrNo}">
      <input type="hidden" name="certList[0].certNo" value="${article.resCert[0].certNo}">
      <input type="hidden" name="certList[1].certNo" value="${article.resCert[1].certNo}">
      <input type="hidden" name="certList[2].certNo" value="${article.resCert[2].certNo}">


         <button class="btn btn-insert res_insert_btn" id="updateBtn">
            <span>이력서 수정</span>
         </button>
         <button class="btn btn-cancel res_cancel_btn" id="listBtn">
            <span>취소</span>
         </button>

      </div>
   </form>

</div>


<%@ include file="../include/footer.jsp"%>

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<script>
	$(function() {

		   
		  const fileLoca = '${article.resFile[0].fileLoca}';
		  const fileName = '${article.resFile[0].fileName}';
		  const src = '<c:url value="/resume/display?fileLoca=' + fileLoca + '&fileName=' + fileName + '" />'
		       		       
		  console.log(src);
		  $('#fileImg').attr('src', src);
		       
		   
		//수정 버튼 클릭 시
		$('#updateBtn').click(function() {
			if ($('input[name=resTitle]').val() === '') {
				alert('제목은 필수 항목입니다.');
				$('input[name=resTitle]').focus();
				return;
			} else if ($('input[name=resName]').val() === '') {
				alert('이름은 필수 항목입니다.');
				$('input[name=resName]').focus();
				return;
			} else {
				document.updateForm.submit();
			}

		});

		$('#listBtn').click(function() {
			if (confirm('목록으로 돌아가시겠습니까?')) {
				location.href = '<c:url value="/resume/resumeList" />'
			} else
				return;
		});
		
    	
    	$('#delBtn').click(function() {
			if(confirm('정말 삭제하시겠습니까?')) {
				$('form[name=updateForm]').attr('action', '<c:url value="/resume/resumeDelete" />');
				$('form[name=updateForm]').submit();
			}
		});



	});
	
	function readURL(input) {
    	if (input.files && input.files[0]) {
    		
        	var reader = new FileReader(); 
        	reader.readAsDataURL(input.files[0]);                  	
        	reader.onload = function(event) { 
            	$('#fileImg').attr("src", event.target.result); 
            	console.log(event.target)
        	}
    	}
    }
	$("#file").change(function() {
        readURL(this); 
        
    });

	function searchAddress() {
		new daum.Postcode({
			oncomplete : function(data) {

				var addr = ''; 수
				var extraAddr = ''; 


				if (data.userSelectedType === 'R') { 
					addr = data.roadAddress;
				} else { 
					addr = data.roadAddress;
				}


				document.getElementById("resAddrBasic").value = addr;

				document.getElementById("resAddrDetail").focus();
			}
		}).open();
	}
	

	
</script>


