<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<%@include file="../include/header.jsp"%>
<link href="${pageContext.request.contextPath }/resources/css/my.css" rel="stylesheet">


<!-- ================ main ================ -->

<section class="main_container">
	<div class="ch3_title">
		<strong>회원 관리</strong>
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
				<th>ID</th>
				<th>이름</th>
				<th>휴대전화 번호</th>
				<th>주소</th>
			</tr>
		</thead>
		<tbody>

			<c:forEach items="${article}" var="user">
				<tr>
					<td class="GetUserdetail" name="${user.userId}">${user.userId}</td>
					<td>${user.userName}</td>
					<td>${user.userPhone1} - ${user.userPhone2} -
						${user.userPhone3}</td>
					<td>${user.addrBasic} ${user.addrZipNum}</td>

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



<div id="adminUserModal" class="modal fade" role="dialog"
	aria-labelledby="gridSystemModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header admin_user_title">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="gridSystemModalLabel">회원정보</h4>
			</div>

			<div class="modal-body">
				<div class="container-fluid">
					<div class="row admin_user_info">
						<div class="col-md-5">
							<img
								src="${pageContext.request.contextPath}/resources/img/userimg.jpg"
								alt="img_ready">
						</div>

						<div class="col-md-6 ">
							<div class="title">

								<p>
									유저 ID : <span id="UserId"> </span>
								</p>


								<p>
									유저 이름 : <span id="UserName"> </span>
								</p>

								<p>
									유저 핸드폰 번호 : <span id="UserPhoneNum"> </span>
								</p>

								<p>
									주소 : <span id="UserAddr"> </span>
								</p>



								<p>
									생년월일 : <span id="UserBirth"> </span>
								</p>

							</div>
							<br>
							<div class="content-inner"></div>
							<div class="link-inner row">
								<a href="#">
									<button id="Pass" type="button"	class="btn btn-insert">권한 박탈</button>
								</a> 
								<a href="#">
									<button id="Close" type="button" class="btn btn-insert">닫기</button>
								</a>
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

<%@ include file="../include/footer.jsp"%>


<script>
   //on() 함수 : 이벤트 바인딩
   $('.GetUserdetail').on(
         'click',
         function(e) {
            e.preventDefault(); //a의 고유 기능 중지.

            //id 얻어오기
            const id = $(this).attr('name');

            $.getJSON('<c:url value="/mypage/getUserDetail/"/>' + id,
                  function(data) {
                     console.log(data);

                     //미리 준비한 모달창에 뿌릴 겁니다. (모달 위에 있어요.)
                     //값을 제 위치에 잘 뿌려 주시고 모달을 열어 주세요.
                     // const src = '<c:url value="/snsBoard/display?fileLoca=' + data.fileloca + '&fileName=' + data.filename + '" />'
                     // $('#snsImg').attr('src', src); //이미지 경로 처리
                     $('#UserId').html(data.userId);
                     $('#UserName').html(data.userName);
                     $('#UserPhoneNum').html(data.userPhone1,
                           data.userPhone2, data.userPhone3);
                     $('#UserAddr').html(data.addrBasic);
                     //$('#UserRegDate').html(data.regDate);
                     $('#UserBirth').html(data.userBirthYear);
                     //$('#ComuserName').html(data.userName);
                     //$('#ComuserEmail').html(data.userEmail);
                     //$('#snsRegdate').html(timeStamp(data.regdate));
                     //$('#snsContent').html(data.content); //내용처리
                     $('#adminUserModal').modal('show'); //모달 열기

                  });

         }); //모달 열기

   //권한 박탈 
   $('#Pass').click(function() {

      const id = $("span[id=UserId]").text();
      console.log(id);

      $.ajax({
         type : 'post',
         url : '<c:url value="/mypage/useridntNoUpdate"/>',
         data : JSON.stringify({
            'id' : id
         }),
         contentType : 'application/json; charset=utf-8',
         dataType : 'text',

         success : function(result) {
            if (result === 'Success') {
               alert('권한 박탈 되었습니다.');
               $('#adminUserModal').modal('hide');
               location.reload(true);
            } else {
               alert('권한의 변동이 없습니다.');
               $('#adminUserModal').modal('hide');
            }
         },
         error : function() {
            alert('관리자에게 문의 해 주세요.');
            $('#adminUserModal').modal('hide');
         }

      }); //ajax            
   }); // 가입 승인 끝 

   //닫기      
   $('#Close').click(function() {

      $('#adminUserModal').modal('hide');

   });//닫기 끝
</script>



