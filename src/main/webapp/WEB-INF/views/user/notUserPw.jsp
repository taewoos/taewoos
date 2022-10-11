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
    	.notExist {
    		margin: 50px auto;
    		width: 200px;
    		text-align: center;
    	}
    	label{
    		margin: auto 0;
    		height: 16px;
    		vertical-align: middle;
    	}
    	

    	.notExBtn {
    		margin: 30px auto;
    		width: 200px;
    		vertical-align: middle;
    		
    	}
    	
    
    </style>
    	
    

</head>
<body>

	<section >

			<div class="title">아이디 찾기</div>
				<div>
					<div class="notExist">
						일치하는 회원 정보가 없습니다. 
					</div>
					
					<div class="notExBtn">
				 	 	<button class="btn btn-light notExBtn" type="button" onclick="location.href='<c:url value='/user/findPw' />';">
					  		<label>
					      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left-square" viewBox="0 0 16 16">
		  					<path fill-rule="evenodd" d="M15 2a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2zM0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm11.5 5.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5H11.5z"/>
							</svg> </label>
							 다시 찾기
						</button>
					</div>
	
				</div>
				
 

	</section>


</body>
</html>

