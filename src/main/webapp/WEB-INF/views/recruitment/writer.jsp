<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<%@include file="../include/header.jsp" %>



    <div class="rec_board_wrap">
    
            <h2>공고등록</h2>
            <div class="board_write">
            <form action="/recruitment/registForm" method="post" enctype="multipart/form-data">
                <table class="table">
	                        <tbody class="t-control">
	                            <tr>
	                                <td class="t-title">작성자</td>
	                                <td><input class="form-control input-sm" name="userId" readonly="readonly" value="${login.userId}"></td>
	                                
	                            </tr>
	                            <tr>
	                                <td class="t-title">제목</td>
	                                <td><input class="form-control input-sm" name="boardTitle"></td>
	                            </tr>
	                            <tr>
	                                <td class="t-title">내용</td>
	                                <td>
	                                <textarea class="form-control" rows="12" name="boardContent"></textarea>
	                                <img id="fileImg" src="<c:url value='/img/img_ready.png' />">
	                                </td>
	                                </tr>  
	                            <tr>
	                            	<td class="t-title">로고 첨부</td>
	                            	<td><input type="file" name="file" class="form-control-sm" id="file"></td>
	                            	
	                            </tr>                  
	                            
	                        </tbody>
	                    </table>
	           <a href="/recruitment/list">
	           <button type="button" class="btn btn-del" id="cancel">취소</button>
                <button  class="btn btn-modify">등록</button>
               </a>
               </form>
            </div>
         
            
       
    </div>












<%@include file="../include/footer.jsp" %>




<script>

//자바 스크립트 파일 미리보기 기능
function readURL(input) {
    if (input.files && input.files[0]) {
       
        var reader = new FileReader(); //비동기처리를 위한 파일을 읽는 자바스크립트 객체
        //readAsDataURL 메서드는 컨텐츠를 특정 Blob 이나 File에서 읽어 오는 역할 (MDN참조)
        reader.readAsDataURL(input.files[0]);                     
        reader.onload = function(event) { //읽기 동작이 성공적으로 완료 되었을 때 실행되는 익명함수
            $('#fileImg').attr("src", event.target.result); 
            console.log(event.target)//event.target은 이벤트로 선택된 요소를 의미
        }
    }
 }
$("#file").change(function() {
     readURL(this); //this는 #file자신 태그를 의미
     
 });



</script>



