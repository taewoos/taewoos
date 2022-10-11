<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<link href="${pageContext.request.contextPath }/resources/css/message.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/join.css" rel="stylesheet">

<body>
	<section>
        <div class="join">
            <div class="row">
                <div class="col-lg-4 col-md-6 col-sm-7 join-form">
                    <div class="titlebox">
                       	 쪽지쓰기
                    </div>
                    
                    <div id ="contents1" class="content on">
                        <form action="<c:url value='/message/msgSendForm' />" method="post" name="msgSendForm">


                          
                           
                        <div>
                            <label>보내는 사람: </label>
                            <input type="text" name="userId" id="userId" class="form-control" value="${login.userId}" readonly>
                        </div>
                        <div>
                            <label>받는 사람: </label>
                            <input type="text" name="receiver" id="receiver" class="form-control" >
                        </div>
                        <br>

                        <div>
                            
                        </div>
                    
                        
                        <div class="form-group">
                            <input type="text" class="form-control" name="msgTitle" placeholder="제목">
                        </div>
                        <br>
                        <div class="form-group">
                            <textarea class="form-control" rows="8" name="msgContent" placeholder="내용"></textarea>
                        </div>


                        <br>

                        <!--회원 가입 버튼 -->
                       <div class="form-group">
                            <button type="button" class="btn btn-lg btn-info btn-block" id="msgSendBtn">보내기</button>
                        </div>
                       
                    </form>

                </div>

                </div>
            </div>            
        </div>
    </section>
 
 
 <script>
	$('#msgSendBtn').click(function() {

		 if($('input[name=msgTitle]').val() === '') {
			alert('제목을 입력해주세요.');
			$('input[name=msgTitle]').focus();
		} else if($('input[name=msgcontent]').val() === '') {
			alert('내용을 입력해주세요.');
			$('input[name=msgContent]').focus();
		}		 		 
		 else {
			 document.msgSendForm.submit();

		}
	}); 
</script>      

    
<%@ include file="../include/footer.jsp"%>   


 </body>

 
</html>

