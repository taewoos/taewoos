<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<link href="${pageContext.request.contextPath }/resources/css/login.css" rel="stylesheet">

<body>

    <div class="loginArea clearfix">
        <!-- <div class="tab clearfix">
            <button id="ind" class="btn tab-item-on" >개인회원</button>
            <button id="ent" class="btn tab-item">기업회원</button>
        </div> -->

        <form action="${pageContext.request.contextPath}/user/login" method="post" id="loginForm">
        <div class="tab">
            <label class="radio-inline">
                <input type="radio" name="idntNo" id="idno" value="1" checked> 개인회원
              </label>
              <label class="radio-inline">
                <input type="radio" name="idntNo" id="idno" value="2"> 기업회원
              </label>
          </div>
            <div class="form-group clearfix">
                <div class="log-group clearfix">
                    <div class="clearfix">
                        <div class="box">
                        <input type="text" name="userId" id="id" class="form-control" placeholder="아이디">
                        <input type="password" name="userPw" id="pw" class="form-control" placeholder="비밀번호">
                        </div>
                        <div class="box1 box2 button-box">
                        <button type="button" id="loginBtn" class="btn btn-info log-button">로그인</button>
                        </div>
                    </div>
                    <br>
                    <a href="<c:url value='/user/findPw' />" onClick="window.open(this.href, '', 'width=460, height=470'); return false;" style="float: right">비밀번호 찾기</a>
                    <label style="float: right; font-weight: lighter; margin: 0px 10px"> | </label>
                    <a href="<c:url value='/user/findUser' />" onClick="window.open(this.href, '', 'width=460, height=430'); return false;" style="float: right">아이디</a>
                    <div class="clearfix">
<!--                         <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="auto_login">
                            <label class="form-check-label">
                             	 로그인 상태 유지
                            </label>
                          </div> -->
                          <br><br>
                        <div class="join clearfix">
                            <label>
                            <a href="<c:url value='/user/userJoin' />">회원가입</a>
                            </label>
                        </div>
                    </div>
                </div>
               </div>
            </form>
<!--              <div class="social-icons">
                        <label>소셜 로그인</label><br>
                        <img src="../img/naver.png" alt="naver">
                        <img src="../img/kakao.PNG" alt="kakao">
                        <img src="../img/facebook.PNG" alt="facebook">
                        <img src="../img/google.PNG" alt="google">
             </div> -->


    </div>

<%@ include file="../include/footer.jsp"%>
    


   <script>
    	const msg = '${msg}';
    	if(msg === 'joinSuccess') {
    		alert('회원 가입 정상 처리되었습니다.');
    	} else if(msg === 'loginFail') {
    		alert('로그인 실패! 회원 구분 및 아이디와 비밀번호를 확인하세요.');
    	} else if(msg ==='waitAppro'){
    		alert('가입 승인 대기 중입니다.')
    	}
    	
    	//입력란이 공백인 지를 확인한 후, 공백이 아니라면 submit() 진행.
    	//mapper에 작성한 login 메서드의 리턴 타입은 UserVO
    	//리턴 타입에 맞게 sql문을 작성 해 주시면 되겠습니다.
    	$(function() {
			$('#loginBtn').click(function() {
				if($('#id').val() === '') {
					alert('아이디를 입력하세요');
					return;
				} else if($('#pw').val() === '') {
					alert('비밀번호를 입력하세요');
					return;
				} else {
					$('#loginForm').submit();
				}
			});
		});
    	
    </script>
    
 </body>
</html>
