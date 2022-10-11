<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@include file="../include/header.jsp" %>
<head>
<link rel="stylesheet" href="../css/ch.css">
  
</head>
<div class="res_list_wrap">

     <div class="container" id="a">
        <div class="container2">
            <div class="chek">
                <h3>채용전형</h3>
                <label class="checkbox-inline">
                    <input type="checkbox" id="inlineCheckbox1" value="option1"> 정규직
                </label>
                <label class="checkbox-inline">
                    <input type="checkbox" id="inlineCheckbox2" value="option2"> 무기계약직
                </label>
                <label class="checkbox-inline">
                    <input type="checkbox" id="inlineCheckbox3" value="option3"> 경력직채용
                </label>
                <label class="checkbox-inline">
                    <input type="checkbox" id="inlineCheckbox3" value="option3"> 신입채용
                </label>
            </div>
        </div>

  	<!-- 검색 -->
	<form action="<c:url value='/recruitment/list' />" class="navbar-form navbar-right search" role="search">
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
    </div>
    
<!---->
    <!--카드 --> 
    <div class="container">
        <div class="list" id="js-load">
			<c:forEach items="${boardList}" var="vo">
          	  <article class="list--item">
          	  
                <a class="move" href='/recruitment/view/<c:url value="${vo.boardNo}"/>'>                  
                        <img src="/recruitment/display?fileLoca=${vo.fileLoca}&fileName=${vo.fileName}" alt="..." >   
                        <figure align="center">                 
                        <c:out value="${vo.boardTitle}"/>    
                        </figure>          
                </a>
          	 </article>
              </c:forEach>            
        </div>
    </div>


</from>

	<!-- 페이징 -->
	<form action="<c:url value='/recruitment/list' />" name="pageForm">
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
		

		
		<!-- 페이지 관련 버튼(이전, 다음, 페이지번호)을 클릭 시 같이 숨겨서 보내줄 공통 값  -->
        <input type="hidden" name="pageNum" value="${pc.paging.pageNum}">
        <input type="hidden" name="cpp" value="${pc.paging.cpp}">
        <input type="hidden" name="condition" value="${pc.paging.condition}">
        <input type="hidden" name="keyword" value="${pc.paging.keyword}">
	</form>	
    
    <c:if test="${login.idntNo == 2}">
    <a href="/recruitment/writer">
        <button type="button" class="btn btn-insert">공고 등록</button>
    </a>
    </c:if>
		

</div>

<%@include file="../include/footer.jsp" %>





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
   
   
});  


</script>


