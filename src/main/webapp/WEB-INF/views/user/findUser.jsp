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
	<title>아이디 찾기</title>

    <link href="${pageContext.request.contextPath }/resources/css/bootstrap.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
    
    <style>
    
    	section{
    		padding: 35px;
    	}
    
    	.title{
    		margin: 30px auto 30px;
    		width: 150px;
    		font-size: 25px;
    		font-weight: bold;
    	}
    	
    	input{
    		margin: 5px 0 10px;
    	}
    	
    	label {
    		margin-right: 8px;
    	}
    	select{
    		height: 25px;
    	}
    	.phoneChk, .doubleChk {
    		font-size: 12px;
    		margin-left: 5px;   		
    	}
		
		.point{
			font-size: 7px;
		}
    	.findBtn {
    		margin: 17px auto;
    		width: 200px
    		
    	}
    	
    
    </style>
    	
    

</head>
<body>

	<section >

		<form action="${pageContext.request.contextPath}/user/findUserResult" method="post" id="findUserForm">	
			<div class="title">아이디 찾기</div>
			
			<div>
				<label for="name">성함</label>
				<input type="text" name="userName" id="userName"/>
			</div>
			<div>
				<div>
					<label for="phone">휴대폰 번호</label>
				</div>
				<div>
					<select id="userPhone1" name="userPhone1">
                    	<option>010</option>
                     	<option>011</option>
                     	<option>017</option>
                    </select> 
					<span>-</span>
					<input type="text" name="userPhone2" id="userPhone2" size=4 maxlength=4 required/>
					<span>-</span>
					<input type="text" name="userPhone3" id="userPhone3" size=4 maxlength=4 required/>
					<button type="button" class="phoneChk" id="phoneChk">인증번호 보내기</button> <br/>
					<input id="phone2" type="text" name="phone2" title="인증번호 입력" disabled required/>
					<button type="button" id="phoneChk2" class="doubleChk" disabled>본인인증</button><br>
					<span class="point successPhoneChk">※ 휴대폰 번호 입력후 인증번호 보내기를 해주십시오.</span>
					<input type="hidden" id="phoneDoubleChk"/>
	
				</div>
			</div>
 
			<div class="findBtn">
			  <button class="btn btn-info findBtn" type="button" id="findUserBtn">아이디 찾기</button>
			</div>	
		</form>
	</section>

</body>
</html>

<script>

		var code2 = "";		
		$('#phoneChk').click(function() {
			var phone1 = $("#userPhone1").val();
			var phone2 = $("#userPhone2").val();
			var phone3 = $("#userPhone3").val();
			
			var regex2 = /^[0-9]{3,4}$/;
		  	var regex3 = /^[0-9]{4}$/;

			 if(!(regex2.test(phone2))) {
			    	
				 alert('전화번호를 다시 확인해 주세요.');
				 $('#userPhone2').focus();

		     } else if(!(regex3.test(phone3))){
		    	 alert('전화번호를 다시 확인해 주세요.');
				 $('#userPhone3').focus();
		    	 
		     } else {
		    	 
					const phone = phone1 + phone2 + phone3;
					
			 		
					$.ajax({
						type: 'post',
						url: '<c:url value="/user/phoneCheck" />',
						data: phone,
						contentType: 'application/json',
						success: function(data) {
			        		$("#phone2").attr("disabled",false);
			        		$("#phoneChk2").attr("disabled",false);
			        		$(".successPhoneChk").text("인증번호를 입력한 뒤 본인인증을 눌러주십시오.");
			        		$(".successPhoneChk").css("color","blue");
			        	 	$("#userPhone1").attr("disabled",true);
			        		$("#userPhone2").attr("readonly",true);
			        		$("#userPhone3").attr("readonly",true);
							code2 = data;
						},
						error: function() {
							alert('서버 에러입니다. 관리자에게 문의하세요.');
						}
					}); 
		    	 
		     }
					
		}); 

		
		//휴대폰 인증번호 대조
		$("#phoneChk2").click(function(){
			if($("#phone2").val() == code2){
				$(".successPhoneChk").text("인증번호가 일치합니다.");
				$(".successPhoneChk").css("color","green");
				$("#phoneDoubleChk").val("true");
				$("#phone2").attr("disabled",true);
			}else{
				$(".successPhoneChk").text("인증번호가 일치하지 않습니다.");
				$(".successPhoneChk").css("color","red");
				$("#phoneDoubleChk").val("false");
				$(this).attr("autofocus",true);
			}
		});
		
		$('#findUserBtn').click(function() {
			
			if($('#userName').val() == null){
				alert('이름을 입력해주세요.');
				$('#userName').focus();
				return;
				
			} else if(!($("#phoneDoubleChk").val() == 'true')){
				alert('휴대폰 본인 인증을 진행해주세요.');
				return;
				
			} else {
					$("select[name=userPhone1]").removeAttr('disabled');
				    $('#findUserForm').submit();
			}

		});
		

</script>
