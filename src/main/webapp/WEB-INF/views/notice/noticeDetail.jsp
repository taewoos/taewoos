<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp"%>

<div class="board_wrap">
	<div class="go_title">
		<strong>공지사항 상세보기</strong>
		<p>공지사항을 빠르고 정확하게 안내해드립니다.</p>
	</div>

	<div class="board_view_wrap">
			<form action="<c:url value='/notice/noticeDelete'/>" name="detailForm" method="post">
				<div class="board_view">
					<div class="title">${article.noticeTitle}</div>
					<div class="info">
						<dl>
							<dt>글번호</dt>
							<dd><input class="form-control" id="board_view_bNo_input" name='noticeNo' value="${article.noticeNo}"></dd>
						</dl>
						<dl>
							<dt>작성자</dt>
							<dd>
								<input class="form-control" name='userId' value="${article.userId}" readonly>
							</dd>
						</dl>
						<dl>
							<dt>작성일</dt>
							<dd><fmt:formatDate value="${article.noticeDate}" pattern="yyyy-MM-dd HH:mm" /></dd>
						</dl>
						<dl>
							<dt>조회수</dt>
							<dd>${article.noticeHit}</dd>
						</dl>
					</div>
					<div class="cont">
						<textarea class="form-control" rows="10" name='##' readonly>${article.noticeContent}</textarea>
					</div>
				</div>
				
				
				<a href="#">
					<button type="button" class="btn btn-list" onclick="location.href='${pageContext.request.contextPath}/notice/noticeList?pageNum=${p.pageNum}&cpp=${p.cpp}&condition=${p.condition}&keyword=${p.keyword}'">목록</button>
				</a>
				<c:if test="${login.idntNo == 3}">
					<a href="#">
						<button type="button" class="btn btn-del" id="delBtn">삭제</button>
					</a>
					<a href="#">
						<button type="button" class="btn btn-modify" onclick="location.href='<c:url value="/notice/noticeModify?noticeNo=${article.noticeNo}&writer=${article.userId}" />'">수정</button>
					</a>
				</c:if>
			</form>
	</div>
	
</div>


<%@ include file="../include/footer.jsp"%>

<script>
		const msg = '${msg}';
		if(msg !== '') {
			alert(msg);
		}
		
		$(document).ready(function() {
			
			$('#delBtn').click(function() {
				if(confirm('정말 삭제하시겠습니까?')){					
					$('form[name=detailForm]').submit();
				}
			});
			
		}); // end jQuery
		
		
		
		
		
	</script>























