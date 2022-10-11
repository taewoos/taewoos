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
    		text-align: center;
    		font-size: 25px;
    		font-weight: bold;
    	}

    	label{
    		margin: auto 0;
    		height: 16px;
    		vertical-align: middle;
    	}
    	

    	
    	.content{display: none;}
    	
		.on{display: block !important;}
		
		.userWrap {
			margin: 70px auto;
			text-align: center;
			font-size: 25px;
		}
		.diviUser{
			display: inline-block;
			width: 150px;
			background-color: rgb(91,192,222);
			color:white;

			
		}
		.userid {
			display: inline-block;
			width: 150px;
			border: thin solid gray;

		}
		.closeBtn {

			display :inline-block;
		}
		.closeBtn1 {
			 text-align: center;
		}
    	
    	
    
    </style>
    	
    

</head>
<body>

	<section >

			<div class="title">아이디 찾기</div>
				
				<div id ="contents1" class="content">
					<div class="userWrap">
						<div class="diviUser">개인회원</div>
						<div class="userid">${userFind.userId}</div>
					</div>
					
					<div class="closeBtn1">
					<button class="closeBtn" type='BUTTON'  onClick='self.close()'>창닫기</button>
					</div>
				</div>
				
				<div id ="contents2" class="content">
					<div class="userWrap">
						<div class="diviUser">기업회원</div>
						<div class="userid">${userFind.userId}</div>
					</div>
					
					<div class="closeBtn1">
					<button class="closeBtn" type='BUTTON'  onClick='self.close()'>창닫기</button>
					</div>
				</div>				
 
	</section>


	<script>
		const idntNo = ${userFind.idntNo};		
		
		$(function(){
			if(idntNo== '1'){
		        $('#contents1').addClass('on'); 	
			} else if(idntNo=='2'|| idntNo=='7'){
				$("#contents2").addClass('on');
			} 		
		
		});	
	
	</script>
</body>
</html>

