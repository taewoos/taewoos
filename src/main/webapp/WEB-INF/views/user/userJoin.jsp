<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<link href="${pageContext.request.contextPath }/resources/css/join.css"
   rel="stylesheet">

<body>
   <section>
      <div class="join">
         <div class="row">
            <div class="col-lg-6 col-md-9 col-sm-12 join-form">
               <div class="titlebox">회원가입</div>
               <div class="tab">
                  <div class="choice">
                     <a href="#" class="panel active">개인회원</a> <a href="#"
                        class="panel">기업회원</a>
                  </div>
               </div>

               <div id="contents1" class="content on">
                  <form action="<c:url value='/user/join' />" method="post"
                     id="joinForm">
                     <input type="radio" style="display: none" name="idntNo" value="1"
                        checked>
                     <div id="ind-join" class="form-group">
                        <label for="id">* 아이디</label>
                        <div class="input-group">
                           <input type="text" name="userId" id="userId"
                              class="form-control" placeholder="아이디(영문 포함 4~12자 이상)">
                           <div class="input-group-addon">
                              <button type="button" class="btn btn-primary" id="idCheckBtn">아이디중복체크</button>
                           </div>
                        </div>
                        <span id="msgId"></span>
                        <!-- 아이디 중복 여부 메세지 공간 -->
                     </div>
                     <div class="form-group">
                        <label for="password">* 비밀번호</label> <input type="password"
                           name="userPw" id="userPw" class="form-control" maxlength="16"
                           placeholder="비밀번호 (영 대/소문자, 숫자조합 8~16자)"> <span
                           id="msgPw"></span>
                        <!-- 비밀번호 유효성 메세지 공간 -->
                     </div>
                     <div class="form-group">
                        <label for="pw-confirm">* 비밀번호</label> <input type="password"
                           id="pwConfirm" class="form-control" maxlength="16"
                           placeholder="비밀번호를 확인해 주세요."> <span id="msgPw-c"></span>
                        <!-- 비밀번호 확인 여부 메세지 공간 -->
                     </div>

                     <div class="form-group">
                        <label for="name">* 이름</label>
                        <div class="input-group">
                           <input type="text" name="userName" id="userName"
                              class="form-control" placeholder="ex)홍길동">
                        </div>
                     </div>
                     <div class="form-group">
                        <label for="gender" style="display: block">성별</label>
                        <div class="form-check form-check-inline"
                           style="display: inline-block">
                           <input class="form-check-input" type="radio" name="gender"
                              value="1"> <label class="form-check-label"
                              for="inlineRadio1" style="font-weight: lighter;">여자</label>
                        </div>
                        <div class="form-check form-check-inline"
                           style="display: inline-block">
                           <input class="form-check-input" type="radio" name="gender"
                              value="2" style="margin-left: 20px"> <label
                              class="form-check-label" for="inlineRadio2"
                              style="font-weight: lighter;">남자</label>
                        </div>
                     </div>
                     <div class="form-group" id="info__birth">
                        <label for="birth">생년월일</label><br>
                        <div style="width: 180px; display: inline-block">
                           <select class="form-control" id="birth-year"
                              name="userBirthYear">
                              <option disabled selected>출생 연도</option>
                           </select>
                        </div>
                        <div style="width: 100px; display: inline-block">
                           <select class="form-control" id="birth-month"
                              name="userBirthMonth">
                              <option disabled selected>월</option>
                           </select>
                        </div>
                        <div style="width: 100px; display: inline-block">
                           <select class="form-control" id="birth-day" name="userBirthDay">
                              <option disabled selected>일</option>
                           </select>
                        </div>
                     </div>

                     <div class="form-group">
                        <label for="exampleInputEmail">Email</label> <input type="email"
                           name="userEmail" class="form-control" id="exampleInputEmail"
                           placeholder="jane.doe@example.com">
                     </div>


                     <div class="form-group clearfix">
                        <label for="hp">* 전화번호</label><br> 
                        <select id="userPhone1" name="userPhone1" class="form-control hp_con"
                           style="width: 80px; display: inline-block">
                           <option>010</option>
                           <option>011</option>
                           <option>017</option>
                        </select>

                        <div class="hp_con hp_con2">-</div>

                        <div class="input-group hp_con" style="display: inline-block;">
                           <input name="userPhone2" type="text" id="userPhone2"
                              class="form-control">
                        </div>

                        <div class="hp_con hp_con2">-</div>

                        <div class="input-group hp_con" style="display: inline-block;">
                           <input name="userPhone3" type="text" id="userPhone3"
                              class="form-control">
                        </div>
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
	                 
                     <div class="form-group">
                        <label for="addr-num">주소</label>
                        <div class="input-group">
                           <input type="text" name="addrZipNum" id="addrZipNum"
                              class="form-control" placeholder="우편번호" readonly>
                           <div class="input-group-addon">
                              <button type="button" class="btn btn-primary"
                                 onclick="searchAddress()">주소찾기</button>
                           </div>
                        </div>
                     </div>
                     <div class="form-group">
                        <input type="text" name="addrBasic" class="form-control"
                           id="addrBasic" placeholder="기본주소" readonly>
                     </div>
                     <div class="form-group">
                        <input name="addrDetail" id="addrDetail" type="text"
                           class="form-control" placeholder="상세주소">
                     </div>


                     <!-- 이용약관 -->
                     <div class="form-inline">
                        <br> <label for="">* 이용약관 동의</label><br> <br>

                        <div class="agree">
                           <div class="agree1">
                              <div class="term">
                                 <label><strong>[필수]</strong> 만 15세 이상입니다</label>
                              </div>
                              <div class="checkbox">
                                 <label> <input type="checkbox" id="agree1">
                                 </label>
                              </div>
                           </div>
                           <div class="agree1">
                              <div id="term1" class="term1">
                                 <label><strong>[필수]</strong> 이용약관 동의</label>
                              </div>
                              <div class="checkbox">
                                 <label> <input type="checkbox" id="agree2">
                                 </label>
                              </div>

                           </div>
                           <div id="expl1" class="up">
                              제 1 조 (목적) <br>본 약관은 잡코리아(이하 "회사")가 운영하는 "서비스"를 이용함에 있어
                              "회사"와 회원간의 이용 조건 및 제반 절차, 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로
                              한다. <br>제 2 조 (용어의 정의) <br>이 약관에서 사용하는 용어의 정의는 아래와
                              같다. <br> <br>① "사이트"라 함은 회사가 서비스를 "회원"에게 제공하기 위하여
                              컴퓨터 등 정보통신설비를 이용하여 설정한 가상의 영업장 또는 회사가 운영하는 웹사이트, 모바일웹, 앱 등의
                              서비스를 제공하는 모든 매체를 통칭하며, 통합된 하나의 회원 계정(아이디 및 비밀번호)을 이용하여 서비스를
                              제공받을 수 있는 아래의 사이트를 말한다. <br>- www.jobkorea.co.kr <br>-
                              www.albamon.com <br>- www.campusmon.com <br>-
                              m.jobkorea.co.kr <br>- m.albamon.com <br>-
                              learning.jobkorea.co.kr <br>② "서비스"라 함은 회사가 운영하는 사이트를 통해
                              개인이 구직, 교육 등의 목적으로 등록하는 자료를 DB화하여 각각의 목적에 맞게 분류 가공, 집계하여 정보를
                              제공하는 서비스와 사이트에서 제공하는 모든 부대 서비스를 말한다. <br>③ "회원"이라 함은
                              "회사"가 제공하는 서비스를 이용하거나 이용하려는 자로, 페이스북 등 외부 서비스 연동을 통해 "회사"와
                              이용계약을 체결한자 또는 체결하려는 자를 포함하며, 아이디와 비밀번호의 설정 등 회원가입 절차를 거쳐
                              회원가입확인 이메일 등을 통해 회사로부터 회원으로 인정받은 "개인회원"을 말한다. <br>④
                              "아이디"라 함은 회원가입 시 회원의 식별과 회원의 서비스 이용을 위하여 "회원"이 선정하고 "회사"가 부여하는
                              문자와 숫자의 조합을 말한다. <br>⑤ "비밀번호"라 함은 위 제4항에 따라 회원이 회원가입시
                              아이디를 설정하면서 아이디를 부여받은 자와 동일인임을 확인하고 "회원"의 권익을 보호하기 위하여 "회원"이
                              선정한 문자와 숫자의 조합을 말한다. <br>⑥ "비회원"이라 함은 회원가입 절차를 거치지 않고
                              "회사"가 제공하는 서비스를 이용하거나 하려는 자를 말한다. <br>제 3 조 (약관의 명시와 개정)
                              <br>① "회사"는 이 약관의 내용과 상호, 영업소 소재지, 대표자의 성명, 사업자등록번호, 연락처
                              등을 "회원"이 알 수 있도록 초기 화면에 게시하거나 기타의 방법으로 "회원"에게 공지해야 한다. <br>②
                              "회사"는 약관의 규제에 관한 법률, 전기통신기본법, 전기통신사업법, 정보통신망 이용촉진 및 정보보호 등에 관한
                              법률 등 관련법을 위반하지 않는 범위에서 이 약관을 개정할 수 있다. <br>③ "회사"가 약관을
                              개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 그 개정약관의 적용일자 7일 전부터 적용일자
                              전일까지 공지한다. 단 "회원"의 권리, 의무에 중대한 영향을 주는 변경의 경우에는 적용일자 30일 전부터
                              공지하도록 한다. <br>④ "회원"은 변경된 약관에 대해 거부할 권리가 있다. "회원"은 변경된
                              약관이 공지된 지 15일 이내에 거부의사를 표명할 수 있다. "회원"이 거부하는 경우 본 서비스 제공자인
                              "회사"는 15일의 기간을 정하여 "회원"에게 사전 통지 후 당해 "회원"과의 계약을 해지할 수 있다. 만약,
                              "회원"이 거부의사를 표시하지 않거나, 전항에 따라 시행일 이후에 "서비스"를 이용하는 경우에는 동의한 것으로
                              간주한다. <br>제 4 조 (약관의 해석) <br>① 이 약관에서 규정하지 않은 사항에
                              관해서는 약관의 규제에 관한 법률, 전기통신기본법, 전기통신사업법, 정보통신망 이용촉진 및 정보보호 등에 관한
                              법률 등의 관계법령에 따른다. <br>② 각 사이트 및 서비스 이용약관이 있는 경우에는 서비스
                              이용약관이 우선한다. <br>③ "회원"이 "회사"와 개별 계약을 체결하여 서비스를 이용하는 경우에는
                              개별 계약이 우선한다. <br>제 5 조 (이용계약의 성립) <br>① "회사"의 서비스
                              이용계약(이하 "이용계약")은 서비스를 이용하고자 하는 자가 본 약관과 개인정보처리방침을 읽고 "동의" 또는
                              "확인" 버튼을 누른 경우 본 약관에 동의한 것으로 간주한다. <br>② 제1항 신청에 있어 "회사"는
                              "회원"의 종류에 따라 전문기관을 통한 실명확인 및 본인인증을 요청할 수 있으며, "회원"은 본인인증에 필요한
                              이름, 생년월일, 연락처 등을 제공하여야 한다. <br>③ "회원"이 이용신청(회원가입 신청) 작성
                              후에 "회사"가 웹상의 안내 및 전자메일로 "회원"에게 통지함으로써 이용계약이 성립된다. <br>④
                              페이스북 등 외부 서비스와의 연동을 통해 이용계약을 신청할 경우, 본 약관과 개인정보처리방침, 서비스 제공을
                              위해 "회사"가 "회원"의 외부 서비스 계정 정보 접근 및 활용에 "동의" 또는 "확인" 버튼을 누르면
                              "회사"가 웹상의 안내 및 전자메일로 "회원"에게 통지함으로써 이용계약이 성립된다. <br>제 6 조
                              (이용신청의 승낙과 제한) <br>① "회사"는 전조의 규정에 의한 이용신청 고객에 대하여 업무수행상
                              또는 기술상 지장이 없는 경우에는 원칙적으로 접수순서에 따라 서비스 이용을 승낙한다. <br>②
                              "회사"는 아래사항에 해당하는 경우에 대해서는 서비스 이용신청을 승낙하지 아니한다. <br>1. 실명이
                              아니거나 타인의 명의를 이용하여 신청한 경우 <br>2. 이용계약 신청서의 내용을 허위로 기재하거나
                              "회사"가 제시하는 내용을 기재하지 않은 경우 <br>3. 만 15세 미만의 아동이 신청한 경우.
                              다만, 만 13세 이상 만 15세 미만의 아동으로서 노동부장관 발급의 취직인허증이 있는 경우에는 그러하지
                              아니한다. <br>4. 이용자의 귀책사유로 인하여 승인이 불가능하거나 기타 규정한 제반 사항을 위반하여
                              신청하는 경우 <br>③ "회사"는 아래사항에 해당하는 경우에는 그 신청에 대하여 승낙제한 사유가
                              해소될 때까지 승낙을 유보할 수 있다. <br>1. "회사"가 설비의 여유가 없는 경우 <br>2.
                              "회사"의 기술상 지장이 있는 경우 <br>3. 기타 "회사"의 귀책사유로 이용승낙이 곤란한 경우 <br>제
                              7 조 (서비스의 내용) <br>① "회사"는 제2조 2항의 서비스를 제공할 수 있으며 그 내용은 다음
                              각 호와 같다. <br>1. 이력서 등록 및 인재정보 게재 서비스 <br>2. 온라인 입사지원
                              서비스 <br>3. 헤드헌팅/아웃소싱 서비스 <br>4. 구인/구직과 관련된 제반 서비스 <br>5.
                              기업리뷰 등록과 조회 서비스 <br>6. 기업정보 조회와 관련된 제반 서비스 <br>7.
                              교육과 관련된 제반 서비스 <br>8. 이용자간의 교류와 소통에 관련한 서비스 <br>9.
                              자료거래에 관련한 서비스 <br>10. 기타"회사"가 추가 개발, 편집, 재구성하거나 제휴계약 등을
                              통해 “회원”에게 제공하는 일체의 서비스 <br>② "회사"는 필요한 경우 서비스의 내용을 추가 또는
                              변경할 수 있다. 단, 이 경우 "회사"는 추가 또는 변경내용을 "회원"에게 공지해야 한다. <br>제
                              8 조 (회원, 이력서 및 게시물 등의 정보) <br>① "회원"의 이력서는 개인이 회원가입 또는
                              이력서 작성 및 수정시 희망한 형태로 등록 및 제공된다. <br>② "회사"는 "회원"이 이력서의
                              인재정보 등록/미등록 지정, 이력서상의 연락처 제공 여부를 자유롭게 선택할 수 있도록 하여야 한다. <br>③
                              "회사"는 "회원"이 이력서의 인재정보 등록 및 제공을 희망했을 경우, 기업회원, 서치펌회원의 이력서 열람 및
                              각종 포지션 제안에 동의한 것으로 간주하며 "회사"는 기업회원, 서치펌회원에게 유료로 이력서 열람 서비스를
                              제공할 수 있다. 다만, 연락처 각 항목이 비공개로 지정된 경우 해당 항목별 연락처를 노출할 수 없다. <br>④
                              "회사"는 안정적인 서비스를 제공하기 위해 테스트 및 모니터링 용도로 "사이트" 운영자가 이력서 및 게시물 등의
                              정보를 열람하도록 할 수 있다. <br>⑤ "회사"는 "회원"의 선택에 의하여 등록 및 제공되는 이력서
                              및 게시물 등의 정보를 기준으로 구직활동에 보다 유익한 서비스를 제공하기 위하여 이를 개발, 편집, 재구성한
                              통계 자료로 활용 할 수 있다. <br>제 9 조 (제휴를 통한 서비스) <br>① "회사"는
                              제휴 관계를 체결한 여타 인터넷 웹 사이트 및 채용박람회 또는 신문, 잡지 등의 오프라인 매체를 통해 사이트에
                              등록한 "회원"의 이력서 정보가 열람될 수 있도록 서비스를 제공할 수 있다. 단, 제휴 서비스를 통해 노출되는
                              이력서의 연락처 정보는 “회원”이 이력서 등록 시 선택한 연락처 공개 여부에 따라 제공된다. <br>②
                              "회사"는 제휴를 통해 타 사이트 및 매체에 등록될 수 있음을 고지해야 하며, 제휴 사이트 목록을 사이트내에서
                              상시 열람할 수 있도록 해야 한다. 단, 등록의 형태가 "회사"가 직접 구축하지 않고, 제휴사가 xml 또는
                              api 형태로 "회사"로부터 제공 받아 구축한 매체 목록은 본 약관외 별도의 제휴리스트에서 열람할 수 있도록
                              한다. <br>③ "회사"는 "회원"이 공개를 요청한 이력서에 한해 제휴를 맺은 타 사이트에 이력서
                              정보를 제공한다. (본 약관 시행일 현재에는 제휴를 통한 타 사이트 및 매체는 없다.) <br>④ 본
                              조 제 3항 제휴를 통한 사이트의 변동사항 발생 시 공지사항을 통해 고지 후 진행 한다. <br>제
                              10 조 (서비스의 요금) <br>① "회원" 가입과 이력서 등록은 무료이다. 다만 기업회원 또는
                              사이트에 방문한 기업체에게 자신의 이력서 정보를 보다 효과적으로 노출시키기 위한 유료서비스 및 인성, 적성 검사
                              등 회원 가입 목적 외 기타 서비스를 이용하기 위한 별도의 서비스는 유료로 제공될 수 있다. <br>②
                              "회사"는 유료서비스를 제공할 경우 사이트에 요금에 대해서 공지를 하여야 한다. <br>③ "회사"는
                              유료서비스 이용금액을 서비스의 종류 및 기간에 따라 "회사"가 예고 없이 변경할 수 있다. 다만, 변경 이전에
                              적용 또는 계약한 금액은 소급하여 적용하지 아니한다. <br>제 11 조 (서비스 요금의 환불) <br>①
                              "회사"는 다음 각 호에 해당하는 경우 이용요금을 환불한다. 단, 각 당사자의 귀책사유에 따라 환불 조건이
                              달라질 수 있다. <br>1. 유료서비스 이용이 개시되지 않은 경우 <br>2. 네트워크 또는
                              시스템 장애로 서비스 이용이 불가능한 경우 <br>3. 유료서비스 신청 후 “회원”의 사정에 의해
                              서비스가 취소될 경우 <br>② "회사"가 본 약관 제19조에 따라 가입해지/서비스중지/자료삭제를 취한
                              경우, “회사”는 “회원”에게 이용요금을 환불하지 않으며, 별도로 “회원”에게 손해배상을 청구할 수 있다. <br>③
                              이용료를 환불받고자 하는 회원은 고객센터로 환불을 요청해야 한다. <br>④ "회사"는 환불 요건에
                              부합하는 것으로 판단될 경우, 각 서비스 환불 안내에 따라 유료이용 계약 당시 상품의 정가 기준으로 서비스
                              제공된 기간에 해당하는 요금을 차감한 잔액을 환불한다. <br>제 12 조 (서비스 이용시간) <br>①
                              "회사"는 특별한 사유가 없는 한 연중무휴, 1일 24시간 서비스를 제공한다. 다만, "회사"는 서비스의 종류나
                              성질에 따라 제공하는 서비스 중 일부에 대해서는 별도로 이용시간을 정할 수 있으며, 이 경우 "회사"는 그
                              이용시간을 사전에 "회원"에게 공지 또는 통지하여야 한다. <br>② "회사"는 자료의 가공과 갱신을
                              위한 시스템 작업시간, 장애해결을 위한 보수작업 시간, 정기 PM작업, 시스템 교체작업, 회선 장애 등이 발생한
                              경우 일시적으로 서비스를 중단할 수 있으며 계획된 작업의 경우 공지란에 서비스 중단 시간과 작업 내용을 알려야
                              한다. 다만, "회사"가 사전에 통지할 수 없는 부득이한 사유가 있는 경우 사후에 통지할 수 있다. <br>제
                              13 조 (서비스 제공의 중지) <br>① "회사"는 다음 각 호에 해당하는 경우 서비스의 제공을
                              중지할 수 있다. <br>1. 설비의 보수 등 "회사"의 필요에 의해 사전에 "회원"들에게 통지한 경우
                              <br>2. 기간통신사업자가 전기통신서비스 제공을 중지하는 경우 <br>3. 기타 불가항력적인
                              사유에 의해 서비스 제공이 객관적으로 불가능한 경우 <br>② 전항의 경우, "회사"는 기간의 정함이
                              있는 유료서비스 이용자들에게는 그 이용기간을 연장하거나 환불 등의 방법으로 손실을 보상하여야 한다. <br>제
                              14 조 (정보의 제공 및 광고의 게재) <br>① "회사"는 "회원"에게 서비스 이용에 필요가 있다고
                              인정되거나 서비스 개선 및 회원대상의 서비스 소개 등의 목적으로 하는 각종 정보에 대해서 전자우편이나 서신우편을
                              이용한 방법으로 제공할 수 있다. <br>② "회사"는 제공하는 서비스와 관련되는 정보 또는 광고를
                              서비스 화면, 홈페이지, 전자우편 등에 게재할 수 있으며, 광고가 게재된 전자우편을 수신한 "회원"은 수신거절을
                              "회사"에게 할 수 있다. <br>③ "회사"는 서비스상에 게재되어 있거나 본 서비스를 통한 광고주의
                              판촉활동에 "회원"이 참여하거나 교신 또는 거래를 함으로써 발생하는 모든 손실과 손해에 대해 책임을 지지
                              않는다. <br>④ 본 서비스의 "회원"은 서비스 이용 시 노출되는 광고게재에 대해 동의 하는 것으로
                              간주한다. <br>제 15 조 (자료내용의 책임과 "회사"의 정보 수정 권한) <br>①
                              자료내용은 "회원"이 등록한 개인정보 및 이력서와 사이트에 게시한 게시물을 말한다. <br>②
                              "회원"은 자료 내용 및 게시물을 사실에 근거하여 성실하게 작성해야 하며, 만일 자료의 내용이 사실이 아니거나
                              부정확하게 작성되어 발생하는 모든 책임은 "회원"에게 있다. "회사"는 "회원"이 작성한 게시물 등의 정확성 및
                              진실성을 보증하지 아니하며, 게시물에 대한 일체의 책임을 부담하지 아니한다. <br>③ 모든 자료내용의
                              관리와 작성은 "회원" 본인이 하는 것이 원칙이나 사정상 위탁 또는 대행관리를 하더라도 자료내용의 책임은
                              "회원"에게 있으며 "회원"은 주기적으로 자신의 자료를 확인하여 항상 정확하게 관리가 되도록 노력해야 한다. <br>④
                              "회사"는 "회원"이 등록한 자료 내용에 오자, 탈자 또는 사회적 통념에 어긋나는 문구와 내용이 있을 경우 이를
                              언제든지 수정할 수 있다. <br>⑤ "회원"이 등록한 자료으로 인해 타인(또는 타법인)으로부터
                              허위사실 및 명예훼손 등으로 삭제 요청이 접수된 경우 "회사"는 "회원"에게 사전 통지 없이 본 자료를 삭제할
                              수 있으며 삭제 후 메일 등의 방법으로 통지할 수 있다. <br>제 16 조 (자료 내용의 활용 및
                              취급) <br>① "회원"이 선택하거나 입력한 정보는 취업 및 관련 동향의 통계 자료로 구성, 활용될
                              수 있으며 그 자료는 매체를 통한 언론 배포 또는 제휴사에게 제공될 수 있다. 단, 개인을 식별할 수 있는
                              형태가 아니어야 한다. <br>② 제8조 제3항에 따라 "사이트"에서 정당한 절차를 거쳐 기업회원,
                              서치펌회원이 열람한 "회원"의 이력서 정보는 해당 기업의 인사자료이며 이에 대한 관리 권한은 해당 기업의 정책에
                              의한다. <br>③ "회사"는 "사이트"의 온라인 입사지원 시스템을 통해 지원한 "회원"의 이력서 열람
                              여부 및 기업회원이 제공한 채용정보에 입사지원한 구직자들의 각종 통계데이터를 "회원"에게 제공할 수 있다. <br>제
                              17 조 ("회사"의 의무) <br>① "회사"는 본 약관에서 정한 바에 따라 계속적, 안정적으로
                              서비스를 제공할 수 있도록 최선의 노력을 다해야 한다. <br>② "회사"는 서비스와 관련한 "회원"의
                              불만사항이 접수되는 경우 이를 즉시 처리하여야 하며, 즉시 처리가 곤란한 경우에는 그 사유와 처리일정을 서비스
                              화면 또는 기타 방법을 통해 동 "회원"에게 통지하여야 한다. <br>③ "회사"는 유료 결제와 관련한
                              결제 사항 정보를 1년 이상 보존한다. 다만 회원 자격이 없는 회원은 예외로 한다. <br>④ 천재지변
                              등 예측하지 못한 일이 발생하거나 시스템의 장애가 발생하여 서비스가 중단될 경우 이에 대한 손해에 대해서는
                              "회사"가 책임을 지지 않는다. 다만 자료의 복구나 정상적인 서비스 지원이 되도록 최선을 다할 의무를 진다. <br>⑤
                              "회원"의 자료를 본 서비스 이외의 목적으로 제3자에게 제공하거나 열람시킬 경우 반드시 "회원"의 동의를 얻어야
                              한다. <br>제 18 조 ("회원"의 의무) <br>① "회원"은 관계법령과 본 약관의 규정
                              및 기타 "회사"가 통지하는 사항을 준수하여야 하며, 기타 "회사"의 업무에 방해되는 행위를 해서는 안 된다.
                              <br>② "회원"이 신청한 유료서비스는 등록 또는 신청과 동시에 "회사"와 채권, 채무 관계가
                              발생하며, "회원"은 이에 대한 요금을 지정한 기일 내에 납부하여야 한다. <br>③ "회원"이 결제
                              수단으로 신용카드를 사용할 경우 비밀번호 등 정보 유실 방지는 "회원" 스스로 관리해야 한다. 단, "사이트"의
                              결함에 따른 정보유실의 발생에 대한 책임은 "회원"의 의무에 해당하지 아니한다. <br>④ "회원"은
                              서비스를 이용하여 얻은 정보를 "회사"의 사전동의 없이 복사, 복제, 번역, 출판, 방송 기타의 방법으로
                              사용하거나 이를 타인에게 제공할 수 없다. <br>⑤ "회원"은 본 서비스를 건전한 취업 및 경력관리
                              이외의 목적으로 사용해서는 안되며 이용 중 다음 각 호의 행위를 해서는 안 된다. <br>1. 다른
                              회원의 아이디를 부정 사용하는 행위 <br>2. 범죄행위를 목적으로 하거나 기타 범죄행위와 관련된 행위
                              <br>3. 타인의 명예를 훼손하거나 모욕하는 행위 <br>4. 타인의 지적재산권 등의 권리를
                              침해하는 행위 <br>5. 해킹행위 또는 바이러스의 유포 행위 <br>6. 타인의 의사에
                              반하여 광고성 정보 등 일정한 내용을 계속적으로 전송하는 행위 <br>7. 서비스의 안정적인 운영에
                              지장을 주거나 줄 우려가 있다고 판단되는 행위 <br>8. 사이트의 정보 및 서비스를 이용한 영리 행위
                              <br>9. 그밖에 선량한 풍속, 기타 사회질서를 해하거나 관계법령에 위반하는 행위 <br>제
                              19 조 ("회원"의 가입해지/서비스중지/자료삭제) <br>① "회원"은 언제든지 회원탈퇴 또는 이력서
                              등록을 해지하기 위해 고객센터 또는 회원탈퇴 메뉴 등을 통하여 이용계약 해지 신청을 할 수 있으며, "회사"는
                              관련법 등이 정하는 바에 따라 이를 처리한다. <br>② 다음의 사항에 해당하는 경우 "회사"는 사전
                              동의없이 가입해지나 서비스 중지, 이력서 삭제 조치를 취할 수 있다. <br>1. 회원의 의무를
                              성실하게 이행하지 않았을 때 <br>2. 규정한 유료서비스 이용 요금을 납부하지 않았을 때 <br>3.
                              본 서비스 목적에 맞지 않는 분야에 정보를 활용하여 사회적 물의가 발생한 때 <br>4. 회원이 등록한
                              정보의 내용이 사실과 다르거나 조작되었을 때 <br>5. 본 서비스와 관련하여 회사 또는 제3자의
                              명예를 훼손하였을 때 <br>6. 기타 위 각호에 준하는 사유가 발생하였을 때 <br>③
                              "회원"이 유료서비스를 이용하는 중 "회사"의 책임에 의해 정상적인 서비스가 제공되지 않을 경우 "회원"은 본
                              서비스의 해지를 요청할 수 있으며 "회사"는 기간의 정함이 있는 유료서비스의 경우에는 해지일까지 이용일수를 1일
                              기준금액으로 계산하여 이용금액을 공제 후 환급하고, 이용건수의 정함이 있는 유료서비스의 경우에는 기 사용분을
                              1건 기준금액으로 계산하여 이용금액을 공제후 환급한다. <br>④ "회사"는 회원 가입이 해지된
                              경우에는 개인정보처리방침 중, 04.개인정보의 보유 및 이용기간 규정에 따른다. <br>⑤
                              개인정보보호를 위하여 "회원"이 선택한 개인정보 보유기간(1년, 3년, 회원탈퇴시) 동안 "사이트"를 이용하지
                              않은 경우, "아이디"를 "휴면계정"으로 분리하여 해당 계정의 이용을 중지할 수 있다. 이 경우 "회사"는
                              "휴면계정 처리 예정일"로부터 30일 이전에 해당사실을 전자메일, 서면, SMS 중 하나의 방법으로 사전통지하며
                              "회원"이 직접 본인확인을 거쳐, 다시 "사이트" 이용 의사표시를 한 경우에는 "사이트" 이용이 가능하다.
                              "휴면계정"으로 분리 보관된 개인정보는 5년간 보관 후 지체없이 파기한다. <br>제 20 조
                              (손해배상) <br>① "회사"가 이 약관의 규정을 위반한 행위로 "회원"에게 손해를 입히거나 기타
                              "회사"가 제공하는 모든 서비스와 관련하여 "회사"의 책임 있는 사유로 인해 이용자에게 손해가 발생한 경우
                              "회사"는 그 손해를 배상하여야 한다. <br>② "회사"는 책임 있는 사유로 제공한 정보가 사실과
                              달라 "회원"이 손해를 입었을 경우에 "회사"는 그 손해를 배상하여야 한다. <br>③ "회원"이 이
                              약관의 규정을 위반한 행위로 "회사" 및 제3자에게 손해를 입히거나 "회원"의 책임 있는 사유에 의해 "회사"
                              및 제3자에게 손해를 입힌 경우에는 "회원"은 그 손해를 배상하여야 한다. <br>④ 타
                              회원(개인회원, 기업회원, 서치펌회원 모두 포함)의 귀책사유로 "회원"의 손해가 발생한 경우 "회사"는 이에
                              대한 배상 책임이 없다. <br>제 21 조 (양도 금지) <br>“회원”의 서비스 받을
                              권리는 제3자에게 양도, 대여, 증여 등으로 사용할 수 없다. <br> <br>제 22 조
                              (이용요금 오류의 조정) <br>"회사"는 이용요금과 관련하여 오류가 있는 경우에 "회원"의 요청,
                              또는 "회사"의 사전 통지에 의하여 다음에 해당하는 조치를 취한다. <br> <br>1.
                              과다납입한 요금에 대하여는 그 금액을 반환한다. 다만, "회원"이 동의할 경우 다음 달에 청구할 요금에서 해당
                              금액만큼을 감하여 청구한다. <br>2. 요금을 반환받아야 할 "회원"이 요금체납이 있는 경우에는
                              반환해야 할 요금에서 이를 우선 공제하고 반환한다. <br>3. "회사"는 과소청구액에 대해서는 익월에
                              합산청구한다. <br>제 23 조 ("회원"의 개인정보보호) <br>"회사"는 "회원"의
                              개인정보보호를 위하여 노력해야 한다. "회원"의 개인정보보호에 관해서는 정보통신망이용촉진 및 정보보호 등에 관한
                              법률, 개인정보보호법에 따르고, "사이트"에 "개인정보처리방침"을 고지한다. <br>제 24 조
                              (신용정보의 제공 활용 동의) <br>① "회사"가 회원가입과 관련하여 취득한 "회원"의 개인신용정보를
                              타인에게 제공하거나 활용하고자 할 때에는 신용정보의 이용 및 보호에 관한 법률 제23조의 규정에 따라 사전에 그
                              사유 및 해당기관 또는 업체명 등을 밝히고 해당 "회원"의 동의를 얻어야 한다. <br>② 본 서비스와
                              관련하여 "회사"가 "회원"으로부터 신용정보의 이용 및 보호에 관한 법률에 따라 타인에게 제공 활용에 동의를
                              얻은 경우 "회원"은 "회사"가 신용정보 사업자 또는 신용정보 집중기관에 정보를 제공하여 "회원"의 신용을
                              판단하기 위한 자료로 활용하거나, 공공기관에서 정책자료로 활용되도록 정보를 제공하는 데 동의한 것으로 간주한다.
                              <br>제 25 조 (분쟁의 해결) <br>① "회사"와 "회원"은 서비스와 관련하여 발생한
                              분쟁을 원만하게 해결하기 위하여 필요한 모든 노력을 하여야 한다. <br>② 전항의 노력에도 불구하고,
                              동 분쟁에 관한 소송은 "회사"의 주소지 관할법원으로 한다. <br>부칙 <br>- 이 약관은
                              2022년 4월 27일부터 시행한다.
                           </div>
                           <div class="agree1">
                              <div id="term2" class="term2">
                                 <label><strong>[필수]</strong> 개인정보 수집 및 이용 동의</label>
                              </div>
                              <div class="checkbox">
                                 <label> <input type="checkbox" id="agree3">
                                 </label>
                              </div>
                           </div>
                           <div id="expl2" class="up">
                              커피콩채용박람회 서비스 이용을 위해 아래와 같이 개인정보를 수집 및 이용합니다. <br>동의를 거부할
                              권리가 있으며, 동의 거부 시 커피콩채용박람회 이용이 불가합니다. <br> <br>목적 <br>-
                              본인여부 확인, 각종 맞춤형 서비스 제공, 서비스 개선 및 신규 서비스 개발을 위한 통계 활용, 계약이행 및
                              약관변경 등의 고지를 위한 연락, 본인의사확인 및 민원 등의 고객불만처리 <br>- 공모전 정보 등록자
                              확인 및 고객불만 처리, 각종 맞춤형 서비스 제공 <br>- 입사지원 및 이력서 공개 등 취업활동
                              서비스 제공, 각종 맞춤형 서비스 제공 <br> <br>항목 <br>-이름, 아이디,
                              비밀번호, 휴대폰번호, 이메일 <br>-담당자명, 이메일, 전화번호 <br>-이름, 생년월일,
                              성별, 휴대폰번호, 학력사항 또는 경력사항, 이메일, 전화번호, 주소, 홈페이지, 사진, 인턴·대외활동,
                              교육이수, 자격증, 수상, 해외경험, 어학, 포트폴리오, 취업우대·병역(보훈대상, 취업보호대상, 고용지원금대상,
                              장애, 병역), 자기소개서 <br> <br>보유 및 이용기간 <br>- 회원 탈퇴 시
                              즉시 파기
                           </div>
                        </div>
                     </div>

                     <br>

                     <!--회원 가입 버튼 -->
                     <div class="form-group">
                        <button type="button" class="btn btn-lg btn-insert btn-block"
                           id="joinBtn">회원가입</button>
                     </div>



                  </form>

               </div>

               <div id="contents2" class="content">

                  <!--  <form action="<c:url value='/user/join2' />" method="post" id="joinForm2"> -->
                  <form action="<c:url value='/user/join2' />" enctype="multipart/form-data" method="post" id="joinForm2">
                  <!-- FILE을 받기 위해   enctype="multipart/form-data" 추가 !-->
                     <input type="radio" style="display: none" name="idntNo" value="7"
                        checked>
                     <div class="form-group">
                        <label class="title">기업정보</label>
                     </div>
                     
         
         <!-- 이미지 업로드 이미지 업로드 이미지 업로드 이미지 업로드 이미지 업로드 이미지 업로드 이미지 업로드 -->
            
            
                     <div class="form-group">
                        <div class="col-md-12 form-group picture">
                           <img id="fileImg" src="<c:url value='/img/img_ready.png' />">
                        </div>
                        <label for="file" class="form-label">기업 로고 첨부</label> 
                        <input type="file" name="file" class="form-control-sm" id="file">
                     </div>
                     
                     
         <!-- 이미지 업로드 이미지 업로드 이미지 업로드 이미지 업로드 이미지 업로드 이미지 업로드 이미지 업로드 -->
         

                     <div class="form-group">
                        <label>*기업형태</label> <select name="corType" class="form-control"
                           id="corType">
                           <option disabled selected>기업형태 선택</option>
                           <option value="대기업">대기업</option>
                           <option value="대기업 계열사자회사">대기업 계열사‧자회사</option>
                           <option value="중소기업(300명 이하)">중소기업(300명 이하)</option>
                           <option value="중견기업(300명 이하)">중견기업(300명 이하)</option>
                           <option value="벤처기업">벤처기업</option>
                           <option value="외국계(외국 투자기업)">외국계(외국 투자기업)</option>
                           <option value="외국계(외국 법인기업)">외국계(외국 법인기업)</option>
                           <option value="국내 공공기관공기업">국내 공공기관‧공기업</option>
                           <option value="비영리단체협회교육재단">비영리단체‧협회‧교육재단</option>
                           <option value="외국 기관비영리기구단체">외국 기관‧비영리기구‧단체</option>
                        </select>

                     </div>
                     <div class="form-group">
                        <label>*사업자등록번호</label><span
                           style="margin-left: 10px; font-size: 9px">숫자로만 입력해 주세요</span> <input
                           id="businessNum" name="businessNum" type="text"
                           class="form-control" maxlength="10"
                           placeholder="ex) 1234567890">

                     </div>
                     <div class="form-group">
                        <label>*회사명</label> <input type="text" id="compName"
                           name="compName" class="form-control" placeholder="">
                     </div>
                     <div class="form-group">
                        <label for="name">*대표자명</label>
                        <div class="input-group">
                           <input name="ceo" type="text" id="ceo" class="form-control"
                              placeholder="">
                        </div>
                     </div>
                     <div class="form-group">
                        <label for="addr-num">회사주소</label>
                        <div class="input-group">
                           <input name="comAddrZipNum" type="text" id="comAddrZipNum"
                              class="form-control" placeholder="우편번호" readonly>
                           <div class="input-group-addon">
                              <button type="button" class="btn btn-primary" id="coAddress"
                                 onclick="searchAddress()">우편번호검색</button>
                           </div>
                        </div>
                     </div>
                     <div class="form-group">
                        <input name="comAddrBasic" id="comAddrBasic" type="text"
                           class="form-control" placeholder="기본주소" readonly>
                     </div>
                     <div class="form-group">
                        <input name="comAddrDetail" id="comAddrDetail" type="text"
                           class="form-control" placeholder="상세주소">
                     </div>
                     <br> <br>

                     <!--인사담당자 정보 -->
                     <div class="form-group">
                        <label class="title">인사담당자 정보</label>
                     </div>
                     <div class="form-group">
                        <label for="id">*아이디</label>
                        <div class="input-group">
                           <input type="text" name="userId" id="userId2"
                              class="form-control" placeholder="아이디(영문 포함 4~12자 이상)">
                           <div class="input-group-addon">
                              <button type="button" class="btn btn-primary" id="idCheckBtn2">아이디중복체크</button>
                           </div>
                        </div>
                        <span id="msgId2"></span>
                        <!-- 아이디 중복 여부 메세지 공간 -->
                     </div>
                     <div class="form-group">
                        <label for="password">*비밀번호</label> <input type="password"
                           name="userPw" id="userPw2" class="form-control" maxlength="16"
                           placeholder="비밀번호 (영 대/소문자, 숫자조합 8~16자)"> <span
                           id="msgPw2"></span>
                        <!-- 비밀번호 유효성 메세지 공간 -->
                     </div>
                     <div class="form-group">
                        <label for="pwConfirm2">*비밀번호</label> <input type="password"
                           id="pwConfirm2" class="form-control" maxlength="16"
                           placeholder="비밀번호를 확인해 주세요."> <span id="msgPw-c2"></span>
                        <!-- 비밀번호 확인 여부 메세지 공간 -->
                     </div>
                     <div class="form-group">
                        <label for="name">*가입자명</label>
                        <div class="input-group">
                           <input name="userName" type="text" id="userName2"
                              class="form-control" placeholder="">
                        </div>
                     </div>
                     <div class="form-group">
                        <label for="hp">*전화번호</label><br> 
                        <select name="userPhone1" id="userPhone11"
                           class="form-control hp_con"
                           style="width: 80px; display: inline-block">
                           <option>010</option>
                           <option>011</option>
                           <option>017</option>
                        </select>
                        <div class="hp_con hp_con2">-</div>
                        <div class="input-group hp_con" style="display: inline-block;">
                           <input name="userPhone2" type="text" class="form-control"
                              id="userPhone22">
                        </div>
                        <div class="hp_con hp_con2">-</div>
                        <div class="input-group hp_con" style="display: inline-block;">
                           <input name="userPhone3" type="text" class="form-control"
                              id="userPhone33">
                        </div>
                        <div class="input-group hp_con" style="display: inline-block;">
                        <button type="button" class="phoneChk btn btn-primary" id="phoneChk3">인증번호 보내기</button> <br>
						</div><br><br>
						<div>
						<input id="phone22" type="text" name="phone22" title="인증번호 입력" disabled required/>
						<button type="button" id="phoneChk22" class="doubleChk2" disabled>본인인증</button><br>
						<span class="point successPhoneChk2">※ 휴대폰 번호 입력후 인증번호 보내기를 해주십시오.</span>
						<input type="hidden" id="phoneDoubleChk2"/>
						</div>
                     </div>
                     <div class="form-group comp_email">
                        <label for="exampleInputEmail">Email</label> <input
                           name="userEmail" type="email" class="form-control"
                           placeholder="jane.doe@example.com">
                     </div>


                     <!-- 이용약관 -->
                     <div class="form-inline">
                        <br> <label for="">이용약관 동의</label><br> <br>

                        <div class="agree">

                           <div class="agree1">
                              <div id="term3" class="term3">
                                 <label><strong>[필수]</strong> 이용약관 동의</label>
                              </div>
                              <div class="checkbox">
                                 <label> <input type="checkbox" id="agree4">
                                 </label>
                              </div>

                           </div>
                           <div id="expl3" class="up">
                              제 1 조 (목적) <br>본 약관은 잡코리아(이하 "회사")가 운영하는 "서비스"를 이용함에 있어
                              "회사"와 회원간의 이용 조건 및 제반 절차, 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로
                              한다. <br>제 2 조 (용어의 정의) <br>이 약관에서 사용하는 용어의 정의는 아래와
                              같다. <br> <br>① "사이트"라 함은 회사가 서비스를 "회원"에게 제공하기 위하여
                              컴퓨터 등 정보통신설비를 이용하여 설정한 가상의 영업장 또는 회사가 운영하는 웹사이트, 모바일웹, 앱 등의
                              서비스를 제공하는 모든 매체를 통칭하며, 통합된 하나의 회원 계정(아이디 및 비밀번호)을 이용하여 서비스를
                              제공받을 수 있는 아래의 사이트를 말한다. <br>- www.jobkorea.co.kr <br>-
                              www.albamon.com <br>- www.campusmon.com <br>-
                              m.jobkorea.co.kr <br>- m.albamon.com <br>-
                              learning.jobkorea.co.kr <br>② "서비스"라 함은 회사가 운영하는 사이트를 통해
                              개인이 구직, 교육 등의 목적으로 등록하는 자료를 DB화하여 각각의 목적에 맞게 분류 가공, 집계하여 정보를
                              제공하는 서비스와 사이트에서 제공하는 모든 부대 서비스를 말한다. <br>③ "회원"이라 함은
                              "회사"가 제공하는 서비스를 이용하거나 이용하려는 자로, 페이스북 등 외부 서비스 연동을 통해 "회사"와
                              이용계약을 체결한자 또는 체결하려는 자를 포함하며, 아이디와 비밀번호의 설정 등 회원가입 절차를 거쳐
                              회원가입확인 이메일 등을 통해 회사로부터 회원으로 인정받은 "개인회원"을 말한다. <br>④
                              "아이디"라 함은 회원가입 시 회원의 식별과 회원의 서비스 이용을 위하여 "회원"이 선정하고 "회사"가 부여하는
                              문자와 숫자의 조합을 말한다. <br>⑤ "비밀번호"라 함은 위 제4항에 따라 회원이 회원가입시
                              아이디를 설정하면서 아이디를 부여받은 자와 동일인임을 확인하고 "회원"의 권익을 보호하기 위하여 "회원"이
                              선정한 문자와 숫자의 조합을 말한다. <br>⑥ "비회원"이라 함은 회원가입 절차를 거치지 않고
                              "회사"가 제공하는 서비스를 이용하거나 하려는 자를 말한다. <br>제 3 조 (약관의 명시와 개정)
                              <br>① "회사"는 이 약관의 내용과 상호, 영업소 소재지, 대표자의 성명, 사업자등록번호, 연락처
                              등을 "회원"이 알 수 있도록 초기 화면에 게시하거나 기타의 방법으로 "회원"에게 공지해야 한다. <br>②
                              "회사"는 약관의 규제에 관한 법률, 전기통신기본법, 전기통신사업법, 정보통신망 이용촉진 및 정보보호 등에 관한
                              법률 등 관련법을 위반하지 않는 범위에서 이 약관을 개정할 수 있다. <br>③ "회사"가 약관을
                              개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 그 개정약관의 적용일자 7일 전부터 적용일자
                              전일까지 공지한다. 단 "회원"의 권리, 의무에 중대한 영향을 주는 변경의 경우에는 적용일자 30일 전부터
                              공지하도록 한다. <br>④ "회원"은 변경된 약관에 대해 거부할 권리가 있다. "회원"은 변경된
                              약관이 공지된 지 15일 이내에 거부의사를 표명할 수 있다. "회원"이 거부하는 경우 본 서비스 제공자인
                              "회사"는 15일의 기간을 정하여 "회원"에게 사전 통지 후 당해 "회원"과의 계약을 해지할 수 있다. 만약,
                              "회원"이 거부의사를 표시하지 않거나, 전항에 따라 시행일 이후에 "서비스"를 이용하는 경우에는 동의한 것으로
                              간주한다. <br>제 4 조 (약관의 해석) <br>① 이 약관에서 규정하지 않은 사항에
                              관해서는 약관의 규제에 관한 법률, 전기통신기본법, 전기통신사업법, 정보통신망 이용촉진 및 정보보호 등에 관한
                              법률 등의 관계법령에 따른다. <br>② 각 사이트 및 서비스 이용약관이 있는 경우에는 서비스
                              이용약관이 우선한다. <br>③ "회원"이 "회사"와 개별 계약을 체결하여 서비스를 이용하는 경우에는
                              개별 계약이 우선한다. <br>제 5 조 (이용계약의 성립) <br>① "회사"의 서비스
                              이용계약(이하 "이용계약")은 서비스를 이용하고자 하는 자가 본 약관과 개인정보처리방침을 읽고 "동의" 또는
                              "확인" 버튼을 누른 경우 본 약관에 동의한 것으로 간주한다. <br>② 제1항 신청에 있어 "회사"는
                              "회원"의 종류에 따라 전문기관을 통한 실명확인 및 본인인증을 요청할 수 있으며, "회원"은 본인인증에 필요한
                              이름, 생년월일, 연락처 등을 제공하여야 한다. <br>③ "회원"이 이용신청(회원가입 신청) 작성
                              후에 "회사"가 웹상의 안내 및 전자메일로 "회원"에게 통지함으로써 이용계약이 성립된다. <br>④
                              페이스북 등 외부 서비스와의 연동을 통해 이용계약을 신청할 경우, 본 약관과 개인정보처리방침, 서비스 제공을
                              위해 "회사"가 "회원"의 외부 서비스 계정 정보 접근 및 활용에 "동의" 또는 "확인" 버튼을 누르면
                              "회사"가 웹상의 안내 및 전자메일로 "회원"에게 통지함으로써 이용계약이 성립된다. <br>제 6 조
                              (이용신청의 승낙과 제한) <br>① "회사"는 전조의 규정에 의한 이용신청 고객에 대하여 업무수행상
                              또는 기술상 지장이 없는 경우에는 원칙적으로 접수순서에 따라 서비스 이용을 승낙한다. <br>②
                              "회사"는 아래사항에 해당하는 경우에 대해서는 서비스 이용신청을 승낙하지 아니한다. <br>1. 실명이
                              아니거나 타인의 명의를 이용하여 신청한 경우 <br>2. 이용계약 신청서의 내용을 허위로 기재하거나
                              "회사"가 제시하는 내용을 기재하지 않은 경우 <br>3. 만 15세 미만의 아동이 신청한 경우.
                              다만, 만 13세 이상 만 15세 미만의 아동으로서 노동부장관 발급의 취직인허증이 있는 경우에는 그러하지
                              아니한다. <br>4. 이용자의 귀책사유로 인하여 승인이 불가능하거나 기타 규정한 제반 사항을 위반하여
                              신청하는 경우 <br>③ "회사"는 아래사항에 해당하는 경우에는 그 신청에 대하여 승낙제한 사유가
                              해소될 때까지 승낙을 유보할 수 있다. <br>1. "회사"가 설비의 여유가 없는 경우 <br>2.
                              "회사"의 기술상 지장이 있는 경우 <br>3. 기타 "회사"의 귀책사유로 이용승낙이 곤란한 경우 <br>제
                              7 조 (서비스의 내용) <br>① "회사"는 제2조 2항의 서비스를 제공할 수 있으며 그 내용은 다음
                              각 호와 같다. <br>1. 이력서 등록 및 인재정보 게재 서비스 <br>2. 온라인 입사지원
                              서비스 <br>3. 헤드헌팅/아웃소싱 서비스 <br>4. 구인/구직과 관련된 제반 서비스 <br>5.
                              기업리뷰 등록과 조회 서비스 <br>6. 기업정보 조회와 관련된 제반 서비스 <br>7.
                              교육과 관련된 제반 서비스 <br>8. 이용자간의 교류와 소통에 관련한 서비스 <br>9.
                              자료거래에 관련한 서비스 <br>10. 기타"회사"가 추가 개발, 편집, 재구성하거나 제휴계약 등을
                              통해 “회원”에게 제공하는 일체의 서비스 <br>② "회사"는 필요한 경우 서비스의 내용을 추가 또는
                              변경할 수 있다. 단, 이 경우 "회사"는 추가 또는 변경내용을 "회원"에게 공지해야 한다. <br>제
                              8 조 (회원, 이력서 및 게시물 등의 정보) <br>① "회원"의 이력서는 개인이 회원가입 또는
                              이력서 작성 및 수정시 희망한 형태로 등록 및 제공된다. <br>② "회사"는 "회원"이 이력서의
                              인재정보 등록/미등록 지정, 이력서상의 연락처 제공 여부를 자유롭게 선택할 수 있도록 하여야 한다. <br>③
                              "회사"는 "회원"이 이력서의 인재정보 등록 및 제공을 희망했을 경우, 기업회원, 서치펌회원의 이력서 열람 및
                              각종 포지션 제안에 동의한 것으로 간주하며 "회사"는 기업회원, 서치펌회원에게 유료로 이력서 열람 서비스를
                              제공할 수 있다. 다만, 연락처 각 항목이 비공개로 지정된 경우 해당 항목별 연락처를 노출할 수 없다. <br>④
                              "회사"는 안정적인 서비스를 제공하기 위해 테스트 및 모니터링 용도로 "사이트" 운영자가 이력서 및 게시물 등의
                              정보를 열람하도록 할 수 있다. <br>⑤ "회사"는 "회원"의 선택에 의하여 등록 및 제공되는 이력서
                              및 게시물 등의 정보를 기준으로 구직활동에 보다 유익한 서비스를 제공하기 위하여 이를 개발, 편집, 재구성한
                              통계 자료로 활용 할 수 있다. <br>제 9 조 (제휴를 통한 서비스) <br>① "회사"는
                              제휴 관계를 체결한 여타 인터넷 웹 사이트 및 채용박람회 또는 신문, 잡지 등의 오프라인 매체를 통해 사이트에
                              등록한 "회원"의 이력서 정보가 열람될 수 있도록 서비스를 제공할 수 있다. 단, 제휴 서비스를 통해 노출되는
                              이력서의 연락처 정보는 “회원”이 이력서 등록 시 선택한 연락처 공개 여부에 따라 제공된다. <br>②
                              "회사"는 제휴를 통해 타 사이트 및 매체에 등록될 수 있음을 고지해야 하며, 제휴 사이트 목록을 사이트내에서
                              상시 열람할 수 있도록 해야 한다. 단, 등록의 형태가 "회사"가 직접 구축하지 않고, 제휴사가 xml 또는
                              api 형태로 "회사"로부터 제공 받아 구축한 매체 목록은 본 약관외 별도의 제휴리스트에서 열람할 수 있도록
                              한다. <br>③ "회사"는 "회원"이 공개를 요청한 이력서에 한해 제휴를 맺은 타 사이트에 이력서
                              정보를 제공한다. (본 약관 시행일 현재에는 제휴를 통한 타 사이트 및 매체는 없다.) <br>④ 본
                              조 제 3항 제휴를 통한 사이트의 변동사항 발생 시 공지사항을 통해 고지 후 진행 한다. <br>제
                              10 조 (서비스의 요금) <br>① "회원" 가입과 이력서 등록은 무료이다. 다만 기업회원 또는
                              사이트에 방문한 기업체에게 자신의 이력서 정보를 보다 효과적으로 노출시키기 위한 유료서비스 및 인성, 적성 검사
                              등 회원 가입 목적 외 기타 서비스를 이용하기 위한 별도의 서비스는 유료로 제공될 수 있다. <br>②
                              "회사"는 유료서비스를 제공할 경우 사이트에 요금에 대해서 공지를 하여야 한다. <br>③ "회사"는
                              유료서비스 이용금액을 서비스의 종류 및 기간에 따라 "회사"가 예고 없이 변경할 수 있다. 다만, 변경 이전에
                              적용 또는 계약한 금액은 소급하여 적용하지 아니한다. <br>제 11 조 (서비스 요금의 환불) <br>①
                              "회사"는 다음 각 호에 해당하는 경우 이용요금을 환불한다. 단, 각 당사자의 귀책사유에 따라 환불 조건이
                              달라질 수 있다. <br>1. 유료서비스 이용이 개시되지 않은 경우 <br>2. 네트워크 또는
                              시스템 장애로 서비스 이용이 불가능한 경우 <br>3. 유료서비스 신청 후 “회원”의 사정에 의해
                              서비스가 취소될 경우 <br>② "회사"가 본 약관 제19조에 따라 가입해지/서비스중지/자료삭제를 취한
                              경우, “회사”는 “회원”에게 이용요금을 환불하지 않으며, 별도로 “회원”에게 손해배상을 청구할 수 있다. <br>③
                              이용료를 환불받고자 하는 회원은 고객센터로 환불을 요청해야 한다. <br>④ "회사"는 환불 요건에
                              부합하는 것으로 판단될 경우, 각 서비스 환불 안내에 따라 유료이용 계약 당시 상품의 정가 기준으로 서비스
                              제공된 기간에 해당하는 요금을 차감한 잔액을 환불한다. <br>제 12 조 (서비스 이용시간) <br>①
                              "회사"는 특별한 사유가 없는 한 연중무휴, 1일 24시간 서비스를 제공한다. 다만, "회사"는 서비스의 종류나
                              성질에 따라 제공하는 서비스 중 일부에 대해서는 별도로 이용시간을 정할 수 있으며, 이 경우 "회사"는 그
                              이용시간을 사전에 "회원"에게 공지 또는 통지하여야 한다. <br>② "회사"는 자료의 가공과 갱신을
                              위한 시스템 작업시간, 장애해결을 위한 보수작업 시간, 정기 PM작업, 시스템 교체작업, 회선 장애 등이 발생한
                              경우 일시적으로 서비스를 중단할 수 있으며 계획된 작업의 경우 공지란에 서비스 중단 시간과 작업 내용을 알려야
                              한다. 다만, "회사"가 사전에 통지할 수 없는 부득이한 사유가 있는 경우 사후에 통지할 수 있다. <br>제
                              13 조 (서비스 제공의 중지) <br>① "회사"는 다음 각 호에 해당하는 경우 서비스의 제공을
                              중지할 수 있다. <br>1. 설비의 보수 등 "회사"의 필요에 의해 사전에 "회원"들에게 통지한 경우
                              <br>2. 기간통신사업자가 전기통신서비스 제공을 중지하는 경우 <br>3. 기타 불가항력적인
                              사유에 의해 서비스 제공이 객관적으로 불가능한 경우 <br>② 전항의 경우, "회사"는 기간의 정함이
                              있는 유료서비스 이용자들에게는 그 이용기간을 연장하거나 환불 등의 방법으로 손실을 보상하여야 한다. <br>제
                              14 조 (정보의 제공 및 광고의 게재) <br>① "회사"는 "회원"에게 서비스 이용에 필요가 있다고
                              인정되거나 서비스 개선 및 회원대상의 서비스 소개 등의 목적으로 하는 각종 정보에 대해서 전자우편이나 서신우편을
                              이용한 방법으로 제공할 수 있다. <br>② "회사"는 제공하는 서비스와 관련되는 정보 또는 광고를
                              서비스 화면, 홈페이지, 전자우편 등에 게재할 수 있으며, 광고가 게재된 전자우편을 수신한 "회원"은 수신거절을
                              "회사"에게 할 수 있다. <br>③ "회사"는 서비스상에 게재되어 있거나 본 서비스를 통한 광고주의
                              판촉활동에 "회원"이 참여하거나 교신 또는 거래를 함으로써 발생하는 모든 손실과 손해에 대해 책임을 지지
                              않는다. <br>④ 본 서비스의 "회원"은 서비스 이용 시 노출되는 광고게재에 대해 동의 하는 것으로
                              간주한다. <br>제 15 조 (자료내용의 책임과 "회사"의 정보 수정 권한) <br>①
                              자료내용은 "회원"이 등록한 개인정보 및 이력서와 사이트에 게시한 게시물을 말한다. <br>②
                              "회원"은 자료 내용 및 게시물을 사실에 근거하여 성실하게 작성해야 하며, 만일 자료의 내용이 사실이 아니거나
                              부정확하게 작성되어 발생하는 모든 책임은 "회원"에게 있다. "회사"는 "회원"이 작성한 게시물 등의 정확성 및
                              진실성을 보증하지 아니하며, 게시물에 대한 일체의 책임을 부담하지 아니한다. <br>③ 모든 자료내용의
                              관리와 작성은 "회원" 본인이 하는 것이 원칙이나 사정상 위탁 또는 대행관리를 하더라도 자료내용의 책임은
                              "회원"에게 있으며 "회원"은 주기적으로 자신의 자료를 확인하여 항상 정확하게 관리가 되도록 노력해야 한다. <br>④
                              "회사"는 "회원"이 등록한 자료 내용에 오자, 탈자 또는 사회적 통념에 어긋나는 문구와 내용이 있을 경우 이를
                              언제든지 수정할 수 있다. <br>⑤ "회원"이 등록한 자료으로 인해 타인(또는 타법인)으로부터
                              허위사실 및 명예훼손 등으로 삭제 요청이 접수된 경우 "회사"는 "회원"에게 사전 통지 없이 본 자료를 삭제할
                              수 있으며 삭제 후 메일 등의 방법으로 통지할 수 있다. <br>제 16 조 (자료 내용의 활용 및
                              취급) <br>① "회원"이 선택하거나 입력한 정보는 취업 및 관련 동향의 통계 자료로 구성, 활용될
                              수 있으며 그 자료는 매체를 통한 언론 배포 또는 제휴사에게 제공될 수 있다. 단, 개인을 식별할 수 있는
                              형태가 아니어야 한다. <br>② 제8조 제3항에 따라 "사이트"에서 정당한 절차를 거쳐 기업회원,
                              서치펌회원이 열람한 "회원"의 이력서 정보는 해당 기업의 인사자료이며 이에 대한 관리 권한은 해당 기업의 정책에
                              의한다. <br>③ "회사"는 "사이트"의 온라인 입사지원 시스템을 통해 지원한 "회원"의 이력서 열람
                              여부 및 기업회원이 제공한 채용정보에 입사지원한 구직자들의 각종 통계데이터를 "회원"에게 제공할 수 있다. <br>제
                              17 조 ("회사"의 의무) <br>① "회사"는 본 약관에서 정한 바에 따라 계속적, 안정적으로
                              서비스를 제공할 수 있도록 최선의 노력을 다해야 한다. <br>② "회사"는 서비스와 관련한 "회원"의
                              불만사항이 접수되는 경우 이를 즉시 처리하여야 하며, 즉시 처리가 곤란한 경우에는 그 사유와 처리일정을 서비스
                              화면 또는 기타 방법을 통해 동 "회원"에게 통지하여야 한다. <br>③ "회사"는 유료 결제와 관련한
                              결제 사항 정보를 1년 이상 보존한다. 다만 회원 자격이 없는 회원은 예외로 한다. <br>④ 천재지변
                              등 예측하지 못한 일이 발생하거나 시스템의 장애가 발생하여 서비스가 중단될 경우 이에 대한 손해에 대해서는
                              "회사"가 책임을 지지 않는다. 다만 자료의 복구나 정상적인 서비스 지원이 되도록 최선을 다할 의무를 진다. <br>⑤
                              "회원"의 자료를 본 서비스 이외의 목적으로 제3자에게 제공하거나 열람시킬 경우 반드시 "회원"의 동의를 얻어야
                              한다. <br>제 18 조 ("회원"의 의무) <br>① "회원"은 관계법령과 본 약관의 규정
                              및 기타 "회사"가 통지하는 사항을 준수하여야 하며, 기타 "회사"의 업무에 방해되는 행위를 해서는 안 된다.
                              <br>② "회원"이 신청한 유료서비스는 등록 또는 신청과 동시에 "회사"와 채권, 채무 관계가
                              발생하며, "회원"은 이에 대한 요금을 지정한 기일 내에 납부하여야 한다. <br>③ "회원"이 결제
                              수단으로 신용카드를 사용할 경우 비밀번호 등 정보 유실 방지는 "회원" 스스로 관리해야 한다. 단, "사이트"의
                              결함에 따른 정보유실의 발생에 대한 책임은 "회원"의 의무에 해당하지 아니한다. <br>④ "회원"은
                              서비스를 이용하여 얻은 정보를 "회사"의 사전동의 없이 복사, 복제, 번역, 출판, 방송 기타의 방법으로
                              사용하거나 이를 타인에게 제공할 수 없다. <br>⑤ "회원"은 본 서비스를 건전한 취업 및 경력관리
                              이외의 목적으로 사용해서는 안되며 이용 중 다음 각 호의 행위를 해서는 안 된다. <br>1. 다른
                              회원의 아이디를 부정 사용하는 행위 <br>2. 범죄행위를 목적으로 하거나 기타 범죄행위와 관련된 행위
                              <br>3. 타인의 명예를 훼손하거나 모욕하는 행위 <br>4. 타인의 지적재산권 등의 권리를
                              침해하는 행위 <br>5. 해킹행위 또는 바이러스의 유포 행위 <br>6. 타인의 의사에
                              반하여 광고성 정보 등 일정한 내용을 계속적으로 전송하는 행위 <br>7. 서비스의 안정적인 운영에
                              지장을 주거나 줄 우려가 있다고 판단되는 행위 <br>8. 사이트의 정보 및 서비스를 이용한 영리 행위
                              <br>9. 그밖에 선량한 풍속, 기타 사회질서를 해하거나 관계법령에 위반하는 행위 <br>제
                              19 조 ("회원"의 가입해지/서비스중지/자료삭제) <br>① "회원"은 언제든지 회원탈퇴 또는 이력서
                              등록을 해지하기 위해 고객센터 또는 회원탈퇴 메뉴 등을 통하여 이용계약 해지 신청을 할 수 있으며, "회사"는
                              관련법 등이 정하는 바에 따라 이를 처리한다. <br>② 다음의 사항에 해당하는 경우 "회사"는 사전
                              동의없이 가입해지나 서비스 중지, 이력서 삭제 조치를 취할 수 있다. <br>1. 회원의 의무를
                              성실하게 이행하지 않았을 때 <br>2. 규정한 유료서비스 이용 요금을 납부하지 않았을 때 <br>3.
                              본 서비스 목적에 맞지 않는 분야에 정보를 활용하여 사회적 물의가 발생한 때 <br>4. 회원이 등록한
                              정보의 내용이 사실과 다르거나 조작되었을 때 <br>5. 본 서비스와 관련하여 회사 또는 제3자의
                              명예를 훼손하였을 때 <br>6. 기타 위 각호에 준하는 사유가 발생하였을 때 <br>③
                              "회원"이 유료서비스를 이용하는 중 "회사"의 책임에 의해 정상적인 서비스가 제공되지 않을 경우 "회원"은 본
                              서비스의 해지를 요청할 수 있으며 "회사"는 기간의 정함이 있는 유료서비스의 경우에는 해지일까지 이용일수를 1일
                              기준금액으로 계산하여 이용금액을 공제 후 환급하고, 이용건수의 정함이 있는 유료서비스의 경우에는 기 사용분을
                              1건 기준금액으로 계산하여 이용금액을 공제후 환급한다. <br>④ "회사"는 회원 가입이 해지된
                              경우에는 개인정보처리방침 중, 04.개인정보의 보유 및 이용기간 규정에 따른다. <br>⑤
                              개인정보보호를 위하여 "회원"이 선택한 개인정보 보유기간(1년, 3년, 회원탈퇴시) 동안 "사이트"를 이용하지
                              않은 경우, "아이디"를 "휴면계정"으로 분리하여 해당 계정의 이용을 중지할 수 있다. 이 경우 "회사"는
                              "휴면계정 처리 예정일"로부터 30일 이전에 해당사실을 전자메일, 서면, SMS 중 하나의 방법으로 사전통지하며
                              "회원"이 직접 본인확인을 거쳐, 다시 "사이트" 이용 의사표시를 한 경우에는 "사이트" 이용이 가능하다.
                              "휴면계정"으로 분리 보관된 개인정보는 5년간 보관 후 지체없이 파기한다. <br>제 20 조
                              (손해배상) <br>① "회사"가 이 약관의 규정을 위반한 행위로 "회원"에게 손해를 입히거나 기타
                              "회사"가 제공하는 모든 서비스와 관련하여 "회사"의 책임 있는 사유로 인해 이용자에게 손해가 발생한 경우
                              "회사"는 그 손해를 배상하여야 한다. <br>② "회사"는 책임 있는 사유로 제공한 정보가 사실과
                              달라 "회원"이 손해를 입었을 경우에 "회사"는 그 손해를 배상하여야 한다. <br>③ "회원"이 이
                              약관의 규정을 위반한 행위로 "회사" 및 제3자에게 손해를 입히거나 "회원"의 책임 있는 사유에 의해 "회사"
                              및 제3자에게 손해를 입힌 경우에는 "회원"은 그 손해를 배상하여야 한다. <br>④ 타
                              회원(개인회원, 기업회원, 서치펌회원 모두 포함)의 귀책사유로 "회원"의 손해가 발생한 경우 "회사"는 이에
                              대한 배상 책임이 없다. <br>제 21 조 (양도 금지) <br>“회원”의 서비스 받을
                              권리는 제3자에게 양도, 대여, 증여 등으로 사용할 수 없다. <br> <br>제 22 조
                              (이용요금 오류의 조정) <br>"회사"는 이용요금과 관련하여 오류가 있는 경우에 "회원"의 요청,
                              또는 "회사"의 사전 통지에 의하여 다음에 해당하는 조치를 취한다. <br> <br>1.
                              과다납입한 요금에 대하여는 그 금액을 반환한다. 다만, "회원"이 동의할 경우 다음 달에 청구할 요금에서 해당
                              금액만큼을 감하여 청구한다. <br>2. 요금을 반환받아야 할 "회원"이 요금체납이 있는 경우에는
                              반환해야 할 요금에서 이를 우선 공제하고 반환한다. <br>3. "회사"는 과소청구액에 대해서는 익월에
                              합산청구한다. <br>제 23 조 ("회원"의 개인정보보호) <br>"회사"는 "회원"의
                              개인정보보호를 위하여 노력해야 한다. "회원"의 개인정보보호에 관해서는 정보통신망이용촉진 및 정보보호 등에 관한
                              법률, 개인정보보호법에 따르고, "사이트"에 "개인정보처리방침"을 고지한다. <br>제 24 조
                              (신용정보의 제공 활용 동의) <br>① "회사"가 회원가입과 관련하여 취득한 "회원"의 개인신용정보를
                              타인에게 제공하거나 활용하고자 할 때에는 신용정보의 이용 및 보호에 관한 법률 제23조의 규정에 따라 사전에 그
                              사유 및 해당기관 또는 업체명 등을 밝히고 해당 "회원"의 동의를 얻어야 한다. <br>② 본 서비스와
                              관련하여 "회사"가 "회원"으로부터 신용정보의 이용 및 보호에 관한 법률에 따라 타인에게 제공 활용에 동의를
                              얻은 경우 "회원"은 "회사"가 신용정보 사업자 또는 신용정보 집중기관에 정보를 제공하여 "회원"의 신용을
                              판단하기 위한 자료로 활용하거나, 공공기관에서 정책자료로 활용되도록 정보를 제공하는 데 동의한 것으로 간주한다.
                              <br>제 25 조 (분쟁의 해결) <br>① "회사"와 "회원"은 서비스와 관련하여 발생한
                              분쟁을 원만하게 해결하기 위하여 필요한 모든 노력을 하여야 한다. <br>② 전항의 노력에도 불구하고,
                              동 분쟁에 관한 소송은 "회사"의 주소지 관할법원으로 한다. <br>부칙 <br>- 이 약관은
                              2022년 4월 27일부터 시행한다.
                           </div>
                           <div class="agree1">
                              <div id="term4" class="term4">
                                 <label><strong>[필수]</strong> 개인정보 수집 및 이용 동의</label>
                              </div>
                              <div class="checkbox">
                                 <label> <input type="checkbox" id="agree5">
                                 </label>
                              </div>
                           </div>
                           <div id="expl4" class="up">
                              커피콩채용박람회 서비스 이용을 위해 아래와 같이 개인정보를 수집 및 이용합니다. <br>동의를 거부할
                              권리가 있으며, 동의 거부 시 커피콩채용박람회 이용이 불가합니다. <br> <br>목적 <br>-
                              본인여부 확인, 각종 맞춤형 서비스 제공, 서비스 개선 및 신규 서비스 개발을 위한 통계 활용, 계약이행 및
                              약관변경 등의 고지를 위한 연락, 본인의사확인 및 민원 등의 고객불만처리 <br>- 공모전 정보 등록자
                              확인 및 고객불만 처리, 각종 맞춤형 서비스 제공 <br>- 입사지원 및 이력서 공개 등 취업활동
                              서비스 제공, 각종 맞춤형 서비스 제공 <br> <br>항목 <br>-이름, 아이디,
                              비밀번호, 휴대폰번호, 이메일 <br>-담당자명, 이메일, 전화번호 <br>-이름, 생년월일,
                              성별, 휴대폰번호, 학력사항 또는 경력사항, 이메일, 전화번호, 주소, 홈페이지, 사진, 인턴·대외활동,
                              교육이수, 자격증, 수상, 해외경험, 어학, 포트폴리오, 취업우대·병역(보훈대상, 취업보호대상, 고용지원금대상,
                              장애, 병역), 자기소개서 <br> <br>보유 및 이용기간 <br>- 회원 탈퇴 시
                              즉시 파기
                           </div>
                           <div class="agree1">
                              <div id="term5" class="term5">
                                 <label><strong>[필수]</strong>문자서비스 이용약관 동의 </label>
                              </div>
                              <div class="checkbox">
                                 <label> <input type="checkbox" id="agree6">
                                 </label>
                              </div>

                           </div>
                           <div id="expl5" class="up">
                              제1조(목적) <br>본 약관은 잡코리아 유한책임회사(이하 "회사")가 운영하는 웹사이트 및 모바일
                              어플리케이션(이하 "사이트")에서 제공하는 문자메시지 발송 서비스(이하 "서비스")를 이용함에 있어 이용자의
                              권리/의무 및 책임사항, 기타 필요사항을 규정함을 목적으로 한다. <br>제2조(정의) <br>1.
                              서비스 : 회사가 사이트에서 유료 또는 무료로 제공하는 SMS, LMS 등 문자메시지 발송 기능 <br>2.
                              이용자 : 회사가 제공하는 서비스를 이용하고자 절차에 의거 신청한 사이트의 기업회원 <br>3.
                              이용신청 : 회사가 정한 별도의 기준과 절차에 따라 서비스 이용을 신청하는 것 <br>4. 이용정지 :
                              회사가 정한 일정한 요건에 따라 일정기간 동안 서비스 이용을 보류 조치하는 것 <br>5. 해지 :
                              이용자가 서비스 이용신청 후 사용중 이를 해약하는 것 <br>6. 스팸메시지 : 수신자의 의사에 반하여
                              정보통신망을 통해 일방적으로 전송 또는 게시되는 영리목적의 광고성 정보 <br>7. 문자피싱메시지 :
                              전자금융사기를 목적으로 전송 또는 게시되는 정보 <br>8. 스미싱메시지 : 메시지 내용 중 인터넷
                              주소를 클릭하면 악성코드가 설치되어 수신자가 모르는 사이에 금전적 피해 또는 개인ㆍ금융정보 탈취 피해를 야기하는
                              메시지 <br>제3조(약관의 게시와 개정) <br>1. 회사는 이 약관의 내용을 이용자가 쉽게
                              알 수 있도록 서비스 약관 메뉴에 게시한다. <br>2. 회사는 "약관규제에관한법률",
                              “개인정보보호법” "정보통신망이용촉진및정보보호등에관한법률(이하 "정보통신망법")", "전자상거래 등에서의 소비자
                              보호에 관한 법률", "전기통신사업법" 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있다. <br>3.
                              회사가 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 제1항의 방식에 따라 그
                              개정약관의 적용일자 7일 전부터 적용일자 전까지 공지한다. <br>다만, 이용자의 권리 또는 의무에
                              관한 중요한 규정의 변경은 최소한 30일 전에 공지하고 일정기간 서비스내 공지사항, 전자우편, 로그인시 동의창
                              등의 전자적 수단을 통해 따로 명확히 통지하도록 한다. <br>4. 회사가 전항에 따라 개정약관을 공지
                              또는 통지하면서 이용자에게 약관 변경 적용일까지 거부의사를 표시하지 않으면 동의한 것으로 본다는 뜻을 명확하게
                              공지 또는 통지하였음에도 이용자가 명시적으로 거부의 의사표시를 하지 아니한 경우 약관의 규제에 관한 법률
                              제12조 제1호 단서에 따라 이용자가 개정약관에 동의한 것으로 본다. <br>5. 이용자가 개정약관의
                              적용에 동의하지 않을 경우 회사는 개정약관의 내용을 해당 이용자에게 적용할 수 없으며, 이 경우 이용자는
                              이용신청을 해지할 수 있다. 다만, 기존 약관을 적용할 수 없는 특별한 사정이 있는 경우에는 회사는 이용신청을
                              해지할 수 있다. <br>6. 이용자는 약관의 변경에 대하여 주의의무를 다하여야 하며 약관 미준수로
                              인한 이용자의 피해는 회사가 책임지지 않는다. <br>7. 이 약관이 이용자에게 적용되는 기간은
                              이용자의 서비스 신청일부터 해지일 까지를 원칙으로 하되, 단, 채권 또는 채무관계가 있을 경우에는 채권, 채무의
                              완료일 까지로 한다. <br>제4조(서비스 이용 신청) <br>1. 이용자는 회사가 정한
                              별도의 기준과 절차에 따라 약관에 동의하여 서비스 이용 신청을 완료하고 회사가 이를 승낙함으로써 서비스 이용이
                              가능하다. <br>2. 회사는 제 1항과 같이 서비스 이용을 신청한 이용자 중 다음 각호에 해당하는
                              신청에 대하여는 승낙을 하지 않거나 사후에 이용 신청을 해지할 수 있다. <br>① 이용자가 이 약관에
                              의하여 이전에 회원자격을 상실한 적이 있는 경우, 다만 회사의 이용자 재가입 승낙을 얻은 경우에는 예외로 한다.
                              <br> <br>② 등록 내용에 허위, 기재누락, 오기가 있는 경우 <br> <br>③
                              실명이 아니거나 타인의 명의를 이용한 경우 <br> <br>④ 이용자가 서비스의 정상적인
                              제공을 저해하거나 다른 이용자의 서비스 이용에 지장을 줄 것으로 예상되는 경우 <br> <br>⑤
                              회사의 업무상 또는 기술상 문제로 인해 가입승낙을 유보하는 경우 <br> <br>⑥ 이용자가
                              서비스를 이용하여 법령에 위반되는 행위를 하거나 이와 유사한 행위를 하는 경우 <br> <br>3.
                              회사는 제1항에 따른 신청에 있어서 이용자의 종류에 따라 전문기관을 통한 실명확인 및 본인인증을 요청할 수
                              있다. <br>4. 서비스 이용 신청의 성립시기는 회사의 승낙이 이용자에게 도달한 시점으로 한다. <br>5.
                              회사는 이용자에 대해 회사정책에 따라 등급별로 구분하여 이용시간, 이용횟수, 서비스 메뉴 등을 세분하여 이용에
                              차등을 둘 수 있다. <br>제5조(이용자의 아이디 및 비밀번호의 관리에 대한 의무) <br>1.
                              이용자의 아이디와 비밀번호에 관한 관리책임은 이용자에게 있으며 이를 제3자가 이용하도록 하여서는 안 된다. <br>2.
                              기타 본 약관에서 정하지 아니하는 아이디 및 비밀번호 관리에 대한 이용자의 의무는 사이트의 기업회원 약관에
                              따른다. <br>제6조(개인정보보호 수집 및 보호 의무) <br>1. 회사는 "정보통신망법",
                              "개인정보보호법", "전기통신사업법" 등 관계 법령이 정하는 바에 따라 이용자의 개인정보를 보호하기 위해
                              노력한다. <br>2. 회사는 개인정보의 보호 및 사용에 대해서는 관련 법령 및 회사의
                              개인정보처리방침에 그 수집범위 및 목적을 사전 고지한다. 단, 회사에서 제공하는 공식 사이트 이외의 링크된
                              사이트에서는 회사의 개인정보처리방침이 적용되지 않는다 <br>3. 기타 본 약관에서 정하지 아니하는
                              개인정보보호 관련 사항은 사이트의 개인정보 처리방침 등 정책에 따른다. <br>제7조(이용자에 대한
                              통지) <br>1. 회사가 이용자에 대한 서비스 관련 내용의 통지를 하는 경우, 사이트의 기업회원
                              약관에 의거 사이트 가입 신청시 등록한 이메일, 휴대전화 문자메세지 또는 어플리케이션 푸쉬 알림 중 수신에
                              동의한 수단을 활용하여 각종 고지나 통지를 이행할 수 있다. <br>2. 회사는 불특정다수 회원에 대한
                              통지의 경우 1주일이상 서비스에 게시함으로써 개별 통지에 갈음할 수 있다. <br>제8조(서비스 제공의
                              의무) <br>1. 회사는 "정보통신망법", "개인정보보호법", "전기통신사업법" 등 관련법과 이
                              약관이 금지하는 행위를 하지 않으며 이용자에게 제공하는 서비스를 안정적으로 제공하기 위하여 최선을 다해야 <br>2.
                              회사는 안정적인 서비스를 지속적으로 제공하기 위하여 설비에 장애가 생기거나 멸실 되었을 때 지체 없이 수리 또는
                              복구를 한다. 다만, 천재지변이나 비상사태 등 부득이한 경우에는 서비스를 일시 중단하거나 영구 중지할 수 있다.
                              <br>3. 회사는 이용자가 서비스 이용 신청 혹은 발신번호 등록 시 타인의 명의를 도용한 부정가입을
                              방지하기 위해 본인인증 서비스 사업자가 제공하는 인증방법을 통해 본인확인 인증서비스를 제공ㆍ운영한다. <br>4.
                              회사는 서비스 제공과 관련 취득한 이용자의 개인정보를 본인의 동의 없이 타인에게 누설하거나 배포할 수 없으며
                              서비스 관련 업무 이외의 목적으로 사용할 수 없습니다. 다만 관계법령에 의한 관계기관으로부터의 요청 등 법률의
                              규정에 따른 적법한 절차에 의한 경우는 그러하지 않는다. <br>5. 회사는 이용자가 안전하게 인터넷
                              서비스를 이용할 수 있도록 이용자의 개인정보보호를 위한 보안 시스템과 개인정보보호 책임자를 갖추어야 한다. <br>6.
                              회사는 이용자의 사전 동의 없이 이용자가 원하지 않는 영리목적의 광고성 전자우편을 발송하지 않는다. <br>7.
                              회사는 이용계약의 체결, 계약사항의 변경 및 해지 등 이용자와의 계약관련 절차 및 내용 등에 있어 이용자에
                              편의를 제공하도록 노력한다. <br>8. 회사의 서비스 이용시에 회사의 귀책사유 없는 이용자의 시스템
                              장애 발생, 각종 카페, 블로그, 클럽 등 게시판의 개인정보유출에 대한 피해 등은 회사가 책임을 지지 않는다.
                              <br>9. 회사의 사이트는 서비스의 본질적인 부분이 아닌 경우 사전예고 없이 모양과 기능이 수정될 수
                              있다. <br>10. 회사는 서비스 제공목적에 맞는 서비스 이용 여부를 확인하기 위하여 상시적으로
                              모니터링을 실시한다. <br>11. 회사는 "정보통신망법", "개인정보보호법", "전기통신사업법"에 등
                              관련 법 따라 스팸메시지ㆍ문자피싱메시지ㆍ스미싱메시지, 사기, 협박, 음란성, 범죄를 목적으로 하거나 교사 또는
                              방조하는 내용의 정보, 발신번호조작 등으로 인지되는 문자메시지에 대해서 차단 및 제한할 수 있다. <br>12.
                              회사는 서비스 제공이 불가능한 경우 다음과 같이 처리한다. <br>① 서비스 제공이 불가능한 경우 :
                              천재지변, 시스템(통신) 장애 및 점검, 서비스 양도 및 폐지(휴지) 등 <br> <br>②
                              천재지변 등을 제외한 서비스 제공이 불가능한 경우 이용자(고객)에게 사전 공지(안내)를 한다. <br>
                              <br>③ 천재지변 등을 제외한 서비스 제공이 불가능한 경우 이용자(회원)에게 사전 공지(안내) 없이
                              서비스를 중단 하였을 시, 그로 인해 피해가 발생한 이용자(회원)에게 피해에 따른 손해를 확인 후 보상할 수
                              있다. <br> <br>④ 회사는 사업의 전부 및 일부를 휴지 또는 폐지 하고자 할 때에는 그
                              휴지 또는 폐지 예정일의 30일전까지 그 내용을 이용자(고객)에게 이메일, 홈페이지 등을 이용하여 공지한다. <br>
                              <br>13. 회사는 이용자가 불법스팸을 전송한 사실을 확인한 경우 한국인터넷진흥원 불법스팸대응센터에
                              관련 자료를 첨부하여 신고할 수 있다. <br>14. 회사는 한국인터넷진흥원으로부터 스팸신고가 접수된
                              경우 서비스 제공목적에 맞는 서비스 이용 여부를 확인하기 위하여 다량의 문자전송여부 및 서비스 변경이력을 확인할
                              수 있다. <br>제9조(불만사항 접수 및 처리 의무) <br>회사는 이용자의 불만사항 접수
                              및 처리절차를 다음과 같이 처리한다. <br>① 불만사항 접수는 일반전화, 게시판, 이메일에 의한
                              방법으로 접수 받는다. <br> <br>② 불만사항 처리는 접수 방법에 따라 운영자가 직접
                              전화, 답변하여 처리하는 것을 원칙으로 하고, 불만형태별로 처리기간을 정하여 그 기간 내에 처리한다. <br>
                              <br>불만형태 유형 원인 처리절차 처리기간 <br>서비스 관련 통신 장애 회사의 귀책사유
                              대고객 사과 및 품질개선 3일 이내 <br>시스템 장애 회사의 귀책사유 대고객 사과 및 품질개선 3일
                              이내 <br>이용자(회원)의 귀책사유 대고객 설명 1일 이내 <br>요금 관련 청구요금 이의
                              회사의 귀책사유 과금전 : 정정 과금 처리 3일 이내 <br>과금후 : 환불 처리 7일 이내 <br>이용자의
                              귀책사유 대고객 설명 1일 이내 <br>제10조(발신번호 변작방지 의무) <br>회사는
                              발신번호의 변작방지를 위해 다음과 같은 조치를 취한다. <br>① 번호인증을 통한 발신번호
                              사전등록서비스를 제공/운영 <br> <br>② 회사에서 제공하는 통일된 발신번호로 발신 <br>
                              <br>제11조(이용자의 금지행위 의무) <br>1. 이용자는 현행 법령, 회사가 제공하는
                              서비스에 정한 약관, 이용안내 및 서비스와 관련하여 공지한 주의사항, 회사가 통지하는 사항, 기타 서비스 이용에
                              관한 규정을 준수하여야 하며, 기타 회사의 업무에 방해되는 행위를 해서는 안된다. <br>①
                              정보통신망법(제50조)에 따라 광고문자 표기 의무사항을 위반해서는 안된다. <br> <br>②
                              이용자가 본인 명의가 아닌 타인의 전화번호를 부정하게 사용하는 경우에 서비스를 중지시키고, 필요시 회원 탈퇴 및
                              접속IP를 차단한다. <br> <br>2. 이용자는 서비스를 이용하여 얻은 정보를 회사의 사전
                              승낙 없이 복사, 복제, 변경, 번역, 출판, 발송 및 기타의 방법으로 사용하거나 이를 타인에게 제공할 수
                              없다. <br>3. 이용자는 서비스를 이용함에 있어서 공공질서 또는 미풍양속을 해치는 행위, 또는 다음
                              각 호에 해당하는 행위를 해서는 안되며, 위반시 회사는 이용자의 서비스이용을 정지하고 일방적으로 서비스 이용
                              신청을 해지할 수 있다. <br>① 다른 이용자의 이용 아이디를 부정 사용하는 행위 <br>
                              <br>② 해킹 행위 또는 컴퓨터 바이러스의 유포 행위 <br> <br>③ 타인의
                              의사에 반하여 광고성정보 등 유사한 내용을 지속적으로 전송하는 행위 <br> <br>④ 회사와
                              타인의 지적 재산권 등을 침해하는 행위(불법 복제물 복제·전송 등을 포함) <br> <br>⑤
                              범죄행위를 목적으로 하거나 범죄행위를 교사하거나, 반국가적 범죄의 수행 등을 목적으로 하는 행위 <br>
                              <br>⑥ 서비스의 안전적인 운영에 지장을 주거나 줄 우려가 있다고 판단되는 행위(신청 또는 변경 시
                              허위내용을 등록하는 행위 포함) <br> <br>⑦ 원하지 않는 메시지를 타인에게 보내는 행위
                              <br> <br>⑧ 회사와 타인의 명예를 손상시키거나 모욕하는 행위 또는 일체의 업무를
                              방해하는 행위 <br> <br>⑨ 외설 또는 폭력적인 메시지, 팩스, 음성, 메일, 기타
                              공서양속에 반하는 정보를 서비스에 공개 또는 게시, 전송하는 행위 등 선량한 풍속 또는 기타 사회질서를 해하거나
                              관계법령에 위반하는 행위 <br> <br>⑩ 회사의 동의 없이 영리를 목적으로 서비스를
                              사용하는 행위 및 제3자에게 임의로 서비스를 임대하는 행위 <br> <br>4. 이용자는
                              스팸메시지ㆍ문자피싱메시지 전송 등 불법행위를 하거나 전기통신사업법 등 관련 법령을 준수하지 않아 발생하는 모든
                              민ㆍ형사상의 책임을 부담한다. <br>제12조(서비스의 변경) <br>1. 회사는 상당한
                              이유가 있는 경우에 운영상, 기술상의 필요에 따라 제공하고 있는 전부 또는 일부 서비스를 변경할 수 있다. <br>2.
                              서비스의 내용, 이용방법, 이용시간에 대하여 변경이 있는 경우에는 변경사유, 변경될 서비스의 내용 및 제공일자
                              등을 그 변경 전에 해당 서비스 초기화면에 게시하여야 한다. <br>3. 회사는 무료로 제공되는
                              서비스의 일부 또는 전부를 회사의 정책 및 운영의 필요상 수정, 중단, 변경할 수 있으며 이에 대하여 관련법에
                              특별한 규정이 없는 한 이용자에게 별도의 보상을 하지 않다. <br>제13조(서비스 이용의 제한 및
                              정지) <br>1. 회사는 원활한 서비스 제공을 위하여 이 약관을 위반하거나 서비스의 정상적인 운영을
                              방해하는 경우 서비스 이용을 제한하거나 정지할 수 있다. <br>2. 회사는 1항에도 불구하고
                              주민등록법을 위반한 명의도용 및 결제도용, 저작권법을 위반한 불법프로그램의 제공 및 운영방해, 정보통신망법을
                              위반한 스팸메시지 및 불법통신, 해킹, 악성프로그램의 배포, 접속권한 초과행위 등과 같이 관련법을 위반한
                              경우에는 즉시 영구이용정지를 할 수 있다. 본 항에 따른 서비스 이용정지 시 서비스 내의 금액, 혜택 및 권리
                              등도 모두 소멸되며 회사는 이에 대해 별도로 보상하지 않는다. <br>3. 회사는 다음 각호에 해당하는
                              경우 해당 역무의 제공을 거부하는 조치를 할 수 있으며, 이용자에게 통지한다. 단, 회사가 긴급하게 이용을
                              정지할 필요가 있다고 인정하는 경우나, 이용자의 귀책사유로 인해 통지할 수 없는 경우에는 통지를 생략할 수
                              있다. <br>① 이용자가 정보통신망법 제50조 또는 제50조의 8을 위반하여 불법스팸 발송을 하는
                              경우 <br> <br>② 방송통신위원회ㆍ한국인터넷진흥원ㆍ과학기술정보통신부 등 관계기관이
                              불법스팸메시지ㆍ문자피싱메시지 등 불법행위의 전송사실을 확인하여 이용정지를 요청하는 경우 <br> <br>③
                              광고성 정보의 전송 또는 수신으로 역무의 제공으로 장애가 일어나거나 일어날 우려가 있는 경우 <br>
                              <br>④ 이용자가 발송한 문자 또는 팩스메시지 광고성 정보 메시지의 수신을 원하지 아니하는 경우 <br>
                              <br>⑤ 제10조(발신번호 변작방지 의무)를 위반하여 발신번호를 변작하는 등 거짓으로 표시한 경우 <br>
                              <br>⑥ 과학기술정보통신부ㆍ한국인터넷진흥원 등 관련 기관이 발신번호 변작 등을 확인하여 이용 정지를
                              요청하는 경우 <br> <br>⑦ 유료서비스를 사용한 이용자가 요금 등을 납입할 의무를
                              이행하지 아니한 경우 <br> <br>⑧ 제11조(이용자의 금지행위 의무)를 이행하지 아니한
                              경우 <br> <br>⑨ 정보통신윤리위원회의 시정요구가 있거나, 불법선거 운동과 관련하여
                              선거관리위원회의 유권해석을 받은 경우 또는 수사기관이나 법원의 결정 또는 명령 등으로 회사의 이용자에 대한
                              서비스 제공이 관련 법령상 제한되는 경우 <br> <br>⑩ 이용자는 사전에 명시적으로 광고
                              수신동의를 얻은 자에게만 광고 메시지를 전송할 수 있으며, 오후9시 부터 다음날 오전8시까지는 별도의 사전
                              동의를 받아야 함에도 이를 어긴 경우 <br> <br>⑪ 기타 회사가 사회통념상 합리적인
                              관점에서 이용자로 부적당하다고 판단한 경우 <br> <br>4. 이용자가 3항에 해당되어 타
                              서비스에 악용될 우려가 있다는 객관적 정황이 있는 경우에는 그 다른 서비스도 이용정지 할 수 있다. 특히 3항
                              5호 및 6호에 해당하는 경우 회사는 이용자의 서비스를 영구정지 조치할 수 있으며, 원인이 해소되는 경우 해제할
                              수 있다. <br>5. 제3항의 이용정지 경우 사회적 공익을 저해할 목적이나 범죄적 목적으로 서비스를
                              이용하고 있다고 판단되는 경우 이용자에게 회사는 사전통보 없이 서비스를 즉시 중단할 수 있으며 그에 따른
                              데이터도 복구를 전제로 하지 않고 삭제할 수 있다. <br>6. 회사는 이용정지 등의 원인이 된 사유가
                              완전히 해소되기 전까지는 이용정지등 조치를 해제하지 아니 할 수 있으며, 그 이용정지등의 사유가 해소된 것이
                              확인된 경우에는 이용정지조치를 즉시 해제한다. <br>7. 회사는 회사에서 정하는 스미싱 등 스팸방지를
                              위해 특정 단어가 포함된 문자 메시지에 대해 발송을 제한 할 수 있다. <br>8. 회사는 이용자에게
                              강제적인 서비스 신청 해지 사유가 발생할 경우 최소한 30일 이상의 기간을 정하여 소명할 기회를 부여한다. 단
                              해당 기간 동안 회사는 이용자에게 서비스를 중지할 수 있다. <br>9. 회사는 스팸메시지ㆍ피싱문자
                              전송을 방지하기 위해서 문자 팩스의 일일발송량을 제한할 수 있으며 자체 모니터링을 강화할 수 있다. <br>10.
                              2회 이상 동일한 이용정지 사유가 발생하는 이용자에게는 회사는 이용자에게 사전통보 없이 서비스를 즉시 중단할 수
                              있으며, 제8항의 소명기회 부여를 생략하고 이용자에게 이용정지사유 2회 이상 발생으로 인한 사유임을 알려 서비스
                              해지 조치를 할 수 있다. 이 경우 해당 거래 관련 자료는 관련 법령에 따라 필요한 기간 동안 보관한다. <br>제14조(문자
                              발송량의 제한) <br>1. 회사는 스팸메시지ㆍ피싱문자 전송을 방지하기 위해서 문자 팩스의 일일발송량을
                              제한할 수 있으며 자체 모니터링을 강화할 수 있다. <br>2. 회사는 이용자가 제출하는 증빙서류 등을
                              통해 불법스팸 전송이 아님을 확인할 수 있는 경우 초과전송이 가능하다. <br>제15조(서비스 이용
                              신청 해지) <br>1. 이용자가 서비스 이용 신청 해지를 하고자 할 때에는 본인이 직접 서비스 이용
                              해지를 신청하거나 전자우편, 전화 등의 방법을 통하여 회사에 신청하여야 한다. <br>2. 회사는
                              1항의 규정에 의하여 해지 신청이 접수되면 즉시 이용 신청을 해지한다. 단, 별도의 채무나 채권 관계가 있을
                              경우에는 그러하지 아니한다. <br>3. 서비스 해지 후로부터 5년간 고객의 자료를 보호할 의무를
                              가진다. 단, 서비스해지 후 보관된 개인정보 및 기타 서비스자료는 관련법규에 의하여 보존 의무가 없는 것으로
                              판명이 되면 즉시 삭제처리 된다. <br>4. 회사는 이용자가 다음 중 하나에 해당하는 것이 객관적으로
                              명백하거나 관련 증거가 확보된 경우 별도의 소명기회 부여 없이 당해 서비스 신청을 해지할 수 있다. <br>①
                              타인의 명의로 신청하였거나 신청시 제출한 자료 및 정보가 허위 또는 누락되었음이 확인된 경우 <br>
                              <br>② 회사의 서비스 제공목적 외의 용도로 서비스를 이용하거나, 전기통신사업법 제30조에 위반하여
                              제3자에게 서비스를 이용하도록 제공한 경우 <br> <br>③ 방송통신위원회 또는
                              한국인터넷진흥원 또는 기타 유관기관이 불법스팸 전송과 관련하여 서비스 이용 해지를 요청하는 경우 <br>
                              <br>④ 회사가 제공하는 서비스를 이용하여 불법스팸을 전송한 사실이 확인된 경우 <br> <br>⑤
                              불특정 다수를 대상으로 메시지(SMS, LMS, MMS 포함), 음성(영상)통화 등의 방법을 통해 무차별적인
                              스팸을 전송한 사실이 확인된 경우 <br> <br>⑥ 서비스를 이용하여 수신자를 기망하여
                              회신을 유도하는 행위를 하는 경우 <br> <br>⑦ 제14조의 규정에 의하여 이용정지를 당한
                              이후 1년 이내에 이용정지 사유가 재발한 경우 <br> <br>⑧ 발신자 정보를 변작하여
                              영리목적의 광고성 정보를 전송하였거나, 또는 발신자 정보를 변작하여 위해를 입힐 목적으로 문자메시지를 전송한
                              사실이 확인된 경우 <br> <br>⑨ 이용자가 전송한 광고성 정보에 대해 회사가
                              한국인터넷진흥원 등에 불법스팸 유무확인을 요청하여 불법스팸임이 확인된 경우 <br> <br>5.
                              회사는 불법스팸을 전송하였다고 확인된 이용자가 이용중인 다른 서비스가 불법스팸에 악용되고 있거나 악용될 우려가
                              있다는 객관적 정황이 있는 경우에는 그 다른 서비스도 해지 할 수 있다. <br>6. 회사는 제4항의
                              규정에 의하여 서비스 신청을 해지하는 경우, 그 사실을 당해 이용자에게 통지한다. 단, 회사가 긴급하게 서비스
                              이용을 해지 할 필요가 있다고 인정하는 경우나, 이용자의 귀책사유로 인해 통지할 수 없는 경우에는 통지를 생략할
                              수 있다. <br>제16조(서비스 요금 및 환불) <br>1. 유료서비스 이용과 관련하여
                              이용자가 납부하여야 할 요금은 이용료 사이트에 게재한 바에 따른다. <br>2. 환불에 관한 규정은
                              기업서비스 이용약관 제11조(서비스 요금의 환불)에 따른다.
                           </div>
                        </div>
                     </div>

                     <br>

                     <div class="form-group">
                        <button type="button" class="btn btn-lg btn-insert btn-block"
                           id="joinBtn2">회원가입</button>
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

   <script
      src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

 <script>
//아이디 중복 체크
   $('#idCheckBtn').click(function() {
      
      //아이디값을 받아와서 비동기 통신을 통해 서버와 통신하고
      // 중복되었다면 '중복된 아이디입니다.',
      //아니라면 '사용 가능한 아이디입니다' 라고
      //화면에 띄워주시면 되겠습니다.
      //attr()를 이용해서 readonly 속성을 true를 주어서 작성하지 못하도록.
      
      const userId = $('#userId').val();
      
      if(userId === '') {
         alert('아이디는 필수값입니다.');
         return;
      }
   
   $.ajax({
      type: 'post',
      url: '<c:url value="/user/idCheck" />',
      data: userId,
      contentType: 'application/json',
      success: function(data) {
         if(data === 'ok') {
            $('#userId').attr('readonly', true);
            $('#msgId').html('사용 가능한 아이디입니다.');
         } else {
            $('#msgId').html('중복된 아이디입니다.');
         }
      },
      error: function() {
         alert('서버 에러입니다. 관리자에게 문의하세요.');
      }
   }); //중복확인 비동기 통신 끝.
   
   }); //아이디 중복 체크 끝.
   
   
   $('#joinBtn').click(function() {
      if(!$('#userId').attr('readonly')) {
         alert('아이디 중복체크는 필수입니다.');
         return;
      } else if($('#userPw').val() === '' || $('#userPw').val() !== $('#pwConfirm').val()) {
         alert('비밀번호 규칙을 확인하세요.');
         $('#userPw').focus();
         return;
      } else if($('#userName').val() === '') {
         alert('이름은 필수입니다.');
         $('#userName').focus();
         return;
      } else if(!($('#agree1').is(':checked') && $('#agree2').is(':checked') && $('#agree3').is(':checked'))) {
         alert('약관 동의는 필수입니다.');   
         return;
      }else {
         
         if(!($("#phoneDoubleChk").val() == 'true')){
			alert('휴대폰 본인 인증을 진행해주세요.');
			return;
				
           } else {
        	 $("select[name=userPhone1]").removeAttr('disabled');  
             $('#joinForm').submit();
           }
      }
   });
   
   //기업
   //아이디 중복 체크
   $('#idCheckBtn2').click(function() {
      
      const userId = $('#userId2').val();
      
      if(userId === '') {
         alert('아이디는 필수값입니다.');
         return;
      }
   
   $.ajax({
      type: 'post',
      url: '<c:url value="/user/idCheck" />',
      data: userId,
      contentType: 'application/json',
      success: function(data) {
         if(data === 'ok') {
            $('#userId2').attr('readonly', true);
            $('#msgId2').html('사용 가능한 아이디입니다.');
         } else {
            $('#msgId2').html('중복된 아이디입니다.');
         }
      },
      error: function() {
         alert('서버 에러입니다. 관리자에게 문의하세요.');
      }
   }); //중복확인 비동기 통신 끝.
   
   }); //아이디 중복 체크 끝.
   
   $('#joinBtn2').click(function() {
      
	 if($('#file').val() === ''){
		 alert('기업 대표 이미지 파일을 첨부해주세요.');
         $('#file').focus();
         return;
  	 }else if($('#corType').val() == null){
         alert('기업형태를 선택해주세요.');
         $('#corType').focus();
         return;
         
      } else if($('#businessNum').val() === ''){
         alert('사업자등록번호를 입력해주세요.');
         $('#businessNum').focus();
         return;
      } else if($('#compName').val() === ''){
         alert('회사명을 입력해주세요.');
         $('#compName').focus();
         return;
      } else if($('#ceo').val() === ''){
         alert('대표자명을 입력해주세요.');
         $('#ceo').focus();
         return;
       } else if(!$('#userId2').attr('readonly')) {
         alert('아이디 중복체크는 필수입니다.');
         return;
      } else if($('#userPw2').val() === '' || $('#userPw2').val() !== $('#pwConfirm2').val()) {
         alert('비밀번호 규칙을 확인하세요.');
         $('#userPw2').focus();
         return;
      } else if($('#userName2').val() === '') {
         alert('이름은 필수입니다.');
         $('#userName2').focus();
         return;
      } else if(!($('#agree4').is(':checked') && $('#agree5').is(':checked') && $('#agree6').is(':checked'))) {
         alert('약관 동의는 필수입니다.');
         return;
      
      } else {
         
           var regex4 = /^[0-9]{10}$/;

           if(!($("#phoneDoubleChk2").val() == 'true')){
   			alert('휴대폰 본인 인증을 진행해주세요.');
   			return;   				
          } else if(!(regex4.test(document.getElementById("businessNum").value )) ){
              alert('사업자번호를 다시 확인해 주세요.');
             $('#businessNum').focus();
           } else {
        	 $("select[name=userPhone1]").removeAttr('disabled');  
             $('#joinForm2').submit();
           }
      }

   });

   
    $('.choice a').click(function(){
        let index = $(this).index();
        index++;
        $('.choice a').removeClass('active');
        $(this).addClass('active');

        $('.content').removeClass('on');
        $('#contents'+index).addClass('on');
    })

    //약관동의 자세히 보기
    $('.term1 label').click(function(){

        var className = $('#expl1').attr('class');
        if(className=='up'){
        $('#expl1').removeClass('up');
        $('#expl1').addClass('down');
        }
        else{
        $('#expl1').removeClass('down');
        $('#expl1').addClass('up');
        }
     })

     $('.term2 label').click(function(){

        var className = $('#expl2').attr('class');
        if(className=='up'){
        $('#expl2').removeClass('up');
        $('#expl2').addClass('down');
        }
        else{
        $('#expl2').removeClass('down');
        $('#expl2').addClass('up');
        }
    })
     $('.term3 label').click(function(){

        var className = $('#expl3').attr('class');
        if(className=='up'){
        $('#expl3').removeClass('up');
        $('#expl3').addClass('down');
        }
        else{
        $('#expl3').removeClass('down');
        $('#expl3').addClass('up');
        }
    })
     $('.term4 label').click(function(){

        var className = $('#expl4').attr('class');
        if(className=='up'){
        $('#expl4').removeClass('up');
        $('#expl4').addClass('down');
        }
        else{
        $('#expl4').removeClass('down');
        $('#expl4').addClass('up');
        }
    })
     $('.term5 label').click(function(){

        var className = $('#expl5').attr('class');
        if(className=='up'){
        $('#expl5').removeClass('up');
        $('#expl5').addClass('down');
        }
        else{
        $('#expl5').removeClass('down');
        $('#expl5').addClass('up');
        }
    })

    // '출생 연도' 셀렉트 박스 option 목록 동적 생성
    const birthYearEl = document.querySelector('#birth-year')
    // option 목록 생성 여부 확인
    isYearOptionExisted = false;
    birthYearEl.addEventListener('focus', function () {
    // year 목록 생성되지 않았을 때 (최초 클릭 시)
    if(!isYearOptionExisted) {
        isYearOptionExisted = true
        for(var i = 1940; i <= 2022; i++) {
        // option element 생성
        const YearOption = document.createElement('option')
        YearOption.setAttribute('value', i)
        YearOption.innerText = i
        // birthYearEl의 자식 요소로 추가
        this.appendChild(YearOption);
        }
    }
    });

    const birthMonthEl = document.querySelector('#birth-month')
    isMonthOptionExisted = false;
    birthMonthEl.addEventListener('focus', function () {
    if(!isMonthOptionExisted) {
        isMonthOptionExisted = true
        for(var i = 1; i <= 12; i++) {
        const MonthOption = document.createElement('option')
        MonthOption.setAttribute('value', i)
        MonthOption.innerText = i
        this.appendChild(MonthOption);
        }
    }
    });

    const birthDayEl = document.querySelector('#birth-day')
    isDayOptionExisted = false;
    birthDayEl.addEventListener('focus', function () {
    if(!isDayOptionExisted) {
        isDayOptionExisted = true
        for(var i = 1; i <= 31; i++) {
        const DayOption = document.createElement('option')
        DayOption.setAttribute('value', i)
        DayOption.innerText = i
        this.appendChild(DayOption);
        }
    }
    });
    
    // 파일 업로드 INPUT 파일의 URL을 읽어서 깔기 (FileReader,readAsDataURL) 
    function readURL(input) {
        if (input.files && input.files[0]) {
           
            var reader = new FileReader();
            reader.readAsDataURL(input.files[0]);                     
            reader.onload = function(event) { 
                $('#fileImg').attr("src", event.target.result); 
                console.log(event.target);
            }
        }
     }
    $("#file").change(function() {
         readURL(this); 
         
     });
    
    
    
    
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




    /*아이디 형식 검사 스크립트*/
    var id = document.getElementById("userId");
    id.onkeyup = function() {
        /*자바스크립트의 정규표현식 입니다*/
        /*test메서드를 통해 비교하며, 매칭되면 true, 아니면 false반*/
        var regex = /^[A-Za-z0-9+]{4,12}$/; 
        if(regex.test(document.getElementById("userId").value )) {
            document.getElementById("userId").style.borderColor = "green";
            document.getElementById("msgId").innerHTML = "아이디중복체크는 필수 입니다";

        } else {
            document.getElementById("userId").style.borderColor = "red";
            document.getElementById("msgId").innerHTML = "";
        }
    }
    /*비밀번호 형식 검사 스크립트*/
    var pw = document.getElementById("userPw");
    pw.onkeyup = function(){
        var regex = /^[A-Za-z0-9+]{8,16}$/;
         if(regex.test(document.getElementById("userPw").value )) {
            document.getElementById("userPw").style.borderColor = "green";
            document.getElementById("msgPw").innerHTML = "사용가능합니다";
        }  else {
            document.getElementById("userPw2").style.borderColor = "red";
            document.getElementById("msgPw2").innerHTML = "";
        }
    }
    /*비밀번호 확인검사*/
    var pwConfirm = document.getElementById("pwConfirm2");
    pwConfirm.onkeyup = function() {
        var regex = /^[A-Za-z0-9+]{8,16}$/;
        if(document.getElementById("pwConfirm2").value == document.getElementById("userPw2").value ) {
            document.getElementById("pwConfirm2").style.borderColor = "green";
            document.getElementById("msgPw-c2").innerHTML = "비밀번호가 일치합니다";
        } else {
            document.getElementById("pwConfirm2").style.borderColor = "red";
            document.getElementById("msgPw-c2").innerHTML = "비밀번호 확인란을 확인하세요";
        }
    }  
    
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
	
	//기업 휴대폰 인증
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
		        		$(".successPhoneChk2").text("인증번호를 입력한 뒤 본인인증을 눌러주십시오.");
		        		$(".successPhoneChk2").css("color","blue");
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
			$(".successPhoneChk2").text("인증번호가 일치합니다.");
			$(".successPhoneChk2").css("color","green");
			$("#phoneDoubleChk2").val("true");
			$("#phone22").attr("disabled",true);
		}else{
			$(".successPhoneChk2").text("인증번호가 일치하지 않습니다.");
			$(".successPhoneChk2").css("color","red");
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

