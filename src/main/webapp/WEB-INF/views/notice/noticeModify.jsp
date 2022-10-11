<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../include/header.jsp"%>
<div class="board_wrap">
	<div class="go_title">
		<strong>공지사항 수정하기</strong>
		<p>공지사항을 빠르고 정확하게 안내해드립니다.</p>
	</div>
	
	<form action="<c:url value='/notice/noticeUpdate'/>" method="post" name="updateForm">
		<div class="board_write_wrap">
			<div class="board_write board_modify">
				<div class="form-group">
					<div class="info">
						<dl>
							<dt class="modi_dt">글번호</dt>
							<dd>
								<input class="form-control" name='noticeNo' value="${article.noticeNo}" readonly>
							</dd>
						</dl>
						
						<dl>
							<dt class="modi_dt">작성자</dt>
							<dd>
								<input class="form-control input-sm" name="userId" value="${article.userId}" readonly>
							</dd>
						</dl>					
					</div>
				</div>
				<div class="form-group">
					<div class="title">
						<dl>
							<dt class="modi_dt">제목</dt>
							<dd>
								<input class="form-control input-sm" name="noticeTitle" value="${article.noticeTitle}">
							</dd>
						</dl>
					</div>
				</div>
				<div class="form-group">
					<div class="cont">
						<textarea class="form-control" rows="10" name="noticeContent">${article.noticeContent}</textarea>
					</div>
				</div>
			</div>
			
			<a href="#">
				<button type="button" class="btn btn-del" id="listBtn">취소</button>
			</a>
			<a href="#">
				<button type="button" class="btn btn-modify" id="updateBtn">등록</button>
			</a>
		</div>
	</form>
</div>
<%@ include file="../include/footer.jsp"%>
<script>
     
        $(function() {
        	
        	//목록 이동 처리
        	$('#listBtn').click(function() {
				if(confirm('목록으로 돌아가시겠습니까?')){
					location.href='<c:url value="/notice/noticeList"/>'
				} else return;
			});
        	
        	 //수정 버튼 이벤트 처리
	        /*
	        1. 폼 데이터가 공백인지 확인 처리
	        2. 공백이 없으면 Controller에 freeUpdate 요청으로 데이터를 전송
	        3. 컨트롤러에서 처리가 완료된 후에 "게시글 수정이 정상 처리되었습니다."라는 알림창이
	        글 상세보기 페이지에서 처리될 수 있도록 해 주세요.
	        */
			 
			$('#updateBtn').click(function() {
				if($('input[name=noticeTitle]').val() === ''){
					alert('제목은 필수입니다.');
					$('input[name=noticeTitle]').focus();
					return;
				} else if($('textarea[name=noticeContent]').val() === ''){
					alert('내용은 필수입니다.');
					$('textarea[name=noticeContent]').focus();
					return;
				} else {
					document.updateForm.submit();
				}
			});	
        	 
			
			
		}); //end JQuery
        
        
        
       
        
        </script>
