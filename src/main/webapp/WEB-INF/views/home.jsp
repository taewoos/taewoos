<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="include/header.jsp"%>


<section class="section1">
	<!--슬라이드(캐러셀)-->
	<div class="container-fluid">
		<div class="row">
			<div id="myCarousel" class="carousel slide" data-ride="carousel">
				<!-- 슬라이드-->
				<ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<!--active 현재보고있는 슬라이드-->
					<li data-target="#myCarousel" data-slide-to="1"></li>
					<li data-target="#myCarousel" data-slide-to="2"></li>
				</ol>

				<div class="carousel-inner" role="listbox">
					<div class="item active">
						<img src="./img/carousel-img1.png" alt="slide1">
					</div>
					<div class="item">
						<img src="./img/carousel-img2.png" alt="slide2">
					</div>
					<div class="item">
						<img src="./img/carousel-img3.png" alt="slide3">
					</div>
				</div>

				<!-- carousel 그림 좌우 화살표-->
				<a class="left carousel-control" href="#myCarousel" role="button"
					data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a> <a class="right carousel-control" href="#myCarousel" role="button"
					data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>
		</div>
	</div>
</section>

<section>
	<div class="container section2">
		<div class="row">
			<div class="col-sm-12 col-md-7 main-list">
				<h3>
					채용공고 <a href="#" data-toggle="tooltip" data-placement="right"
						title="새로 올라온 채용공고"><span class="badge">+ 99</span></a>
				</h3>
				<a href="ch_list.html" data-toggle="tooltip" data-placement="right"
					title="전체보기"><span class="plus"><i
						class="fa-regular fa-square-plus"></i></span></a>
				<hr>
				
<%-- 				<c:forEach var="bvo" items="${boardList}">
					<div class="col-md-3 inner">
						<div class="card">
							<img src="./img/company1.png" class="card-img-top" alt="company1">
							<div class="card-body">
								<h5 class="card-title">(주)우체국금융개발원</h5>
								<p class="card-text">일반정규직</p>
								<a href="#">공고보기</a>
							</div>
						</div>
					</div> 					
				</c:forEach> --%>
				
			<div class="list" id="js-load">
				<c:forEach items="${boardList}" var="vo">
		          	  <div class="col-md-3 inner">
		          	  
		                <a class="move" href='/recruitment/view/<c:url value="${vo.boardNo}"/>'>                  
		                        <img src="/recruitment/display?fileLoca=${vo.fileLoca}&fileName=${vo.fileName}" alt="..." >   
		                        <figure align="center">                 
		                        <c:out value="${vo.boardTitle}"/>    
		                        </figure>          
		                </a>
		          	 </div>
	              </c:forEach>            
       		 </div>
				
			</div>

			<div class="col-sm-12 col-md-offset-1 col-md-4 main-list">
				<h3>공지사항</h3>
				<a href="<c:url value='/notice/noticeList' />" data-toggle="tooltip" data-placement="right"
					title="전체보기"><span class="plus"><i
						class="fa-regular fa-square-plus"></i></span></a>
				<hr>
				<c:forEach var="vo" items="${noticeList}">
					<ul class="icon-list ps-0 board-list">
						<li class="d-flex align-items-start mb-1"><a href="<c:url value='/notice/noticeDetail/${vo.noticeNo}${pc.makeURI(pc.paging.pageNum)}' />">${vo.noticeTitle}</a></li>
					</ul>
				</c:forEach>
			</div>
		</div>
	</div>
</section>

<%@ include file="include/footer.jsp"%>

	<script>
		const msg = '${msg}';
		if(msg == 'logout'){
			alert('로그아웃 처리 되었습니다.');
		}
	</script>


