<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<%@include file="../include/header.jsp"%>
<link href="${pageContext.request.contextPath }/resources/css/my.css" rel="stylesheet">


<!-- ================ main ================ -->

<section class="main_container">
   <div class="ch3_title">
      <strong>가입 신청 기업 목록</strong>
   </div>
   <form class="navbar-form navbar-right" role="search">
      <div class="form-group">
         <input type="text" class="form-control" placeholder="Search">
      </div>
      <button type="submit" class="btn btn-default">검색</button>
   </form>
</section>

<div class="container">
   <table class="table table-bordered table-hover dt-responsive">
      <thead>
         <tr class="list_tr">
            <th>회사명</th>
            <th>대표자</th>
            <th>기업유형</th>
            <th>회사 주소</th>
         </tr>
      </thead>
      <tbody>
         <c:forEach items="${article}" var="user">
            <tr>
               <td class="GetComdetail" name="${user.userId}">${user.compName}</td>
               <td>${user.ceo}</td>
               <td>${user.corType}</td>
               <td>${user.comAddrBasic} ${user.comAddrDetail} ${user.comAddrZipNum}</td>
               
            </tr>
         </c:forEach>
      </tbody>
      <tfoot>

      </tfoot>
   </table>

</div>

<div class="top">
   <a href="#">TOP</a>
</div>



<div id="ComDetailmodal" class="modal fade" role="dialog"
   aria-labelledby="gridSystemModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header admin_user_title">
            <button type="button" class="close" data-dismiss="modal"
               aria-label="Close">
               <span aria-hidden="true">&times;</span>
            </button>
            <h4 class="modal-title" id="gridSystemModalLabel">기업정보</h4>
         </div>

         <div class="modal-body">
            <div class="container-fluid">
               <div class="row admin_user_info admin_comp_info">
                  <div class="col-md-5">
                     <img
                        src="${pageContext.request.contextPath}/resources/img/img_ready.png"
                        alt="img_ready">
                  </div>
                  <div class="col-md-6 ">
                     <div class="title">

                        <p>
                           기업명 : <span id="ComCompName"> </span>
                        </p>


                        <p>
                           대표자 : <span id="Comceo"> </span>
                        </p>

                        <p>
                           사업자등록번호 : <span id="CombusinessNum"> </span>
                        </p>

                        <p>
                           기업 유형 : <span id="ComcorType"> </span>
                        </p>

                        <p>
                           기업 주소 : <span id="comAddrBasic"> </span>
                        </p>

                        <p>
                           기업 상세주소 : <span id="comAddrDetail"> </span>
                        </p>

                        <p>
                           가입자 ID : <span id="ComuserId"> </span>
                        </p>

                        <p>
                           가입자 이메일 : <span id="ComuserEmail"> </span>
                        </p>


                     </div>
                     <br>
                     <div class="content-inner"></div>
                     <div class="link-inner row">
                        <a href="#"><button id="Pass" type="button"
                              class="btn btn-insert">가입 승인</button></a>                        
                              
                        <a href="#">
                              <button id="Fail" type="button" class="btn btn-modify">가입 거절</button></a>
                              
                        <a href="#"><button id="Close" type="button"
                              class="btn btn-insert">닫기</button></a>
                     </div>

                  </div>
               </div>
            </div>
         </div>
      </div>
      <!-- /.modal-content -->
   </div>
   <!-- /.modal-dialog -->
</div>
<!-- /.modal -->














<script>
//on() 함수 : 이벤트 바인딩
$('.GetComdetail').on('click',function(e) {
   e.preventDefault(); //a의 고유 기능 중지.
   
            //id 얻어오기
            const id = $(this).attr('name');

            $.getJSON('<c:url value="/mypage/getComDetail/"/>' + id,
                  function(data) {
                     console.log(data);

                     //미리 준비한 모달창에 뿌릴 겁니다. (모달 위에 있어요.)
                     //값을 제 위치에 잘 뿌려 주시고 모달을 열어 주세요.
                     // const src = '<c:url value="/snsBoard/display?fileLoca=' + data.fileloca + '&fileName=' + data.filename + '" />'
                     // $('#snsImg').attr('src', src); //이미지 경로 처리
                     $('#ComCompName').html(data.compName);
                     $('#Comceo').html(data.ceo);
                     $('#ComcorType').html(data.corType);
                     $('#comAddrBasic').html(data.comAddrBasic);
                     $('#comAddrDetail').html(data.comAddrDetail);
                     $('#ComuserId').html(data.userId);
                     $('#ComuserName').html(data.userName);
                     $('#ComuserEmail').html(data.userEmail);
                     //$('#snsRegdate').html(timeStamp(data.regdate));
                     //$('#snsContent').html(data.content); //내용처리
                     $('#ComDetailmodal').modal('show'); //모달 열기

                  });

         }); //모달 열기

   //가입 승인 
   $('#Pass').click(function() {

      const id = $("span[id=ComuserId]").text();
      console.log(id);

      $.ajax({
         type : 'post',
         url : '<c:url value="/mypage/idntNoUpdate"/>',
         data : JSON.stringify({
            'id' : id
         }),
         contentType : 'application/json; charset=utf-8',
         dataType : 'text',

         success : function(result) {
            if (result === 'Success') {
               alert('가입 승인되었습니다.');
               $('#ComDetailmodal').modal('hide');
               location.reload(true);
            } else {
               alert('가입승인 처리에 실패했습니다. 관리자에게 문의 해 주세요.');
               $('#ComDetailmodal').modal('hide');
            }
         },
         error : function() {
            alert('가입승인 처리에 실패했습니다. 관리자에게 문의 해 주세요.');
            $('#ComDetailmodal').modal('hide');
         }

      }); //ajax            
   }); // 가입 승인 끝 

   //가입 거절
   $('#Fail').click(function() {

      // 가입 거절당한 기업의 처리는?
      // 내 생각엔, idnt_no를 새로 주고(반려된 기업)
      // 그 기업들이 로그인시, alert 라던지, 쪽지라던지, 알려주고
      // 가입 대기중인 정보를 삭제할건지 (탈퇴), 재 시도를 할건지 ..
      // 다 귀찮으면 그냥 거절 눌렀을때 회원정보 삭제

      
      
      
      alert('정상 처리되었습니다');
      $('#ComDetailmodal').modal('hide');

   }); //가입 거절 끝

   //닫기      
   $('#Close').click(function() {

      $('#ComDetailmodal').modal('hide');

   });//닫기 끝
</script>




