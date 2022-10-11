<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../include/header.jsp"%>
<div class="board_wrap">
	<div class="go_title">
		<strong>공지사항 글쓰기</strong>
		<p>공지사항을 빠르고 정확하게 안내해드립니다.</p>
	</div>

	<form action="<c:url value='/notice/registForm'/>" name="registForm"
		method="post">
		<div class="board_write_wrap">
			<div class="board_write">
				<div class="title">
					<dl>
						<dt>제목</dt>
						<dd>
							<input class="form-control input-sm" name="noticeTitle">
						</dd>
					</dl>
				</div>
				<div class="info">
					<dl>
						<dt>작성자</dt>
						<dd>
							<input class="form-control input-sm" name="userId">
						</dd>
					</dl>
				</div>
				<div class="cont">
					<textarea class="form-control" rows="10" name="noticeContent"></textarea>
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
			if($('input[name=noticeTitle]').val() === ''){
				alert('제목은 필수 항목입니다.');
				$('input[name=noticeTitle]').focus();
				return;
			} else if($('textarea[name=noticeContent]').val() === ''){
				alert('내용은 필수 항목입니다.');
				$('textarea[name=noticeContent]').focus();
				return;
			} else{
				document.registForm.submit();
			}
		});
		
		$('#listBtn').click(function() {
			if(confirm('목록으로 돌아가시겠습니까?')){
				location.href='<c:url value="/notice/noticeList"/>'
			} else return;
		});
	});	

</script>
