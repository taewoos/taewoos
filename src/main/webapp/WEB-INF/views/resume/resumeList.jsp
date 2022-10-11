<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>   
<%@ include file="../include/header.jsp"%>


<section class="main_container res_main_container">
   <div class="ch3_title">
      <strong>이력서 목록</strong>
   </div>
   <form action="<c:url value='/resume/resumeList' />"
      class="navbar-form navbar-right res_search" role="search">
      <div class="form-group">
         <input type="text" name-="keyword" class="form-control"
            value="${pc.paging.keyword}" placeholder="Search">
      </div>
      <button type="submit" class="btn btn-default">검색</button>
   </form>
</section>

<div class="container res_list">
   <table class="table table-bordered table-hover dt-responsive">
      <thead>
         <tr class="list_tr">
            <th class="res_th1">번호</th>
            <th class="res_th2">제목</th>
            <th class="res_th3">등록일</th>
         </tr>
      </thead>
      <tbody>
         <tr>      
            
         </tr>
         <tr>
			<c:if test="${recNo == 0}">		
						<c:forEach var="vo" items="${resumeList}">
						<tr>
							<td align="center" id="resNo">${vo.resNo}</td>
							<td><a
								href="<c:url value='/resume/resumeUserCheck/${vo.resNo}${pc.makeURI(pc.paging.pageNum)}' />">${vo.resTitle}</a>
							</td>
							<td><fmt:formatDate value="${vo.resRegdate}" pattern="yyyy-MM-dd"/></td>
						</tr>
					</c:forEach>
			</c:if>
			
			<c:if test="${recNo != 0}">		
						<c:forEach var="vo" items="${resumeList}">
						<tr>
							<td align="center"><input type="radio" name="resNo" id="resNo" value='${vo.resNo}'></td>
							<td><a
								href="<c:url value='/resume/resumeUserCheck/${vo.resNo}${pc.makeURI(pc.paging.pageNum)}' />">${vo.resTitle}</a>
							</td>
							<td><fmt:formatDate value="${vo.resRegdate}" pattern="yyyy-MM-dd"/></td>
						</tr>
					</c:forEach>
			</c:if>
         </tr>

      </tbody>
      <tfoot>
<!--          <tr>
            <td colspan="5" class="text-center">Data Resume Management.</td>
         </tr> -->
      </tfoot>
      
   </table>
          <form action="<c:url value='/resume/resumeList' />" name="pageForm">
                    <div class="text-center">
                    
                    <ul id="pagination" class="pagination pagination-sm">
                       <c:if test="${pc.prev}">
                           <li><a href="#" data-pagenum="${pc.beginPage-1}">이전</a></li>
                        </c:if>
                        
                        <c:forEach var="num" begin="${pc.beginPage}" end="${pc.endPage}">
                           <li class="${pc.paging.pageNum == num ? 'active' : ''}"><a href="#" data-pagenum="${num}">${num}</a></li>
                        </c:forEach>
                        
                        <c:if test="${pc.next}">
                           <li><a href="#" data-pagenum="${pc.endPage+1}">다음</a></li>
                        </c:if>
                    </ul>
                    
			       <c:if test="${recNo == 0}">         
                    <button type="button" class="btn btn-insert" id="ResregistBtn" onclick="location.href='<c:url value="/resume/resumeWrite" />'">이력서 등록</button>
                   </c:if>
                   
                    <c:if test="${recNo != 0}">         
                    <button type="button" class="btn btn-insert"  id="WriteBtn" >이력서 지원</button>
                   </c:if>	
                    
                    </div>
                   
                    <input type="hidden" name="pageNum" value="${pc.paging.pageNum}">
                    <input type="hidden" name="cpp" value="${pc.paging.cpp}">
                    <input type="hidden" name="keyword" value="${pc.paging.keyword}">
                    
          </form>
</div>


<%@ include file="../include/footer.jsp"%>




	<script>
	
	const msg = '${msg}';
	if(msg !== '') {
		alert(msg);
	}	
		
	$(document).ready( function () {

			 $("input:radio[name=resNo]").click(function(){
			 
					const resNo = $("input[type=radio][name=resNo]:checked").val();
					const recNo = '${recNo}';
					
					console.log(resNo);
			 
					
					$.ajax({
						type: 'post',
						url: '<c:url value="/resume/avoidDuplication" />',
						data: JSON.stringify(
								{
							'resNo': resNo,
							'recNo': recNo,							
						}
								),
						contentType: 'application/json; charset=utf-8',
						dataType: 'text',		
								
						success: function(result) {
							if(result === 'Duplication') {
								alert('중복 지원하실 수 없습니다.');
								location.reload(true);								
							}		
							else 
							alert('지원 가능한 이력서입니다.');
						
					},
						error: function() {
							alert('알수 없는 오류입니다! 관리자에게 문의하세요!!');
					} 
					
				});
				
					
					
			 });
			 
			
			$('#WriteBtn').click(function() {
				
				
				const resNo = $("input[type=radio][name=resNo]:checked").val();
				const recNo = '${recNo}';
				const userId = '${sessionScope.login.userId}';
				console.log(resNo,recNo,userId);
				
				if(resNo === '') {
					alert('이력서를 선택하세요!');
					return;
				} else {
				
				$.ajax({
					type: 'post',
					url: '<c:url value="/resume/resumeApply" />',
					data: JSON.stringify(
							{
						'resNo': resNo,
						'recNo': recNo,
						'userId': userId
					}
							),
					contentType: 'application/json; charset=utf-8',
					dataType: 'text',		
							
					success: function(result) {
						if(result === 'applySuccess') {
							alert('정상 지원되었습니다.');
							window.location.href="<c:url value='/mypage/userMypage'/>";
						}						
							
					 else {
						alert('지원에 실패했습니다. 관리자에게 문의 해 주세요.');
					}
				},
					error: function() {
						alert('지원에 실패했습니다. 관리자에게 문의하세요!!');
				} 
				
			});
			
				};			
			
		 //end jQuery
		
	});
		
	});	
	</script>