<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@include file="../include/header.jsp" %>



    <div class="rec_view_board_wrap">
    <form action="<c:url value='/recruitment/Delete'/>"
			name="detailForm" method="post">

        <div class="board_view_wrap board_wrap">
            <div class="board_view">
                <div class="info">
                    <dl>
                        <dt>제목</dt>
                        <dd><input name="boardTitle" readonly="readonly" value='<c:out value="${article.boardTitle}"/>' style="width: 300px" > </dd>
                    </dl>
                </div>
                <div class="info">
                    <dl>
                        <dt>번호</dt>
                        <dd> <input id="board_view_bNo_input" name="boardNo" readonly="readonly" value='<c:out value="${article.boardNo}"/>' > </dd>
                    </dl>
                	<dl>
                		<dt>작성자</dt>
                    		<dd><input name="userId" readonly="readonly" value='<c:out value="${article.userId}"/>' ></dd>
                	</dl>
                    <dl>
                        <dt>작성일</dt>
                       <dd> <input name="boardDate" readonly="readonly" value='<fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${article.boardDate}"/>' ></dd>
                    </dl>
                </div>
                <div class="cont">
                <dt>내용</dt>
                
                <dd><textarea rows="3" name="boardContent" readonly="readonly"><c:out value="${article.boardContent}"/></textarea></dd>
                </div>
                
            </div>
            
        
           <a href="#">
           <c:if test="${login.userId == article.userId}">
				<button type="button" class="btn btn-del" id="delBtn">삭제</button>
			</c:if>
			</a>
           <a href="#">
           		<c:if test="${login.userId == article.userId}">
				<button id="he" type="button" class="btn btn-modify" onclick="location.href='<c:url value="/recruitment/edit?boardNo=${article.boardNo}&userId=${article.userId}" />'">수정</button>
				</c:if>
			</a>
		   	<a href="#">
				<button type="button" class="btn btn-list" onclick="location.href='${pageContext.request.contextPath}/recruitment/list?pageNum=${p.pageNum}&cpp=${p.cpp}&condition=${p.condition}&keyword=${p.keyword}'">목록</button>
			</a>
			
			  <c:if test="${login.idntNo == 1}">
			 <a href="#">
				<button type="button" class="btn btn-modify" onclick="location.href='<c:url value="/resume/resumeList?recNo=${article.boardNo}" />'">지원하기</button>
			</a>																											<!-- ?userId=article.userId -->
			</c:if>	
        </div>
        </form>
    </div>
    
    


<%@include file="../include/footer.jsp" %>


<script>

$(document).ready(function() {

	const fileLoca = '${article.fileLoca}';
	const fileName = '${article.fileName}';
	console.log(fileName);
	const src = '<c:url value="/recruitment/display?fileLoca='
			+ fileLoca + '&fileName=' + fileName + '" />'
	console.log(src);
	$('#fileImg').attr('src', src);
	console.log($("#fileImg").val())
			
			
	const msg = '${msg}';
	if(msg !== '') {
		alert(msg);
	}


	

}); 

$('#delBtn').click(function() {
	if(confirm('정말 삭제하시겠습니까?')){					
		$('form[name=detailForm]').submit();
	}
	
});

</script>


