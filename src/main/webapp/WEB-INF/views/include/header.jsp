<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>커피콩 박람회</title>
<%-- ${pageContext.request.contextPath} == <c:url value='' /> --%>
<link
   href="${pageContext.request.contextPath}/resources/css/bootstrap.css"
   rel="stylesheet">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!--개인 디자인 추가-->
<link href="${pageContext.request.contextPath}/resources/css/main.css"
   rel="stylesheet">
<script
   src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
<!--Font Awesome 아이콘-->
<script src="https://kit.fontawesome.com/8813e159ee.js"
   crossorigin="anonymous"></script>
<!-- freeBoard 스타일 -->
<link
   href="${pageContext.request.contextPath}/resources/css/free_board.css"
   rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/res.css"
   rel="stylesheet">

<script src="${pageContext.request.contextPath}/resources/js/FileSaver.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/xlsx.full.min.js"></script>

</head>

<body>
   <!-- ================ header ================ -->
   <header>
      <div class="container-fluid">
         <div class="row">
            <nav class="navbar">
               <div class="container">
                  <div class="navbar-header">
                     <button type="button" class="navbar-toggle"
                        data-toggle="collapse" data-target="#myNavbar">
                        <span class="icon-bar"></span> <span class="icon-bar"></span> <span
                           class="icon-bar"></span>
                     </button>
                     <a class="navbar-brand" href="<c:url value='/' />"> <img
                        src="${pageContext.request.contextPath}/resources/img/logo.png"
                        alt="logo">
                     </a>
                  </div>

                  <div class="collapse navbar-collapse" id="myNavbar">
                     <ul class="nav navbar-nav navbar-right">
                        <c:choose>
                           <c:when test="${login == null}">
                              <button type="button" class="btn btn-default navbar-btn"
                                 onclick="location.href='<c:url value='/user/userLogin'/>'">로그인</button>
                              <button type="button" class="btn btn-default navbar-btn"
                                 onclick="location.href='<c:url value='/user/userJoin'/>'">회원가입</button>
                           </c:when>
                           <c:otherwise>
                              <button type="button" class="btn btn-default navbar-btn"
                                 onclick="location.href='<c:url value='/user/userLogout'/>'">로그아웃</button>
                           </c:otherwise>
                        </c:choose>
                     </ul>
                     <ul class="nav navbar-nav nav-list">
                        <li><a href="<c:url value='/intro/intro'/>">박람회소개</a></li>
                        <li><a href="<c:url value='/recruitment/list'/>">채용정보관</a></li>
                        <li class="dropdown header_dropdown"><a href="#"
                           class="dropdown-toggle" data-toggle="dropdown" role="button"
                           aria-haspopup="true" aria-expanded="false">정보마당<span
                              class="caret"></span>
                        </a>
                           <ul class="dropdown-menu">
                              <li><a href="<c:url value='/notice/noticeList' />">공지사항</a></li>
                              <li><a href="<c:url value='/freeboard/freeList' />">자유게시판</a></li>
                           </ul></li>
                        <c:if test="${login != null}">
                           <c:choose>
                              <c:when test="${login.idntNo == 1}"><!-- 개인 -->               
                                 <li><a href="<c:url value='/mypage/userMypage' />"> 마이 페이지</a></li>
                              </c:when>   
                              <c:when test="${login.idntNo == 2 }"><!-- 기업 -->               
                                 <li><a href="<c:url value='/mypage/compMypage' />">마이페이지</a></li>
                              </c:when>
                              <c:otherwise> <!-- 관리자 -->
                                 <li><a href="<c:url value='/mypage/adminMypage' />">마이페이지</a></li>
                              </c:otherwise>   
                           </c:choose> 
                        </c:if>
                     </ul>
                  </div>
               </div>
            </nav>
         </div>
      </div>
      <hr>
   </header>
   

</body>
