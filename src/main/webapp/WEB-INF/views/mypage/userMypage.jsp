<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/header.jsp"%>
<link href="${pageContext.request.contextPath }/resources/css/my.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/message.css"
   rel="stylesheet">
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



  <div class="container myPage_wrap">
       <div class="my_title">
         <strong>MyPage</strong>
      </div>
    <div class="contents">

        </div>
        <div class="row my_Information">
            <div class="col-md-4" id="a">
                <h2 class="myUser_h2"> <strong>${login.userId}</strong> 님 <br>  환영합니다.</h2>
                <a href="#">
               <button type="button" class="btn btn-modify" onclick="location.href='${pageContext.request.contextPath}/user/userInfoModify'">내정보 관리</button>
            </a>
            </div>


            <div class="col-md-4" id="b">
                <h2>이력서 개수 <br>    <span class="resume_count" > ${ResCount}</span> 개 </h2>
                <a href="#">
               <button type="button" class="btn btn-modify" onclick="location.href='${pageContext.request.contextPath}/resume/resumeList'">이력서 관리</button>
            </a>
            </div>

            <div class="col-md-4" id="c">
                <h2> 미수신 쪽지 <br>   <span class="resume_count">  ${MsgCount} </span> 개 </h2>
                <a href="#">
               <button type="button" class="btn btn-modify" data-toggle="modal" data-target="#messageModal">쪽지함 이동</button>
            </a>
            </div>

        </div>


        <h1 class="col-md-4">지원현황 </h1>
        <span class="col-md-6"></span>


        <div class="row my_list_wrap">

            <table class="table table-hover col-md-8" id="g">
                <thead>
                    <tr>
                        <th class="col-md-3">지원 공고 번호</th>
                        <th class="col-md-2">공고 제목</th>
                        <th class="col-md-2">지원 이력서 번호</th>
                        <th class="col-md-3">진행 상황</th>
                        <th class="col-md-2">등록일</th>
                        
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="vo" items="${article}">
                
                    <tr>
                        
                        <td> <a href="<c:url value='/recruitment/view/${vo.recNo}'/>">${vo.recNo}</a> </td>                                                           
                        <td>${vo.boardTitle}</td>
                        <td><a href="<c:url value='/resume/resumeUserCheck/${vo.resNo}'/>">${vo.resNo}</a> </td>
                        <td>
                        
                        <c:set var="reqPreg" value="${vo.reqPreg}" />
                        <c:choose>
                        <c:when test="${reqPreg eq 5}">
                                심사 대기    
                        </c:when>
                        <c:when test="${reqPreg eq 1}">
                                서류 합격    
                        </c:when>
                        <c:when test="${reqPreg eq 2}">
                                면접 합격    
                        </c:when>
                    <c:when test="${reqPreg eq 3}">
                                최종 합격    
                        </c:when>
                        <c:otherwise> 
                                  불합격  
                        </c:otherwise>
                        
                        </c:choose>
                        
                        
                        </td>
                        <td><fmt:formatDate value="${vo.boardDate}" pattern="yyyy-MM-dd"/></td>
                    </tr>
                        </c:forEach>
                        
                        
     
                </tbody>
                
                
            </table>
            
               
                       <!--페이지 네이션을 가져옴-->
          <form action="<c:url value='/resume/resumeUserCheck' />" name="pageForm">
                    <div class="text-center">
                    
                    <ul id="pagination" class="pagination pagination-sm">
                       <c:if test="${pc.prev}">
                           <li><a href="#" data-pagenum="${pc.beginPage-1}">이전</a></li>
                        </c:if>
                        
                        <c:forEach var="num" begin="${pc.beginPage}" end="${pc.endPage}">
                           <li class="${pc.paging.pageNum == num ? 'active' : ''}"><a href="#" data-pagenum="${num}">${num}</a></li>
                        </c:forEach>
                        
                        <c:if test="${pc.next}">
                           <li><a href="#" data-pagenum="${pc.endPage+1}">다음</a></li>
                        </c:if>
                    </ul>
                    


      <!-- 페이지 관련 버튼(이전, 다음, 페이지번호)을 클릭 시 같이 숨겨서 보내줄 공통 값  -->
      <input type="hidden" name="pageNum" value="${pc.paging.pageNum}">
      <input type="hidden" name="cpp" value="${pc.paging.cpp}"> <input
         type="hidden" name="condition" value="${pc.paging.condition}">
      <input type="hidden" name="keyword" value="${pc.paging.keyword}">
   </form>







        </div>
      
      <!-- 쪽지함 모달 시작 -->  
        <div id="messageModal" class="modal fade" aria-hidden="true"
		style="display: none; z-index: 1050;" data-backdrop="false">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">쪽지 목록</h4>
				</div>
				<div class="modal-body">
					<div class="tab">
						<div class="choice">
							<a id="receive" class="panel active" onclick="active(0)">받은
								쪽지</a> <a id="send" class="panel" onclick="active(1)">보낸 쪽지</a>
						</div>
					</div>
					<div id="content1" class="content on">
						<table class="table table-hover">
							<thead>
								<tr>
									<th width="30%">제목</th>
									<th width="35%">내용</th>
									<th width="15%">보낸사람</th>
									<th width="20%">날짜</th>
								</tr>
							</thead>
						</table>
						
						<table class="table table-hover">

							<tbody id="js-load" class="sibal">
								
								<c:forEach var="vo" items="${getMsgList}">
								
										<tr onclick="viewDetail(${vo.msgNo})" class="js-load" style="width: 100%; padding:0; margin:0;">
											<td width="31%">${vo.msgTitle}</td>
											<td width="37%"
												style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap; max-width: 140px ">${vo.msgContent}</td>
											<td width="15%">${vo.userId}</td>
											<td width="20%"><fmt:formatDate value="${vo.msgDate}"
													pattern="yyyy-MM-dd" /></td>
										</tr>
								</c:forEach>
								
							</tbody>
						</table>
							<div id="test"></div>
						<div class="modal-footer">
							  <div id="js-btn-wrap" class="btn-wrap" style="text-align:left;"> <a href="javascript:;" class="button">더보기</a> </div>
						</div>
					</div>
					<div id="content2" class="content">
		
						<table class="table table-hover">
							<thead>
								<tr>
									<th width="30%">제목</th>
									<th width="35%">내용</th>
									<th width="15%">받는사람</th>
									<th width="20%">날짜</th>
								</tr>
							</thead>
						</table>
						
						<table class="table table-hover">

							<tbody id="js-load2" class="sibal2">
								
								<c:forEach var="vo" items="${sendMsgList}">
								
										<tr onclick="viewDetail(${vo.msgNo})" class="js-load2" style="width: 100%; padding:0; margin:0;">
											<td width="31%">${vo.msgTitle}</td>
											<td width="37%"
												style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap; max-width: 140px ">${vo.msgContent}</td>
											<td width="15%">${vo.receiver}</td>
											<td width="20%"><fmt:formatDate value="${vo.msgDate}"
													pattern="yyyy-MM-dd" /></td>
										</tr>
								</c:forEach>
								
							</tbody>
						</table>
							<div id="test2"></div>
						<div class="modal-footer">
							  <div id="js-btn-wrap2" class="btn-wrap2" style="text-align:left;"> <a href="javascript:;" class="button2">더보기</a> </div>
						</div>
					</div>
					<br><br>
					<a style="float: right;" data-toggle="modal" href="#myModal2"
						class="btn btn-insert">쪽지 보내기</a>
				</div>

			</div>
			<!-- /.modal-content -->


		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<div class="modal fade" id="myModal2" aria-hidden="true"
		style="display: none; z-index: 1060;">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">쪽지 보내기</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div style="padding: 20px; margin: 20px">


							<div>
								<form action="<c:url value='/mypage/msgSendForm' />"
									method="post" name="msgSendForm">

									<div>
										<label>보내는 사람: </label> <input type="text" name="userId"
											id="userId" class="form-control" value="${login.userId}"
											readonly>
									</div>
									<div>
										<label>받는 사람: </label> <input type="text" name="receiver"
											id="receiver" class="form-control">
									</div>
									<br>

									<div></div>


									<div class="form-group">
										<input type="text" class="form-control" name="msgTitle"
											placeholder="제목">
									</div>
									<br>
									<div class="form-group">
										<textarea class="form-control" rows="8" name="msgContent"
											placeholder="내용"></textarea>
									</div>


									<br>

									<div class="form-group">
										<button type="button" class="btn btn-lg btn-info btn-block"
											id="msgSendBtn">보내기</button>
									</div>

								</form>

							</div>

						</div>
					</div>


				</div>
				<div class="modal-footer"></div>
			</div>
			<!-- /.modal-content -->


		</div>
	</div>


	<!--받은 쪽지 보기 -->
	<div id="myModal3" class="modal fade" aria-hidden="true"
		style="display: none; z-index: 1070;">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">쪽지 보기</h4>
				</div>
				<div class="modal-body">

					        <div class="title">
           					 쪽지 내용
        					</div>
        <div class="table-responsive">
            <table class="table">
            <tr>
                <td class="gray">보낸이</td>
                <td id="userId2"></td>
                <td class="gray">날짜</td>
                <td id="msgDate">2022.07.24</td>
            </tr>
            <tr>
                <td class="gray">제목</td>
                <td colspan="3" id="msgTitle" style="text-align: left;"></td>
            </tr>
            <tr>
                <td class="gray message-content">내용</td>
                <td colspan="3" id="msgContent" style="text-align: left;"></td>
            </tr>
            </table>
        </div>

					<div class="form-group">
						<form action="<c:url value='/mypage/delMessage' />" method="post" name="delMessageForm">
						<input id="delId" type="hidden" name="msgNo" value=""> </input>
						</form>
						<button type="button" class="btn btn-lg btn-info btn-block" id="msgDel">삭제</button>
					</div>
				</div>
			</div>

			<div class="modal-footer"></div>
		</div>
		<!-- /.modal-content -->


	</div>
	
	<!--보낸 쪽지 보기 -->
	<div id="myModal4" class="modal fade" aria-hidden="true"
		style="display: none; z-index: 1070;">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">쪽지 보기</h4>
				</div>
				<div class="modal-body">

					        <div class="title">
           					 쪽지 내용
        					</div>
        <div class="table-responsive">
            <table class="table">
            <tr>
                <td class="gray">받는 사람</td>
                <td id="receiver2"></td>
                <td class="gray">날짜</td>
                <td id="msgDate2"></td>
            </tr>
            <tr>
                <td class="gray">제목</td>
                <td colspan="3" id="msgTitle2"></td>
            </tr>
            <tr>
                <td class="gray message-content">내용</td>
                <td colspan="3" id="msgContent2"></td>
            </tr>
            </table>
        </div>

					<div class="form-group">
						<form action="<c:url value='/mypage/delMessage' />" method="post" name="delMessageForm2">
						<input id="delId2" type="hidden" name="msgNo" value=""> </input>
						</form>
						<button type="button" class="btn btn-lg btn-info btn-block"
							id="msgDel2" name="msgNo">삭제</button>
					</div>


				</div>


			</div>



		</div>
		<!-- /.modal-content -->


	</div> <!-- 쪽지함 모달 끝 -->

</div>


<script>
	const msg = '${msg}';
	console.log(msg);
	if(msg === 'msgSendSuccess') {
		alert('쪽지보내기 성공');
		$('#messageModal').modal('show');
	}else if(msg ==='msgDelSuccess'){
		alert('쪽지 삭제 성공');
		$('#messageModal').modal('show');
	}
	
	$(window).on('load', function () {
	    load('#js-load', '5');
	    $("#js-btn-wrap .button").on("click", function () {
	        load('#js-load', '5', '#js-btn-wrap');
	    })
	    load2('#js-load2', '5');
	    $("#js-btn-wrap2 .button2").on("click", function () {
	        load2('#js-load2', '5', '#js-btn-wrap2');
	    })
	});
	 
	function load(id, cnt, btn) {
	    var message_list = id + " .js-load:not(.mactive)";
	    var message_length = $(message_list).length;
	    var message_total_cnt;
	    if (cnt < message_length) {
	        message_total_cnt = cnt;
	    } else {
	        message_total_cnt = message_length;
	        $('.button').hide()
	    }
	    $(message_list + ":lt(" + message_total_cnt + ")").addClass("mactive");
	    $("#messageModal").css("background-color", "rgba(0,0,0,0.8)");
	}
	 
	function load2(id, cnt, btn) {
	    var message_list2 = id + " .js-load2:not(.mactive)";
	    var message_length2 = $(message_list2).length;
	    var message_total_cnt2;
	    if (cnt < message_length2) {
	        message_total_cnt2 = cnt;
	    } else {
	        message_total_cnt2 = message_length2;
	        $('.button2').hide()
	    }
	    $(message_list2 + ":lt(" + message_total_cnt2 + ")").addClass("mactive");
	    $("#messageModal").css("background-color", "rgba(0,0,0,0.8)");
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
       
   	$('#msgSendBtn').click(function() {
   		
   		var userId = $('#receiver').val();
   		console.log(userId);

   		if($('input[name=receiver]').val() === '') {
   			alert('메세지 보낼 아이디를 입력해주세요.');
			$('input[name=receiver]').focus();
   		} else if($('input[name=msgTitle]').val() === '') {
			alert('제목을 입력해주세요.');
			$('input[name=msgTitle]').focus();
		} else if($('input[name=msgcontent]').val() === '') {
			alert('내용을 입력해주세요.');
			$('input[name=msgContent]').focus();
		}		 		 
		 else {
			 var idCheck=false;
			 
			 $.ajax({
			      type: 'post',
			      async:false,
			      url: '<c:url value="/user/idCheck" />',
			      data: userId,
			      contentType: 'application/json',
			      success: function(data) {
			         if(data === 'ok') {
			            idCheck = false;
			         } else {
						idCheck = true;
			         }
			      },
			      error: function() {
			         alert('서버 에러입니다. 관리자에게 문의하세요.');
			      }
			   });
			 console.log(idCheck);
			 if(idCheck){
				 document.msgSendForm.submit();
				 $('#myModal2').modal('hide'); 
			 }
			 else{
				 alert('없는 유저입니다.');
				 $('input[name=receiver]').focus(); 
			 }
	
		}
	});
   	$('#msgDel').click(function() {
			 document.delMessageForm.submit();
			 $('#myModal3').modal('hide');
	
		
	});
   	$('#msgDel2').click(function() {
			 document.delMessageForm2.submit();
			 $('#myModal4').modal('hide');
	
		
	});
  

		function viewDetail(no){
			
	 		const msgNo = parseInt(no);
	 		console.log(msgNo);
			$.ajax({
				type: 'post',
				async: false,
				url: '<c:url value="/mypage/readMessage" />',
				data: JSON.stringify({
					'msgNo':msgNo
				}),
				contentType: 'application/json',
				success: function(data) {
					if("${login.userId}"==data.receiver){
						$('#msgTitle').html(data.msgTitle);
						$('#msgContent').html(data.msgContent);
						$('#msgDate').html(data.msgDate);
						$('#userId2').html(data.userId);
						$('#delId').attr('value',data.msgNo);
						
						$('#myModal3').modal('show');
						$('#messageModal').modal('hidden');
					} else {
						$('#msgTitle2').html(data.msgTitle);
						$('#msgContent2').html(data.msgContent);
						$('#msgDate2').html(data.msgDate);
						$('#receiver2').html(data.receiver);
						$('#delId2').attr('value',data.msgNo);
						$('#myModal4').modal('show');
					}
					
							
				},
				error: function() {
					alert('서버 에러입니다. 관리자에게 문의하세요.');
				}
			});  
			$('#myModal3').on('hide.bs.modal', function (e) {    
				/* ('#messageModal').modal.css( “display”, “block”); */
				$('#messageModal').css('overflow', "auto");
				});

			
		}
	
		var num=1;
		
		function next() {
			
			const no = parseInt(num)+1;
			console.log(no);
			
			$.ajax({
			      type: 'post',
			      url: '<c:url value="/message/msgPaging" />',
			      async: false,
			      data: JSON.stringify({
						'no':no
					}),
			      contentType: 'application/json',
			      success: function(data) {
			    	   /* $("#getMsg").css("display","none");  */
			    	 
			      },
			      error: function() {
			         alert('서버 에러입니다. 관리자에게 문의하세요.');
			      }
			   });
		}
		 
		 
    </script>


   <script src="https://code.jquery.com/jquery-3.6.0.min.js"
      integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
      crossorigin="anonymous"></script>

   <script
      src="${pageContext.request.contextPath }/resources//js/bootstrap.js"></script>

 
     <%@ include file="../include/footer.jsp"%>

