<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 

   

<%@include file="../include/header.jsp" %>
<link href="${pageContext.request.contextPath }/resources/css/my.css" rel="stylesheet">


    <!-- ================ main ================ -->
    <section class="main_container">
        <div class="ch3_title">
            <strong>MyPage_지원자 관리</strong>
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
                    <th>지원자</th>
                    <th>공고</th>
                    <th>진행 단계</th>
                </tr>
            </thead>
            <tbody>
             <c:forEach items="${userInfo.userBoardList}" var="vo">
                <tr>
                    <td><a href="#">홍길동</a></td>
                    <td>2022.07.21</td>
                    <td>1차합격</td>
                </tr>
           </c:forEach>
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="5" class="text-center">Data Applicant Management.</td>
                </tr>
            </tfoot>
        </table>
  
    </div>
    <div class="top">
        <a href="#">TOP</a> 
    </div>

<%@include file="../include/footer.jsp" %>