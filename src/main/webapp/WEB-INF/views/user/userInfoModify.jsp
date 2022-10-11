<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<link href="${pageContext.request.contextPath }/resources/css/join.css" rel="stylesheet">

 <body>
    <section class="userinfoModi_wrap">
        <div class="join">
            <div class="row">
                <div class="col-lg-6 col-md-9 col-sm-12 join-form">
                    

                    <div id ="contents1" class="content">
                    	<div class="titlebox" style="width: 400px">
                       	 개인 회원 정보 수정
                  	   </div>
                        <form action="<c:url value='/user/userUpdate' />" method="post" id="updateForm">
                            <div id="ind-join" class="form-group">
                                <label for="id">아이디</label>
                                <div class="input-group">
                                    <input type="text" name="userId" id="userId" class="form-control" value="${getInfo.userId}" readonly>  
                                </div>                
                            </div>

                            <div class="form-group">
                                <label for="name">이름</label>
                                <div class="input-group">
                                    <input type="text" name="userName" id="userName" class="form-control" value="${getInfo.userName}">
                                </div>
                            </div>
                             <div class="form-group">
                             	<label for="gender" style="display: block">성별</label>
	                            <div class="form-check form-check-inline" style="display: inline-block ">
									  <input class="form-check-input" type="radio" name="gender" value="1" <c:if test="${getInfo.gender == 1}"> checked </c:if> >
									  <label class="form-check-label" for="inlineRadio1" style="font-weight: lighter;  ">여자</label>
									</div>
									<div class="form-check form-check-inline" style="display: inline-block">
									  <input class="form-check-input" type="radio" name="gender" value="2" style="margin-left: 20px" <c:if test="${getInfo.gender == 2}"> checked </c:if>>
									  <label class="form-check-label" for="inlineRadio2" style="font-weight: lighter ; " >남자</label>
									</div>
								</div>
                            <div class="form-group" id="info__birth">
                                <label for="birth">생년월일</label><br>
                                <div style="width: 180px; display: inline-block">
                                    <select class="form-control" id="birth-year" name="userBirthYear">
                                    <option disabled selected>출생연도</option>
									<option value="1940" <c:if test="${getInfo.userBirthYear == '1940' }"> selected </c:if> >1940</option>
									<option value="1941" <c:if test="${getInfo.userBirthYear == '1941' }"> selected </c:if>>1941</option>
									<option value="1942" <c:if test="${getInfo.userBirthYear == '1942' }"> selected </c:if>>1942</option>
									<option value="1943" <c:if test="${getInfo.userBirthYear == '1943' }"> selected </c:if>>1943</option>
									<option value="1944" <c:if test="${getInfo.userBirthYear == '1944' }"> selected </c:if>>1944</option>
									<option value="1945" <c:if test="${getInfo.userBirthYear == '1945' }"> selected </c:if>>1945</option>
									<option value="1946" <c:if test="${getInfo.userBirthYear == '1946' }"> selected </c:if>>1946</option>
									<option value="1947" <c:if test="${getInfo.userBirthYear == '1947' }"> selected </c:if>>1947</option>
									<option value="1948" <c:if test="${getInfo.userBirthYear == '1948' }"> selected </c:if>>1948</option>
									<option value="1949" <c:if test="${getInfo.userBirthYear == '1949' }"> selected </c:if>>1949</option>
									<option value="1950" <c:if test="${getInfo.userBirthYear == '1950' }"> selected </c:if>>1950</option>
									<option value="1951" <c:if test="${getInfo.userBirthYear == '1951' }"> selected </c:if>>1951</option>
									<option value="1952" <c:if test="${getInfo.userBirthYear == '1952' }"> selected </c:if>>1952</option>
									<option value="1953" <c:if test="${getInfo.userBirthYear == '1953' }"> selected </c:if>>1953</option>
									<option value="1954" <c:if test="${getInfo.userBirthYear == '1954' }"> selected </c:if>>1954</option>
									<option value="1955" <c:if test="${getInfo.userBirthYear == '1955' }"> selected </c:if>>1955</option>
									<option value="1956" <c:if test="${getInfo.userBirthYear == '1956' }"> selected </c:if>>1956</option>
									<option value="1957" <c:if test="${getInfo.userBirthYear == '1957' }"> selected </c:if>>1957</option>
									<option value="1958" <c:if test="${getInfo.userBirthYear == '1958' }"> selected </c:if>>1958</option>
									<option value="1959" <c:if test="${getInfo.userBirthYear == '1959' }"> selected </c:if>>1959</option>
									<option value="1960" <c:if test="${getInfo.userBirthYear == '1960' }"> selected </c:if>>1960</option>
									<option value="1961" <c:if test="${getInfo.userBirthYear == '1961' }"> selected </c:if>>1961</option>
									<option value="1962" <c:if test="${getInfo.userBirthYear == '1962' }"> selected </c:if>>1962</option>
									<option value="1963" <c:if test="${getInfo.userBirthYear == '1963' }"> selected </c:if>>1963</option>
									<option value="1964" <c:if test="${getInfo.userBirthYear == '1964' }"> selected </c:if>>1964</option>
									<option value="1965" <c:if test="${getInfo.userBirthYear == '1965' }"> selected </c:if>>1965</option>
									<option value="1966" <c:if test="${getInfo.userBirthYear == '1966' }"> selected </c:if>>1966</option>
									<option value="1967" <c:if test="${getInfo.userBirthYear == '1967' }"> selected </c:if>>1967</option>
									<option value="1968" <c:if test="${getInfo.userBirthYear == '1968' }"> selected </c:if>>1968</option>
									<option value="1969" <c:if test="${getInfo.userBirthYear == '1969' }"> selected </c:if>>1969</option>
									<option value="1970" <c:if test="${getInfo.userBirthYear == '1970' }"> selected </c:if>>1970</option>
									<option value="1971" <c:if test="${getInfo.userBirthYear == '1971' }"> selected </c:if>>1971</option>
									<option value="1972" <c:if test="${getInfo.userBirthYear == '1972' }"> selected </c:if>>1972</option>
									<option value="1973" <c:if test="${getInfo.userBirthYear == '1973' }"> selected </c:if>>1973</option>
									<option value="1974" <c:if test="${getInfo.userBirthYear == '1974' }"> selected </c:if>>1974</option>
									<option value="1975" <c:if test="${getInfo.userBirthYear == '1975' }"> selected </c:if>>1975</option>
									<option value="1976" <c:if test="${getInfo.userBirthYear == '1976' }"> selected </c:if>>1976</option>
									<option value="1977" <c:if test="${getInfo.userBirthYear == '1977' }"> selected </c:if>>1977</option>
									<option value="1978" <c:if test="${getInfo.userBirthYear == '1978' }"> selected </c:if>>1978</option>
									<option value="1979" <c:if test="${getInfo.userBirthYear == '1979' }"> selected </c:if>>1979</option>
									<option value="1980" <c:if test="${getInfo.userBirthYear == '1980' }"> selected </c:if>>1980</option>
									<option value="1981" <c:if test="${getInfo.userBirthYear == '1981' }"> selected </c:if>>1981</option>
									<option value="1982" <c:if test="${getInfo.userBirthYear == '1982' }"> selected </c:if>>1982</option>
									<option value="1983" <c:if test="${getInfo.userBirthYear == '1983' }"> selected </c:if>>1983</option>
									<option value="1984" <c:if test="${getInfo.userBirthYear == '1984' }"> selected </c:if>>1984</option>
									<option value="1985" <c:if test="${getInfo.userBirthYear == '1985' }"> selected </c:if>>1985</option>
									<option value="1986" <c:if test="${getInfo.userBirthYear == '1986' }"> selected </c:if>>1986</option>
									<option value="1987" <c:if test="${getInfo.userBirthYear == '1987' }"> selected </c:if>>1987</option>
									<option value="1988" <c:if test="${getInfo.userBirthYear == '1988' }"> selected </c:if>>1988</option>
									<option value="1989" <c:if test="${getInfo.userBirthYear == '1989' }"> selected </c:if>>1989</option>
									<option value="1990" <c:if test="${getInfo.userBirthYear == '1990' }"> selected </c:if>>1990</option>
									<option value="1991" <c:if test="${getInfo.userBirthYear == '1991' }"> selected </c:if>>1991</option>
									<option value="1992" <c:if test="${getInfo.userBirthYear == '1992' }"> selected </c:if>>1992</option>
									<option value="1993" <c:if test="${getInfo.userBirthYear == '1993' }"> selected </c:if>>1993</option>
									<option value="1994" <c:if test="${getInfo.userBirthYear == '1994' }"> selected </c:if>>1994</option>
									<option value="1995" <c:if test="${getInfo.userBirthYear == '1995' }"> selected </c:if>>1995</option>
									<option value="1996" <c:if test="${getInfo.userBirthYear == '1996' }"> selected </c:if>>1996</option>
									<option value="1997" <c:if test="${getInfo.userBirthYear == '1997' }"> selected </c:if>>1997</option>
									<option value="1998" <c:if test="${getInfo.userBirthYear == '1998' }"> selected </c:if>>1998</option>
									<option value="1999" <c:if test="${getInfo.userBirthYear == '1999' }"> selected </c:if>>1999</option>
									<option value="2000" <c:if test="${getInfo.userBirthYear == '2000' }"> selected </c:if>>2000</option>
									<option value="2001" <c:if test="${getInfo.userBirthYear == '2001' }"> selected </c:if>>2001</option>
									<option value="2002" <c:if test="${getInfo.userBirthYear == '2002' }"> selected </c:if>>2002</option>
									<option value="2003" <c:if test="${getInfo.userBirthYear == '2003' }"> selected </c:if>>2003</option>
									<option value="2004" <c:if test="${getInfo.userBirthYear == '2004' }"> selected </c:if>>2004</option>
									<option value="2005" <c:if test="${getInfo.userBirthYear == '2005' }"> selected </c:if>>2005</option>
									<option value="2006" <c:if test="${getInfo.userBirthYear == '2006' }"> selected </c:if>>2006</option>
									<option value="2007" <c:if test="${getInfo.userBirthYear == '2007' }"> selected </c:if>>2007</option>
									<option value="2008" <c:if test="${getInfo.userBirthYear == '2008' }"> selected </c:if>>2008</option>
									<option value="2009" <c:if test="${getInfo.userBirthYear == '2009' }"> selected </c:if>>2009</option>
									<option value="2010" <c:if test="${getInfo.userBirthYear == '2010' }"> selected </c:if>>2010</option>
									<option value="2011" <c:if test="${getInfo.userBirthYear == '2011' }"> selected </c:if>>2011</option>
									<option value="2012" <c:if test="${getInfo.userBirthYear == '2012' }"> selected </c:if>>2012</option>
									<option value="2013" <c:if test="${getInfo.userBirthYear == '2013' }"> selected </c:if>>2013</option>
									<option value="2014" <c:if test="${getInfo.userBirthYear == '2014' }"> selected </c:if>>2014</option>
									<option value="2015" <c:if test="${getInfo.userBirthYear == '2015' }"> selected </c:if>>2015</option>
									<option value="2016" <c:if test="${getInfo.userBirthYear == '2016' }"> selected </c:if>>2016</option>
									<option value="2017" <c:if test="${getInfo.userBirthYear == '2017' }"> selected </c:if>>2017</option>
									<option value="2018" <c:if test="${getInfo.userBirthYear == '2018' }"> selected </c:if>>2018</option>
									<option value="2019" <c:if test="${getInfo.userBirthYear == '2019' }"> selected </c:if>>2019</option>
									<option value="2020" <c:if test="${getInfo.userBirthYear == '2020' }"> selected </c:if>>2020</option>
									<option value="2021" <c:if test="${getInfo.userBirthYear == '2021' }"> selected </c:if>>2021</option>
									<option value="2022" <c:if test="${getInfo.userBirthYear == '2022' }"> selected </c:if>>2022</option>
                                    </select>            
                                </div>
                                <div style="width: 100px; display: inline-block">
                                    <select class="form-control" id="birth-month" name="userBirthMonth">
                                    <option disabled selected>월</option>
                                    <option vlaue="1" <c:if test="${getInfo.userBirthMonth == '1' }"> selected </c:if> >1</option>
                                    <option vlaue="2" <c:if test="${getInfo.userBirthMonth == '2' }"> selected </c:if> >2</option>
                                    <option vlaue="3" <c:if test="${getInfo.userBirthMonth == '3' }"> selected </c:if> >3</option>
                                    <option vlaue="4" <c:if test="${getInfo.userBirthMonth == '4' }"> selected </c:if> >4</option>
                                    <option vlaue="5" <c:if test="${getInfo.userBirthMonth == '5' }"> selected </c:if> >5</option>
                                    <option vlaue="6" <c:if test="${getInfo.userBirthMonth == '6' }"> selected </c:if> >6</option>
                                    <option vlaue="7" <c:if test="${getInfo.userBirthMonth == '7' }"> selected </c:if> >7</option>
                                    <option vlaue="8" <c:if test="${getInfo.userBirthMonth == '8' }"> selected </c:if> >8</option>
                                    <option vlaue="9" <c:if test="${getInfo.userBirthMonth == '9' }"> selected </c:if> >9</option>
                                    <option vlaue="10" <c:if test="${getInfo.userBirthMonth == '10' }"> selected </c:if> >10</option>
                                    <option vlaue="11" <c:if test="${getInfo.userBirthMonth == '11' }"> selected </c:if> >11</option>
                                    <option vlaue="12" <c:if test="${getInfo.userBirthMonth == '12' }"> selected </c:if> >12</option>
                                    
                                    </select>
                                </div>
                                <div style="width: 100px; display: inline-block">
                                    <select class="form-control" id="birth-day" name="userBirthDay">
                                    <option disabled selected>일</option>
                                    <option vlaue="1" <c:if test="${getInfo.userBirthDay == '1' }"> selected </c:if> >1</option>
                                    <option vlaue="2" <c:if test="${getInfo.userBirthDay == '2' }"> selected </c:if> >2</option>
                                    <option vlaue="3" <c:if test="${getInfo.userBirthDay == '3' }"> selected </c:if> >3</option>
                                    <option vlaue="4" <c:if test="${getInfo.userBirthDay == '4' }"> selected </c:if> >4</option>
                                    <option vlaue="5" <c:if test="${getInfo.userBirthDay == '5' }"> selected </c:if> >5</option>
                                    <option vlaue="6" <c:if test="${getInfo.userBirthDay == '6' }"> selected </c:if> >6</option>
                                    <option vlaue="7" <c:if test="${getInfo.userBirthDay == '7' }"> selected </c:if> >7</option>
                                    <option vlaue="8" <c:if test="${getInfo.userBirthDay == '8' }"> selected </c:if> >8</option>
                                    <option vlaue="9" <c:if test="${getInfo.userBirthDay == '9' }"> selected </c:if> >9</option>
                                    <option vlaue="10" <c:if test="${getInfo.userBirthDay == '10' }"> selected </c:if> >10</option>
                                    <option vlaue="11" <c:if test="${getInfo.userBirthDay == '11' }"> selected </c:if> >11</option>
                                    <option vlaue="12" <c:if test="${getInfo.userBirthDay == '12' }"> selected </c:if> >12</option>
                                    <option vlaue="13" <c:if test="${getInfo.userBirthDay == '13' }"> selected </c:if> >13</option>
                                    <option vlaue="14" <c:if test="${getInfo.userBirthDay == '14' }"> selected </c:if> >14</option>
                                    <option vlaue="15" <c:if test="${getInfo.userBirthDay == '15' }"> selected </c:if> >15</option>
                                    <option vlaue="16" <c:if test="${getInfo.userBirthDay == '16' }"> selected </c:if> >16</option>
                                    <option vlaue="17" <c:if test="${getInfo.userBirthDay == '17' }"> selected </c:if> >17</option>
                                    <option vlaue="18" <c:if test="${getInfo.userBirthDay == '18' }"> selected </c:if> >18</option>
                                    <option vlaue="19" <c:if test="${getInfo.userBirthDay == '19' }"> selected </c:if> >19</option>                                  
                                    <option vlaue="20" <c:if test="${getInfo.userBirthDay == '20' }"> selected </c:if> >20</option>
                                    <option vlaue="21" <c:if test="${getInfo.userBirthDay == '21' }"> selected </c:if> >21</option>
                                    <option vlaue="22" <c:if test="${getInfo.userBirthDay == '22' }"> selected </c:if> >22</option>
                                    <option vlaue="23" <c:if test="${getInfo.userBirthDay == '23' }"> selected </c:if> >23</option>
                                    <option vlaue="24" <c:if test="${getInfo.userBirthDay == '24' }"> selected </c:if> >24</option>
                                    <option vlaue="25" <c:if test="${getInfo.userBirthDay == '25' }"> selected </c:if> >25</option>
                                    <option vlaue="26" <c:if test="${getInfo.userBirthDay == '26' }"> selected </c:if> >26</option>
                                    <option vlaue="27" <c:if test="${getInfo.userBirthDay == '27' }"> selected </c:if> >27</option>
                                    <option vlaue="28" <c:if test="${getInfo.userBirthDay == '28' }"> selected </c:if> >28</option>
                                    <option vlaue="29" <c:if test="${getInfo.userBirthDay == '29' }"> selected </c:if> >29</option>                                  
                                    <option vlaue="30" <c:if test="${getInfo.userBirthDay == '30' }"> selected </c:if> >30</option>
                                    <option vlaue="31" <c:if test="${getInfo.userBirthDay == '31' }"> selected </c:if> >31</option>                                 
                                    </select>                                                                         
                                </div>
                              </div>

                            <div class="form-group">
                                <label for="exampleInputEmail">Email</label>
                                <input type="email" name="userEmail" class="form-control" id="exampleInputEmail" value="${getInfo.userEmail }" >
                              </div>
                            
                        
                        <div class="form-group clearfix">
                            <label for="hp">전화번호</label><br>

                              <select id="userPhone1" name="userPhone1" class="form-control hp_con" style="width: 80px; display:inline-block" disabled>
                                <option <c:if test="${getInfo.userPhone1 == '010' }"> selected </c:if>>010</option>
                                <option <c:if test="${getInfo.userPhone1 == '011' }"> selected </c:if>>011</option>
                                <option <c:if test="${getInfo.userPhone1 == '017' }"> selected </c:if>>017</option>
                              </select> 
                              
                              <div class="hp_con hp_con2">-</div>

                              <div class="input-group hp_con" style="display: inline-block;" >
                                    <input name="userPhone2" type="text" id="userPhone2" class="form-control" value="${getInfo.userPhone2 }" readonly>
                              </div>

                              <div class="hp_con hp_con2">-</div>

                              <div class="input-group hp_con" style="display: inline-block;" >
                                <input name="userPhone3" type="text" id="userPhone3" class="form-control" value="${getInfo.userPhone3}" readonly>
                             </div>
                             <div class="input-group hp_con" style="display: inline-block;" >
								<button type="button" style="width:60px; height: 25px" id="phoneNumChange">변경하기</button>
                             </div>
                             <div id="phChangeOn" style="display: none;">
	                             <div class="input-group hp_con" style="display: inline-block;">
		                        <button type="button" class="phoneChk btn btn-primary" id="phoneChk">인증번호 보내기</button> <br>
								</div><br><br>
								<div>
								<input id="phone2" type="text" name="phone2" title="인증번호 입력" disabled required/>
								<button type="button" id="phoneChk2" class="doubleChk" disabled>본인인증</button><br>
								<span class="point successPhoneChk">※ 휴대폰 번호 입력후 인증번호 보내기를 해주십시오.</span>
								<input type="hidden" id="phoneDoubleChk"/>
								</div>
							</div>
                        </div>
                        <div class="form-group">
                            <label for="addr-num">주소</label>
                            <div class="input-group">
                                <input type="text" name="addrZipNum" id="addrZipNum" class="form-control" value="${getInfo.addrZipNum}"" readonly>
                                <div class="input-group-addon">
                                    <button type="button" class="btn btn-primary" onclick="searchAddress()">주소찾기</button>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <input type="text" name="addrBasic" class="form-control" id="addrBasic" value="${getInfo.addrBasic}" readonly>
                        </div>
                        <div class="form-group">
                            <input name="addrDetail" id="addrDetail" type="text" class="form-control" value="${getInfo.addrDetail}">
                        </div>


                        <br>

                        <!--회원 가입 버튼 -->
                       <div class="form-group">
                            <button type="button" class="btn btn-lg btn-insert btn-block" id="updateBtn" style="margin-top: 20px">수정</button>
                        </div>
                       


                    </form>

                </div>
				
                    <div id ="contents2" class="content">
                    	<div class="titlebox" style="width: 400px">
                       	 기업 회원 정보 수정
                  	   </div>
                        <form action="<c:url value='/user/userUpdate2' />" method="post" id="updateForm2">
                        <div class="form-group">
                        	<em>기업 정보 수정을 원하실 경우, 관리자에게 문의하세요!</em><br>
                        	<label>기업 로고 이미지</label>
                        	<div class="col-md-12 form-group picture">
                           	<img id="fileImg">
                       		 </div>
                       		 <br>
                            <label>기업형태</label>
                            <select class="form-control" name="corType" style="background-color: rgb(245, 245, 245);">
                                <option disabled="disabled" <c:if test="${getInfo.corType == '대기업' }"> selected </c:if> value="대기업">대기업</option>
                                <option disabled="disabled" <c:if test="${getInfo.corType == '대기업 계열사자회사' }"> selected </c:if> value="대기업 계열사자회사">대기업 계열사‧자회사</option>
                                <option disabled="disabled" <c:if test="${getInfo.corType == '중소기업(300명 이하)' }"> selected </c:if> value="중소기업(300명 이하)">중소기업(300명 이하)</option>
                                <option disabled="disabled" <c:if test="${getInfo.corType == '중견기업(300명 이하)' }"> selected </c:if> value="중견기업(300명 이하)">중견기업(300명 이하)</option>
                                <option disabled="disabled" <c:if test="${getInfo.corType == '벤처기업' }"> selected </c:if> value="벤처기업">벤처기업</option>
                                <option disabled="disabled" <c:if test="${getInfo.corType == '외국계(외국 투자기업)' }"> selected </c:if> value="외국계(외국 투자기업)">외국계(외국 투자기업)</option>
                                <option disabled="disabled" <c:if test="${getInfo.corType == '외국계(외국 법인기업)' }"> selected </c:if> value="외국계(외국 법인기업)">외국계(외국 법인기업)</option>
                                <option disabled="disabled" <c:if test="${getInfo.corType == '국내 공공기관공기업' }"> selected </c:if> value="국내 공공기관공기업">국내 공공기관‧공기업</option>
                                <option disabled="disabled" <c:if test="${getInfo.corType == '비영리단체협회교육재단' }"> selected </c:if> value="비영리단체협회교육재단">비영리단체‧협회‧교육재단</option>
                                <option disabled="disabled" <c:if test="${getInfo.corType == '외국 기관비영리기구단체' }"> selected </c:if> value="외국 기관비영리기구단체">외국 기관‧비영리기구‧단체</option>
                            </select>
                         </div>
                        <div class="form-group">
                            <label>사업자등록번호</label>
                            <input style="background-color: rgb(245, 245, 245);" type="text" class="form-control"  name="businessNum" value="${getInfo.businessNum}" readonly>
                        </div>
                        <div class="form-group">
                            <label>회사명</label>
                            <input style="background-color: rgb(245, 245, 245);" type="text" name="compName" class="form-control" value="${getInfo.compName}" readonly>
                        </div>
                        <div class="form-group">
                            <label for="name">대표자명</label>
                            <div class="input-group">
                                <input style="background-color: rgb(245, 245, 245);" type="text" name="ceo" class="form-control" value="${getInfo.ceo}" readonly>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="addr-num">회사주소</label>
                            <div class="input-group">
                                <input style="background-color: rgb(245, 245, 245);" name="comAddrZipNum" type="text" id="comAddrZipNum" class="form-control" placeholder="우편번호" value="${getInfo.comAddrZipNum}" readonly>
<!--                                 <div class="input-group-addon">
                                    <button type="button" class="btn btn-primary" id="coAddress" onclick="searchAddress()">우편번호검색</button>
                                </div> -->
                            </div>
                        </div>
                        <div class="form-group">
                            <input style="background-color: rgb(245, 245, 245);" value="${getInfo.comAddrBasic}" name="comAddrBasic" id="comAddrBasic" type="text" class="form-control" readonly>
                        </div>
                        <div class="form-group">
                            <input style="background-color: rgb(245, 245, 245);" name="comAddrDetail" value="${getInfo.comAddrDetail}" id="comAddrDetail" type="text" class="form-control" readonly>
                        </div>  <br><br>

                        <!--인사담당자 정보 -->
                        <div class="form-group">
                            <label class="title">인사담당자 정보</label>
                         </div>    
                        <div class="form-group">
                            <label for="id">아이디</label>
                            <div class="input-group">
                                <input style="background-color: rgb(245, 245, 245);" type="text" name="userId" id="id" class="form-control" value="${getInfo.userId }" readonly>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="name">담당자명</label>
                            <div class="input-group">
                                <input type="text" class="form-control" value="${getInfo.userName}" name="userName">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="hp">전화번호</label><br>

                              <select id="userPhone11" class="form-control hp_con" style="width: 80px; display:inline-block" name="userPhone1" disabled>
                                <option <c:if test="${getInfo.userPhone1 == '010' }"> selected </c:if>>010</option>
                                <option <c:if test="${getInfo.userPhone1 == '011' }"> selected </c:if>>011</option>
                                <option <c:if test="${getInfo.userPhone1 == '017' }"> selected </c:if>>017</option>
                              </select> 
                              <div class="hp_con hp_con2">-</div>
                              <div class="input-group hp_con" style="display: inline-block;" >
                                    <input id="userPhone22" type="text" class="form-control" name="userPhone2" value="${getInfo.userPhone2}" readonly>
                              </div> 
                              <div class="hp_con hp_con2">-</div>
                              <div class="input-group hp_con" style="display: inline-block;" >
                                <input id="userPhone33" type="text" class="form-control" name="userPhone3" value="${getInfo.userPhone3}" readonly>
                             </div>
                             <div class="input-group hp_con" style="display: inline-block;" >
								<button type="button" style="width:60px; height: 25px" id="phoneNumChange2">변경하기</button>
                             </div>
                             <div id="phChangeOn2" style="display: none;">
	                             <div class="input-group hp_con" style="display: inline-block;">
		                        <button type="button" class="phoneChk btn btn-primary" id="phoneChk3">인증번호 보내기</button> <br>
								</div><br><br>
								<div>
								<input id="phone22" type="text" name="phone2" title="인증번호 입력" disabled required/>
								<button type="button" id="phoneChk22" class="doubleChk" disabled>본인인증</button><br>
								<span class="point successPhoneChk">※ 휴대폰 번호 입력후 인증번호 보내기를 해주십시오.</span>
								<input type="hidden" id="phoneDoubleChk2"/>
								</div>
							</div>
                        </div>
                        <div class="form-group comp_email">
                            <label for="exampleInputEmail2">Email</label>
                            <input type="email" class="form-control" value="${getInfo.userEmail}" name="userEmail">
                          </div>

                        <br>

                        <div class="form-group" style="margin-top: 100px">
                            <button type="button" class="btn btn-lg btn-insert btn-block" id ="updateBtn2">수정</button>
                        </div>

                    </form>
                </div>
                
                </div>
            </div>
            
        </div>
    </section>
    
    <div class="top">
        <a href="#">TOP</a> 
    </div>


    <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    
<script>


$(document).ready(
		function() {
			const fileLoca = '${getInfo.fileLoca}';
			const fileName = '${getInfo.fileName}';
			const src = '<c:url value="/resume/display?fileLoca='
					+ fileLoca
					+ '&fileName='
					+ fileName
					+ '" />'

			console.log(src);
			$('#fileImg').attr('src', src);


		});




	const idntNo = ${login.idntNo};
	//const fileLoca = "${getInfo.fileLoca}";
	//const fileName = "${getInfo.fileName}" ;
	//const path = "../img/cor_img"+"/"+fileLoca+"/"+ fileName
	
	
 	//$("#fileImg").attr("src", path);

 
	$(function(){
		if(idntNo=='1'){
	        $('#contents1').addClass('on'); 

		}
		else if(idntNo=='2'){
			$("#contents2").addClass('on');
		}		

	});	


	$('#updateBtn').click(function() {

		 if($('input[name=userName]').val() === '') {
			alert('이름은 필수 입력입니다.');
			$('input[name=userName]').focus();
		}else if($("#phoneDoubleChk").val() == 'false'){
			alert('휴대폰 본인 인증을 진행해주세요.');
			return;
		}else{
			if(confirm('이대로 수정을 진행할까요?')) {
				$("select[name=userPhone1]").removeAttr('disabled');
				$('#updateForm').submit();
			} else {
				return;
			}
		}
	}); //수정버튼 이벤트 끝.
	
	$('#updateBtn2').click(function() {

		 if($('input[name=userName]').val() === '') {
			alert('이름은 필수 입력입니다.');
			$('input[name=userName]').focus();	 
		} else if($("#phoneDoubleChk2").val() == 'false'){
			alert('휴대폰 본인 인증을 진행해주세요.');
			return;	 
		} else {
			
			if(confirm('이대로 수정을 진행할까요?')) {
				$("select[name=userPhone1]").removeAttr('disabled');
				$('#updateForm2').submit();
			} else {
				return;
			}
		}
	});
 
    
    const msg = '${msg}';
	if(msg !== '') {
    	alert(msg);    		
	}
	
	function manageAlert(){
		alert('기업 정보 수정을 원하실 경우, 관리자에게 문의하세요!');
	}

    
	//다음 주소 api 사용해 보기
    function searchAddress() {
		
		console.log( $('#businessNum').val());
		
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }	                

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                
                if( $('#contents1').hasClass("on")){
	                document.getElementById('addrZipNum').value = data.zonecode;
	                document.getElementById("addrBasic").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("addrDetail").focus();
                } else {
                	document.getElementById('comAddrZipNum').value = data.zonecode;
	                document.getElementById("comAddrBasic").value = addr;
	                document.getElementById("comAddrDetail").focus();
                }
            }
        }).open();
    }
	
    $('#phoneNumChange').click(function() {
    	$("select[name=userPhone1]").removeAttr('disabled');
		$("#userPhone2").attr("readonly",false);
		$("#userPhone3").attr("readonly",false);
		$(this).hide();
		document.getElementById("phChangeOn").style.display="block";	
		$("#phoneDoubleChk").val("false")
    	
    });
    
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
	
	// 기업 휴대폰 인증 관련
	 $('#phoneNumChange2').click(function() {
    	$("select[name=userPhone1]").removeAttr('disabled');
		$("#userPhone22").attr("readonly",false);
		$("#userPhone33").attr("readonly",false);
		$(this).hide();
		document.getElementById("phChangeOn2").style.display="block";	
		$("#phoneDoubleChk2").val("false")
    	
    });
	
	$('#phoneChk3').click(function() {
		var phone1 = $("#userPhone11").val();
		var phone2 = $("#userPhone22").val();
		var phone3 = $("#userPhone33").val();
		
		var regex2 = /^[0-9]{3,4}$/;
	  	var regex3 = /^[0-9]{4}$/;

		 if(!(regex2.test(phone2))) {
		    	
			 alert('전화번호를 다시 확인해 주세요.');
			 $('#userPhone22').focus();

	     } else if(!(regex3.test(phone3))){
	    	 alert('전화번호를 다시 확인해 주세요.');
			 $('#userPhone33').focus();
	    	 
	     } else {
	    	 
				const phone = phone1 + phone2 + phone3;
				
		 		
				$.ajax({
					type: 'post',
					url: '<c:url value="/user/phoneCheck" />',
					data: phone,
					contentType: 'application/json',
					success: function(data) {
		        		$("#phone22").attr("disabled",false);
		        		$("#phoneChk22").attr("disabled",false);
		        		$(".successPhoneChk").text("인증번호를 입력한 뒤 본인인증을 눌러주십시오.");
		        		$(".successPhoneChk").css("color","blue");
		        	 	$("#userPhone11").attr("disabled",true);
		        		$("#userPhone22").attr("readonly",true);
		        		$("#userPhone33").attr("readonly",true);
						code2 = data;
					},
					error: function() {
						alert('서버 에러입니다. 관리자에게 문의하세요.');
					}
				}); 
	    	 
	     }
				
	}); 

	
	//휴대폰 인증번호 대조
	$("#phoneChk22").click(function(){
		if($("#phone22").val() == code2){
			$(".successPhoneChk").text("인증번호가 일치합니다.");
			$(".successPhoneChk").css("color","green");
			$("#phoneDoubleChk2").val("true");
			$("#phone22").attr("disabled",true);
		}else{
			$(".successPhoneChk").text("인증번호가 일치하지 않습니다.");
			$(".successPhoneChk").css("color","red");
			$("#phoneDoubleChk2").val("false");
			$(this).attr("autofocus",true);
		}
	});

    
    /* 엔터키 submit 막기 */
    document.addEventListener('keydown', function(event) {
    	  if (event.keyCode === 13) {
    	    event.preventDefault();
    	  };
    	}, true);
</script>

<%@ include file="../include/footer.jsp"%>
    
</body>
</html>

