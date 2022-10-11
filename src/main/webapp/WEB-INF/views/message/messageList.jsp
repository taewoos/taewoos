<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<link href="${pageContext.request.contextPath }/resources/css/message.css" rel="stylesheet">

<body>

	<section style="margin-top:200px">		
		<div class="modal-dialog modal-dialog-centered">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
	                            aria-hidden="true">&times;</span></button>
	                    <h4 class="modal-title">쪽지 목록</h4>
	                </div>
	                <div class="modal-body">
	                    <div class="tab">
	                        <div class="choice">
	                            <a id="receive" class="panel active" onclick="active(0)">받은 쪽지</a>
	                            <a id="send" class="panel" onclick="active(1)">보낸 쪽지</a>
	                        </div>
	                    </div>
	                    <table id="content1" class="table table-hover content on">
	                        <thead>
	                            <tr>
	                                <th>제목</th>
	                                <th>내용</th>
	                                <th>보낸사람</th>
	                                <th>받는사람</th>
	                                <th>날짜</th>
	                            </tr>
	                        </thead>
	                        <tbody>
	                          <c:forEach var="vo" items="${messageList}">
	                            <tr>
	                                <td>${vo.msgTitle}</td>
	                                <td>
	                                	<a href="">${vo.msgContent}</a>
	                                &nbsp;&nbsp;&nbsp;
	                       
	                                </td>
	                                <td>${vo.userId}</td>
	                                <td>${vo.receiver}</td>
	                                <td><fmt:formatDate value="${vo.regDate}" pattern="yyyy-MM-dd HH:mm" /></td>
	                            </tr>
                            </c:forEach>
	
	                        </tbody>
	                    </table>
	                    <table id="content2" class="table table-hover content">
	                        <thead>
	                            <tr>
	                                <th>제목</th>
	                                <th>내용</th>
	                                <th>보낸사람</th>
	                                <th>날짜</th>
	                            </tr>
	                        </thead>
	                        <tbody>
	                            <tr>
	                                <td>보아라</td>
	                                <td>너는 잘 할 수 있단다 대충 긍정적 문구 어쩌구</td>
	                                <td>김미래</td>
	                                <td>2022-07-24</td>
	                            </tr>
	                            <tr>
	                                <td>또 보아라</td>
	                                <td>낼 학원 가기 귀찮다. 하지만 어쩌겠어 가야하는걸</td>
	                                <td>김미래</td>
	                                <td>2022-07-24</td>
	                            </tr>
	
	                        </tbody>
	                    </table>
	                </div>
	                <div class="modal-footer">
	                    <div class="paging">
	                        <a href="#" class="bt first"><<</a>
	                        <a href="#" class="bt prev"><</a>
	                        <a href="#" class="num">1</a>
	                        <a href="#" class="num">2</a>
	                        <a href="#" class="num">3</a>
	                        <a href="#" class="num">4</a>
	                        <a href="#" class="num">5</a>
	                        <a href="#" class="bt next">></a>
	                        <a href="#" class="bt last">>></a>
	                    </div>
						<a data-toggle="modal" href="<c:url value='/message/messageSender' />" class="btn btn-insert">쪽지 보내기</a>
	
	                    
	                </div>
	            </div><!-- /.modal-content -->
	
	        
	        </div><!-- /.modal-dialog -->

    </section>
    
	 <script>
     	   
       	const msg = '${msg}';
    	if(msg !== '') {
	    	alert(msg);    		
    	}

       function active(num){

            $('.choice a').removeClass('active');
            $('.content').removeClass('on');
            if(num==0){
                $('#receive').addClass('active');
                $('#content1').addClass('on');
            }
            else{
                $('#send').addClass('active');
                $('#content2').addClass('on');
            }
         }
    </script>
    
    
 

<%@ include file="../include/footer.jsp"%>   
 </body>

 
</html>
