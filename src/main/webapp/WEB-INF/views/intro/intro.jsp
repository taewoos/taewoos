<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../include/header.jsp"%>


<section class="section3">
	<div class="container">
		<div class="row">
			<div id="inner_wrap">
				<!-- 내용 -->
				<div class="title_bar col-md-12">
					<h1 id="title">박람회 개요</h1>
				</div>
				<div class="introduce_top col-md-12">
					<p>
						공공기관 <strong>청년인재</strong>가<br>
						<strong>선도형 경제</strong>를 이끕니다.
					</p>
				</div>
				<div class="sub_con">
					<h2 class="sub_title">
						<strong>행사 목적</strong>
					</h2>
					<hr>
					<p class="sub_text">
						기획재정부가 주최하고 한국조세재정연구원이 주관하는 “<strong>2022 공공기관 채용정보박람회</strong>”는
						NCS기반 블라인드 채용, 청년인턴, 고졸채용, 지역인재채용, 장애인채용 등 공공기관의 2022년도 채용정보와
						취업준비생들에게 실질적으로 도움이 되는 다양한 프로그램을 제공하고자 마련한 행사입니다.
					</p>

					<div class="outline_wrap">
						<div class="col-md-6">
							<p class="poster">
								<img src="${pageContext.request.contextPath}/resources/img/poster.jpg" alt="poster">
							</p>
						</div>

						<div class="table_line col-6">
							<table>
								<tbody>
									<tr>
										<th scope="row">행사명</th>
										<td><strong class="fcor0">「2022 공공기관 채용정보박람회」</strong></td>
									</tr>
									<tr>
										<th scope="row">일정</th>
										<td>
											<ul class="bul01">
												<li>2022. 3. 15 (화) ~ 7. 12 (화) 홈페이지 사전 오픈</li>
												<li>2022. 7. 13 (수) ~ 9. 02 (금) 홈페이지 정식 오픈</li>
											</ul>

										</td>
									</tr>
									<tr>
										<th scope="row">장소</th>
										<td>
											<ul class="bul01">
												<li>공공기관채용정보박람회 홈페이지 www.publicjob.kr</li>
												<li>기획재정부 유튜브 채널 (개막식)</li>
												<li>한국조세재정연구원 유튜브 채널<br>(채용설명회, 토크콘서트, 특강 등)
												</li>
											</ul>
										</td>
									</tr>
									<tr>
										<th scope="row">주최</th>
										<td>
											<ul class="radio_group pt0">
												<li><img src="${pageContext.request.contextPath}/resources/img/logo.png" alt="coffeekong" style="width: 200px"></li>
											</ul>
										</td>
									</tr>

									<tr>
										<th scope="row">주관</th>
										<td>
											<ul class="radio_group pt0">
												<li><img src="${pageContext.request.contextPath}/resources/img/intro_table_img1.png" alt="intro_table_img1"></li>


											</ul>
										</td>
									</tr>
									<tr>
										<th scope="row">후원</th>
										<td>
											<ul class="radio_group pt0">
												<li><img src="${pageContext.request.contextPath}/resources/img/intro_table_img2.png" alt="intro_table_img2"></li>
											</ul>
										</td>
									</tr>
									<tr>
										<th scope="row">참여기관</th>
										<td>151개 공공기관</td>
									</tr>
									<tr>
										<th scope="row">참가대상</th>
										<td>취업준비생, 일반 구직자 등</td>
									</tr>
									<tr>
										<th scope="row">행사구성</th>
										<td>
											<ul class="bul01">
												<li>개막식</li>
												<li>공공기관 채용설명회</li>
												<li>공공기관 인사담당자 토크콘서트</li>
												<li>공공기관 신입사원 토크콘서트</li>
												<li>참여기관 채용정보 제공 및 온라인상담 운영</li>
												<li>NCS특별강연 및 공공기관 채용전략 특강</li>
												<li>공공기관 모의토론면접</li>
												<li>블라인드 자기소개서 컨설팅</li>
												<li>NCS직업기초능력검사, 인성검사, AI모의면접 등</li>
											</ul>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- 지도 api -->
<section class="maps">
	<div class="container">
		<div class="row">
			<div class="col-md-12 col-xs-12">
				<h2 class="sub_title">
					<strong>박람회 오시는길</strong>
				</h2>
				<hr>
				<br>
			</div>
			<div class="col-md-12">
				<div id="map" style="width:100%;height:350px;"></div>

				<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c50ac6dd6a38fb36e8df0f186254bb8b&libraries=services"></script>
				<script>
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				    mapOption = {
				        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				        level: 3 // 지도의 확대 레벨
				    };  
				
				// 지도를 생성합니다    
				var map = new kakao.maps.Map(mapContainer, mapOption); 
				
				// 주소-좌표 변환 객체를 생성합니다
				var geocoder = new kakao.maps.services.Geocoder();
				
				// 주소로 좌표를 검색합니다
				geocoder.addressSearch('서울 강남구 테헤란로 7길 7역삼동 에스코빌딩', function(result, status) {
				
				    // 정상적으로 검색이 완료됐으면 
				     if (status === kakao.maps.services.Status.OK) {
				
				        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				
				        // 결과값으로 받은 위치를 마커로 표시합니다
				        var marker = new kakao.maps.Marker({
				            map: map,
				            position: coords
				        });
				
				        // 인포윈도우로 장소에 대한 설명을 표시합니다
				        var infowindow = new kakao.maps.InfoWindow({
				            content: '<div style="width:150px;text-align:center;padding:6px 0;font-weight: bold;border: 1px solid #0080ff;font-size: 16px;">커피콩 채용박람회</div>'
				        });
				        infowindow.open(map, marker);
				
				        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				        map.setCenter(coords);
				    } 
				});    
				</script>
			</div>
			
			<div class="col-md-12 ">
				<br>
				<p class="maps_title">
					<b>박람회 일시 : 2022. 7. 13 (수) ~ 9. 02 (금) 10:00 ~ 17:00 (현장등록 가능)</b><br>
					<b>박람회 장소 : 서울 강남구 테헤란로 7길 7(역삼동 에스코빌딩 7층)</b>
				</p>
				<p class="maps_con">
					2022년 하반기 커피콩 채용박람회는 대면행사로 진행되며,<br> 참여를 원하시는 지원자는 온라인 사전등록 또는
					행사 당일 현장 역삼동 에스코빌딩 704호 방문 하시면 참여 가능합니다. <br>
				</p>
			</div>
		</div>
	</div>
</section>

<%@ include file="../include/footer.jsp"%>











