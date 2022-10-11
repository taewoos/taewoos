<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메인</title>
    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href="../css/ch.css">
    <!--Font Awesome 아이콘-->
    <script src="https://kit.fontawesome.com/8813e159ee.js" crossorigin="anonymous"></script>
    <script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>
<%@include file="../include/header.jsp" %>



    


    <div class="board_wrap">
    <form action="<c:url value='/recruitment/Update'/>" method="post" name="updateForm">
        <div class="board_view_wrap">
            <div class="board_view">
                    <dl>
                        <dt>제목</dt>
                        <dd><input name="boardTitle"  value='<c:out value="${article.boardTitle}"/>' > </dd>
                    </dl>
                <div class="info">
                    <dl>
                        <dt>번호</dt>
                        <dd> <input name="boardNo" readonly="readonly" value='<c:out value="${article.boardNo}"/>' > </dd>
                    </dl>
	                <div class="title">
	                    <input name="useId" readonly="readonly" value='<c:out value="${article.userId}"/>' >
	                </div>
                    <dl>
                        <dt>작성일</dt>
                       <dd> <input name="boardDate" readonly="readonly" value='<fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${article.boardDate}"/>' ></dd>
                    </dl>
                </div>
                <div class="cont">
                <dt>내용</dt>
                <dd>
                
                <textarea rows="3" name="boardContent"><c:out value="${article.boardContent}"/></textarea>
                </dd>
                <dd><img id="fileImg" src="<c:url value='/img/img_ready.png' />"></dd>
                	                            	<dt class="t-title">공고 첨부</dt>
	                            	<dd><input type="file" name="file" class="form-control-sm" id="file"></dd>
                </div>
                
                
             		<a href="#">
				<button type="button" class="btn btn-del" id="listBtn">취소</button>
			</a>
			<a href="#">
				<button type="button" class="btn btn-modify" id="updateBtn">등록</button>
			</a>
				
        	        
            </div>     
        </div>
        </form>
    </div>
  		   

<script>
$(function() {
	
	
	const fileLoca = '${article.fileLoca}';
	const fileName = '${article.fileName}';
	const src = '<c:url value="/recruitment/display?fileLoca='
			+ fileLoca + '&fileName=' + fileName + '" />'
	console.log(src);
	$('#fileImg').attr('src', src);
	
	
	
	
	
	
	//목록 이동 처리
	$('#listBtn').click(function() {
		if(confirm('목록으로 돌아가시겠습니까?')){
			location.href='<c:url value="/recruitment/list"/>'
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
		if($('input[name=boardTitle]').val() === ''){
			alert('제목은 필수입니다.');
			$('input[name=boardTitle]').focus();
			return;
		} else if($('textarea[name=boardContent]').val() === ''){
			alert('내용은 필수입니다.');
			$('textarea[name=boardContent]').focus();
			return;
		} else {
			document.updateForm.submit();
		}
	});	
	 
	
	
	
}); //end JQuery


</script>


<%@include file="../include/footer.jsp" %>

 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 <script type="text/javascript" src="/js/bootstrap.js"></script>
</body>
</html>