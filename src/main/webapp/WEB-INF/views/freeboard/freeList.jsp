<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../include/header.jsp"%>


<section class="main_container">
	<div class="ch3_title">
		<strong>자유게시판</strong>
		<p>자유롭게 소통하세요.</p>
	</div>
	
	<!-- 검색 -->
	<form action="<c:url value='/freeboard/freeList' />" class="navbar-form navbar-right search" role="search">
		<div class="search-wrap">
        	<button type="submit" class="btn btn-list search-btn">검색</button>
            <select class="form-control search-select" name="condition">
            	<option value="title" ${pc.paging.condition == 'title' ? 'selected' : ''}>제목</option>
                <option value="content" ${pc.paging.condition == 'content' ? 'selected' : ''}>내용</option>
                <option value="writer" ${pc.paging.condition == 'writer' ? 'selected' : ''}>작성자</option>
                <option value="titleContent" ${pc.paging.condition == 'titleContent' ? 'selected' : ''}>제목+내용</option>
            </select>
            <input type="text" name="keyword" class="form-control search-input" value="${pc.paging.keyword}">
        </div>
	</form>
</section>

<!-- 본문 -->
<div class="container">
	<table class="table table-bordered table-hover dt-responsive">
		<thead>
			<tr class="list_tr">
				<th class="free_th1">글번호</th>
				<th class="free_th2">제목</th>
				<th class="free_th1">작성자</th>
                <th class="free_th1">조회수</th>
				<th class="free_th3">작성일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="vo" items="${boardList}">
				<tr>
					<td align="center">${vo.boardNo}</td>
					<td><a href="<c:url value='/freeboard/freeDetail/${vo.boardNo}${pc.makeURI(pc.paging.pageNum)}' />">${vo.boardTitle}</a>
						&nbsp;
                        <c:if test="${vo.newMark}">
                        	<img alt="newMark" src="<c:url value='/img/newMark.gif'/>">
						</c:if>
					</td>
					<td align="center">${vo.userId}</td>
					<td align="center">${vo.boardHit}</td>
					<td align="center"><fmt:formatDate value="${vo.boardDate}" pattern="yyyy-MM-dd" /></td>
				</tr>
			</c:forEach>			
		</tbody>
	</table>
	
	<!-- 페이징 -->
	<form action="<c:url value='/freeboard/freeList' />" name="pageForm">
		<div class="board_page">			
			<ul id="pagination" class="pagination pagination-sm">
            	<c:if test="${pc.prev}">
                	<li><a href="#" data-pagenum="${pc.beginPage-1}" class="bt prev"><</a></li>
                </c:if>
                        
                <c:forEach var="num" begin="${pc.beginPage}" end="${pc.endPage}">
                	<li class="${pc.paging.pageNum == num ? 'active' : ''}" ><a href="#" class="num" data-pagenum="${num}">${num}</a></li>
                </c:forEach>
                        
                <c:if test="${pc.next}">
            	    <li><a href="#" class="bt next" data-pagenum="${pc.endPage+1}">></a></li>
                </c:if>
			</ul>
		</div>
		
		<!-- 등록버튼 -->
		<c:if test="${login != null}">
			<a href="<c:url value='/freeboard/freeRegist' />">
				<button type="button" class="btn btn-insert" onclick="location.href='<c:url value="/freeboard/freeRegist" />'">게시글 등록</button>
			</a>
		</c:if>
		
		<!-- 페이지 관련 버튼(이전, 다음, 페이지번호)을 클릭 시 같이 숨겨서 보내줄 공통 값  -->
        <input type="hidden" name="pageNum" value="${pc.paging.pageNum}">
        <input type="hidden" name="cpp" value="${pc.paging.cpp}">
        <input type="hidden" name="condition" value="${pc.paging.condition}">
        <input type="hidden" name="keyword" value="${pc.paging.keyword}">
	</form>	

</div>

<%@ include file="../include/footer.jsp"%>

<script>
	$(function() {
	 
		const msg = '${msg}';
		if(msg != ''){
		 alert(msg);
		}
		 
		$('#pagination').on('click', 'a', function(e) {
		   e.preventDefault(); //a태그의 고유기능 중지.
		   
		   const value = $(this).data('pagenum'); // -> jQuery
		   console.log(value);
		   
		   document.pageForm.pageNum.value = value;
		   document.pageForm.submit();		   
		});
	   
	   
	}); //end jQuery
   </script>















