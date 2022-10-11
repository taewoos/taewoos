<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/header.jsp"%>
<link href="${pageContext.request.contextPath }/resources/css/my.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/message.css"
   rel="stylesheet">

<body>
  <div class="container myPage_wrap">
       <div class="my_title">
         <strong>MyPage</strong>
      </div>
    <div class="contents">

        </div>
        <div class="row my_Information">
            <div class="col-md-4" id="a">
                <h2> 총 유저수  <br>  <span class="resume_count" > ${UserCount} </span> 명 </h2>
                <a href="<c:url value='/mypage/userlist'/>"><button type="button" class="btn btn-list"> 유저 관리 </button></a>
                
            </div>


            <div class="col-md-4" id="b">
                <h2> 가입 대기중 <br>  <span class="resume_count" > ${ComCount} </span> 기업 </h2>
                <a href="<c:url value='/mypage/comlist'/>"><button type="button" class="btn btn-list"> 기업 관리 </button></a>
                
            </div>

            <div class="col-md-4" id="c">
                <h2>미수신 쪽지 <br>   <span class="resume_count"> ${MsgCount} </span> 개 </h2>
            <a href="#">
               <button type="button" class="btn btn-modify"
                  data-toggle="modal" data-target="#messageModal">쪽지함</button>
            </a>
            </div>

        </div>


        <h1 class="col-md-4">통계</h1>


            </table>
     <img src="../img/stat33.png" alt="...">   
        </div>
        <!-- 쪽지 모달 시작 -->
   <div id="messageModal" class="modal fade" aria-hidden="true"
      style="display: none; z-index: 1050;">
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
                     <tbody>

                        <c:forEach var="vo" items="${messageList}">
                           <c:if test="${login.userId eq vo.receiver}">
                              <tr onclick="viewDetail(${vo.msgNo})">
                                 <td>${vo.msgTitle}</td>
                                 <td
                                    style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap; max-width: 140px;">${vo.msgContent}</td>
                                 <td>${vo.userId}</td>
                                 <td><fmt:formatDate value="${vo.msgDate}"
                                       pattern="yyyy-MM-dd" /></td>
                              </tr>

                           </c:if>
                        </c:forEach>

                     </tbody>
                  </table>
                  <div class="modal-footer">
                     <div class="paging">
                        <a href="#" class="bt first"><<</a> <a href="#" class="bt prev"><</a>
                        <a href="#" class="num">1</a> <a href="#" class="num">2</a> <a
                           href="#" class="num">3</a> <a href="#" class="num">4</a> <a
                           href="#" class="num">5</a> <a href="#" class="bt next">></a> <a
                           href="#" class="bt last">>></a>
                     </div>

                  </div>
               </div>
               <div id="content2" class="content">
                  <table class="table table-hover">
                     <thead>
                        <tr>
                           <th width="30%">제목</th>
                           <th width="35%">내용</th>
                           <th width="15%">받는 사람</th>
                           <th width="20%">날짜</th>
                        </tr>
                     </thead>
                     <tbody>

                        <c:forEach var="vo" items="${messageList}">
                           <c:if test="${login.userId eq vo.userId}">
                                 <tr onclick="viewDetail(${vo.msgNo})">
                                    <td>${vo.msgTitle}</td>
                                    <td
                                       style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap; max-width: 140px;">${vo.msgContent}</td>
                                    <td>${vo.receiver}</td>
                                    <td><fmt:formatDate value="${vo.msgDate}"
                                          pattern="yyyy-MM-dd" /></td>
                                 </tr>
                           </c:if>
                        </c:forEach>

                     </tbody>
                  </table>
                  <div class="modal-footer">
                     <div class="paging">
                        <a href="#" class="bt first"><<</a> <a href="#" class="bt prev"><</a>
                        <a href="#" class="num">1</a> <a href="#" class="num">2</a> <a
                           href="#" class="num">3</a> <a href="#" class="num">4</a> <a
                           href="#" class="num">5</a> <a href="#" class="bt next">></a> <a
                           href="#" class="bt last">>></a>
                     </div>

                  </div>
               </div>
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
                        <form action="<c:url value='/message/msgSendForm' />"
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
                <td colspan="3" id="msgTitle"></td>
            </tr>
            <tr>
                <td class="gray message-content">내용</td>
                <td colspan="3" id="msgContent"></td>
            </tr>
            </table>
        </div>

               <div class="form-group">
                  <form action="<c:url value='/message/delMessage' />" method="post" name="delMessageForm">
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
                  <form action="<c:url value='/message/delMessage' />" method="post" name="delMessageForm2">
                  <input id="delId2" type="hidden" name="msgNo" value=""> </input>
                  </form>
                  <button type="button" class="btn btn-lg btn-info btn-block"
                     id="msgDel2" name="msgNo">삭제</button>
               </div>


            </div>


         </div>



         <div class="modal-footer"></div>
      </div>
      <!-- /.modal-content -->


   </div>
   <!-- 쪽지 모달  끝 -->
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

       if($('input[name=msgTitle]').val() === '') {
         alert('제목을 입력해주세요.');
         $('input[name=msgTitle]').focus();
      } else if($('input[name=msgcontent]').val() === '') {
         alert('내용을 입력해주세요.');
         $('input[name=msgContent]').focus();
      }              
       else {
          document.msgSendForm.submit();
          $('#myModal2').modal('hide');
   
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
            url: '<c:url value="/message/readMessage" />',
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

         
      }
    </script>


   <script src="https://code.jquery.com/jquery-3.6.0.min.js"
      integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
      crossorigin="anonymous"></script>

   <script
      src="${pageContext.request.contextPath }/resources//js/bootstrap.js"></script>
   
<%@ include file="../include/footer.jsp"%>
</body>
</html>