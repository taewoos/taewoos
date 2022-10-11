<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>비밀번호 변경</title>

    <link href="${pageContext.request.contextPath }/resources/css/bootstrap.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
    

    
    <style>
    
    	section{
    		padding: 35px;
    	}
    
    	.title{
    		margin: 30px auto 30px;
    		width: 250px;
    		text-align: center;
    		font-size: 25px;
    		font-weight: bold;
    	}

    	label{
    		margin-left: 30px;
    		height: 16px;
    		vertical-align: middle;
    		float: left;
    	}
    	
		.line{
			margin-top: 20px;
		}
		.closeBtn {
			display :inline-block;
		}
		.closeBtn1 {
			margin-top: 50px;
			 text-align: center;
		}
		input{
			width: 200px;
			float: right;
			margin-right: 30px;
		}
		span {
			font-size: 10px;
			display:block;
			margin-top: 8px;
			margin-right: 30px;
			float:right;
			width: 136x;
		}
		.clearfix::after {
		    content: '';
		    display: block;
		    clear: both;
		}
    	
    	
    
    </style>
    	
    

</head>
<body>

	<section >

			<div class="title">비밀번호 변경</div>
				
				<form action="<c:url value='/user/pwUpdate' />" method="post" id="updatePwForm">
					<div class="line clearfix">
						<label>아이디</label>
						<input value="${userFind.userId}" name="userId" readonly>
					</div>
					<div class="line clearfix">
                         <label for="password">새 비밀번호</label>
                         <input type="password" name="userPw" id="userPw" maxlength="16" placeholder="영 대/소문자, 숫자조합 8~16자">
                         <span id="msgPw"></span> <!-- 비밀번호 유효성 메세지 공간 -->
                    </div>
                    <div class="line clearfix">
                         <label for="pw-confirm">비밀번호 확인</label>
                         <input type="password" id="pwConfirm" maxlength="16" placeholder="비밀번호를 확인해 주세요.">
                         <span id="msgPw-c"></span> <!-- 비밀번호 확인 여부 메세지 공간 -->
                    </div>
				</form>
				<div class="closeBtn1">
				  <button class="btn btn-info closeBtn" type="button" id="updatePwBtn">수정</button>
				</div>	
				
	</section>


	<script>
	 /*비밀번호 형식 검사 스크립트*/
    var pw = document.getElementById("userPw");
    pw.onkeyup = function(){
        var regex = /^[A-Za-z0-9+]{8,16}$/;
         if(regex.test(document.getElementById("userPw").value )) {
            document.getElementById("userPw").style.borderColor = "green";
            document.getElementById("msgPw").innerHTML = "";
        } else {
            document.getElementById("userPw").style.borderColor = "red";
            document.getElementById("msgPw").innerHTML = "영 대/소문자, 숫자조합 8~16자";
        }
    }
    /*비밀번호 확인검사*/
    var pwConfirm = document.getElementById("pwConfirm");
    pwConfirm.onkeyup = function() {
        var regex = /^[A-Za-z0-9+]{8,16}$/;
        if(document.getElementById("pwConfirm").value == document.getElementById("userPw").value ) {
            document.getElementById("pwConfirm").style.borderColor = "green";
            document.getElementById("msgPw-c").innerHTML = "";
        } else {
            document.getElementById("pwConfirm").style.borderColor = "red";
            document.getElementById("msgPw-c").innerHTML = "비밀번호가 일치하지 않습니다";
        }
    }  
    
	$('#updatePwBtn').click(function() {
		//비밀번호 검증

		 if($('#userPw2').val() === '' || $('#userPw2').val() !== $('#pwConfirm2').val()) {
			alert('비밀번호 규칙을 확인하세요.');
			$('#userPw2').focus();
			return;
		} else {
			if(confirm('이대로 수정을 진행할까요?')) {
				$('#updatePwForm').submit();

			} else {
				return;
			}
		}
	}); //수정버튼 이벤트 끝.
	
	</script>
</body>
</html>

