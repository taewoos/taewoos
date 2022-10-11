<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 

   

<%@include file="../include/header.jsp" %>


    <!-- ================ main ================ -->

    <section class="main_container">
        <div class="ch3_title">
            <strong>MyPage_공고 관리</strong>
        </div>
          <form class="navbar-form navbar-right" role="search">
            <div class="form-group">
                <input type="text" class="form-control" placeholder="Search" name="keyword" value="${pageMaker.cri.keyword }" >
            </div>
            <button type="submit" class="btn btn-default">검색</button>
        </form>
    </section>
    <div class="container">
        <table class="table table-bordered table-hover dt-responsive">
            <thead>
                <tr>
                    <th>번호</th>
                    <th style="width: 900px">제목</th>
                    <th>등록일</th>

                </tr>
            </thead>
            
        <c:forEach items="${userInfo.userBoardList}" var="vo">
            <tr>
                <td><c:out value="${vo.boardNo}"/></td>
                <td>
                    <a class="move" href='/recruitment/view/<c:out value="${vo.boardNo}"/>'>
                        <c:out value="${vo.boardTitle}"/>
                    </a>
                </td>
                <td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${vo.boardDate}"/></td>
            </tr>
        </c:forEach>
            <tfoot>
                <tr>
                    <td colspan="5" class="text-center">Data Applicant Management.</td>
                </tr>
            </tfoot>
        </table>
        
		<form>
        	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
        	<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
		</form>
		
        <div class="board_page">
        	<div class="pageInfo_area pageInfo" id="pageInfo">
        	
        		<c:if test="${pageMaker.prev}">
                    <a href="?pageNum=${pageMaker.startPage-1}" class="bt prev">이전</a>
                </c:if>
        	
        		
            	
           	    	<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
       		        	<a href="?pageNum=${num}" class="num on">${num}</a>
      	            </c:forEach>     
      	                 	
      	                 	
      	        <c:if test="${pageMaker.next}">       	
              	  <a href="?pageNum=${pageMaker.endPage + 1}" class="bt next">다음</a>
                </c:if>
        	</div>
        </div>
 		



        <a href="/recruitment/writer">
            <button type="button" class="btn btn-insert">공고 등록</button>
        </a>
    
    </div>


<%@include file="../include/footer.jsp" %>

<script>
  $(".pageInfo a").on("click", function(e){
 
 
    });
 </script>



  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript" src="/js/bootstrap.js"></script>
    <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>


</body>
</html>