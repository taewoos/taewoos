<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../include/header.jsp"%>
<div class="board_wrap">
	<div class="go_title">
		<strong>자유게시판 글쓰기</strong>
		<p>자유롭게 소통하세요.</p>
	</div>

	<form action="<c:url value='/freeboard/registForm'/>" name="registForm"
		method="post">
		<div class="board_write_wrap">
			<div class="board_write">
				<div class="title">
					<dl>
						<dt>제목</dt>
						<dd>
							<input class="form-control input-sm" name="boardTitle">
						</dd>
					</dl>
				</div>
				<div class="info">
					<dl>
						<dt>작성자</dt>
						<dd>
							<input class="form-control input-sm" name="userId" value="${login.userId}" readonly>
						</dd>
					</dl>
				</div>
				<div class="cont">
					<textarea class="form-control" rows="10" name="boardContent"></textarea>
				</div>
			</div>
		</div>
	</form>

	<button type="button" class="btn btn-del" id="listBtn">취소</button>
	<button type="button" class="btn btn-modify" id="registBtn">등록</button>
</div>

<%@ include file="../include/footer.jsp"%>

<script>
	$(function() {
		$('#registBtn').click(function() {
			if($('input[name=boardTitle]').val() === ''){
				alert('제목은 필수 항목입니다.');
				$('input[name=boardTitle]').focus();
				return;
			} else if($('textarea[name=boardContent]').val() === ''){
				alert('내용은 필수 항목입니다.');
				$('textarea[name=boardContent]').focus();
				return;
			} else{
				document.registForm.submit();
			}
		});
		
		$('#listBtn').click(function() {
			if(confirm('목록으로 돌아가시겠습니까?')){
				location.href='<c:url value="/freeboard/freeList"/>'
			} else return;
		});
	});	

</script>
