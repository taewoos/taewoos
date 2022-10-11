<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../include/header.jsp"%>
<div class="board_wrap">
	<div class="go_title">
		<strong>통계 수정하기</strong>
	</div>
	
	<form action="<c:url value='/statistics/statisticsUpdate'/>" method="post" name="updateForm">
		<div class="board_write_wrap">
			<div class="board_write board_modify">
				<div class="form-group">
					<div class="info">
						<dl>
							<dt class="modi_dt">통계번호</dt>
							<dd>
								<input class="form-control" name='statisticsNo' value="${article.statisticsNo}" readonly>
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
								<input class="form-control input-sm" name="statisticsTitle" value="${article.statisticsTitle}">
							</dd>
						</dl>
					</div>
				</div>
				<div class="form-group">
					<div class="cont">
						<textarea class="form-control" rows="10" name="statisticsContent">${article.statisticsContent}</textarea>
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
					location.href='<c:url value="/statistics/statisticsList"/>'
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
				if($('input[name=statisticsTitle]').val() === ''){
					alert('제목은 필수입니다.');
					$('input[name=statisticsTitle]').focus();
					return;
				} else if($('textarea[name=statisticsContent]').val() === ''){
					alert('내용은 필수입니다.');
					$('textarea[name=statisticsContent]').focus();
					return;
				} else {
					document.updateForm.submit();
				}
			});	
        	 
			
			
		}); //end JQuery
        
        
        
       
        
        </script>
