<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/common/style.jspf"%>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
	crossorigin="anonymous"></script>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="google-site-verification"
	content="IE2hToDnQFmj0qovhKUWmqnaQyMPi7QndNEDR6uoVpI">
<!-- <meta name="twitter:image" content="https://ddcfsharestroage.blob.core.windows.net/share/Store/Homepage/Main/Pc/202201/20220124135922977001.jpg">
    <meta property="og:image" content="https://ddcfsharestroage.blob.core.windows.net/share/Store/Homepage/Main/Pc/202201/20220124135922977001.jpg"> -->
<link rel="icon" href="/favicon.ico">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="">
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;200;400;500;600;700;800;900&amp;display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/gh/moonspam/NanumBarunGothic@latest/nanumbarungothicsubset.css">
<link rel="stylesheet" href="common/css/EditionList.css">
<script type="text/javascript" async=""
	src="https://www.google-analytics.com/analytics.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAvnLt4QUXB59ZsNU2mzaeLmPhniiV0QnE&amp;language=en"></script>
<title>EditionsList</title>
<script>
	function morelist() {
		const div = document.getElementById('more');
		more.style.display = 'none';
		const morediv = document.getElementById('morelist');
		morediv.style.display = 'block';
	}
</script>
</head>
<body>
	<c:choose>
		<c:when test="${empty member }">
			<%@include file="/common/guestMenu.jspf"%>
		</c:when>
		<c:when test="${not empty member }">
			<c:if test="${member.admin eq 'ADMIN' }">
				<%@include file="/common/adminMenu.jspf"%>
			</c:if>
			<c:if test="${member.admin eq 'NORMAL' }">
				<%@include file="/common/MemberMenu.jspf"%>
			</c:if>
		</c:when>
	</c:choose>
	<%@include file="/common/store.jspf"%>
	<noscript>
		<strong>We're sorry but D MUSEUM | DAELIM MUSEUM | 구슬모아당구장
			doesn't work properly without JavaScript enabled. Please enable it to
			continue.</strong>
	</noscript>
	<div id="app">
		<div id="contents">


			<main>
				<div class="root-container">
					<div class="content-wrapper">
						<section data-v-17147178=""
							class="sub-contents-wrap shop-result category">
							<div data-v-17147178="" class="category-visual-area">
								<strong data-v-17147178="">EDITIONS</strong><a
									data-v-17147178="" href="#">
									<div data-v-17147178="" class="img-wrap">
										<div data-v-17147178="">
											<img data-v-2fed1a9a="" data-v-17147178=""
												src="https://cdn.daelimmuseum.org/Product/Category/Banner/Original/PC/202211/20221103101419943001.png"
												alt="" class="pc-category-img" style=""><img
												data-v-2fed1a9a="" data-v-17147178=""
												src="https://cdn.daelimmuseum.org/Product/Category/Banner/Original/MO/202211/20221103101421959001.png"
												alt="" class="mo-category-img" style="">
										</div>
									</div>
								</a>
							</div>
							<div data-v-080a389a="" data-v-17147178="">
								<div data-v-080a389a="" class="snb-area">
									<ul data-v-080a389a="" class="snb">
										<li data-v-080a389a="" class="on"><a data-v-080a389a=""
											role="button" style="cursor: pointer;" href="EditionsList.do">전체</a></li>
									</ul>
								</div>
								<div data-v-080a389a="" class="sub-contents-area">
									<div data-v-17147178="" data-v-080a389a="" class="container">
										<div data-v-17147178="" data-v-080a389a=""
											class="search-top-area">
											<div data-v-17147178="" data-v-080a389a="" class="count-area"></div>
											<div data-v-47432960="" data-v-17147178=""
												class="sorting-area" data-v-080a389a="">
												<ul data-v-47432960="">
													<li data-v-47432960="" class="on"></li>
													<li data-v-47432960="" class=""><a data-v-47432960=""
														style="cursor: pointer;" href="EditionsSort.do">가격높은순</a></li>
													<li data-v-47432960="" class=""><a data-v-47432960=""
														style="cursor: pointer;" href="EditionsAsc.do">가격낮은순</a></li>
												</ul>
											</div>
										</div>
										<div data-v-17147178="" data-v-080a389a=""
											class="search-result-area">
											<ul data-v-17147178="" data-v-080a389a="">
												<c:if test="${not empty EditionsList }">
													<c:forEach var="list" items="${EditionsList }"
														varStatus="status" begin="0" end="7">
														<li data-v-17147178="" data-v-080a389a="" class=""><a
															data-v-17147178=""
															href="getProduct.do?productnum=${list.productnum }"
															class="" data-v-080a389a="">
																<div class="img-area">
																	<img
																		src="${pageContext.request.contextPath}/imgs/${list.photo1 }"
																		alt="${list.productname }">
																	<!---->
																</div>
																<div data-v-17147178="" class="info-area">
																	<p data-v-17147178="" class="disc">${list.productname }</p>
																	<c:if test="${list.discount eq '0' }">
																		<div data-v-17147178="" class="amount">
																			<!---->
																			<span data-v-17147178="" class="reduced"> <em
																				data-v-17147178=""><fmt:formatNumber
																						value="${list.price}" pattern="#,###" /></em>원
																			</span>
																		</div>
																	</c:if>
																	<c:if test="${list.discount ne '0' }">
																		<div data-v-17147178="" class="amount">
																			<span data-v-17147178="" class="cost"><del
																					data-v-17147178="">
																					<fmt:formatNumber value="${list.price}"
																						pattern="#,###" />
																				</del>원 </span> <span data-v-17147178="" class="reduced"><em
																				data-v-17147178=""><fmt:formatNumber
																						type="number" pattern="#,###"
																						value="${list.price * (100 - list.discount) / 100 }" /></em>원
																			</span> <span data-v-17147178="" class="discount">
																				${list.discount } % </span>
																		</div>
																	</c:if>
																</div>
														</a></li>
													</c:forEach>
												</c:if>
												<c:if test="${empty EditionsList }">
													<tr>
														<td colspan="4" class="center">데이터가 없습니다</td>
													</tr>
												</c:if>
											</ul>
											<div data-v-26e42198="" data-v-17147178="" class="btn-area"
												data-v-080a389a="" id="more">
												<button data-v-26e42198="" id="btn52" type="button"
													class="secondary medium more" onclick="morelist()">더보기</button>
											</div>
											<div id="morelist" style="display: none;">
												<ul data-v-17147178="" data-v-080a389a="">
													<c:if test="${not empty EditionsList }">
														<c:forEach var="list" items="${EditionsList }"
															varStatus="status" begin="8">
															<li data-v-17147178="" data-v-080a389a="" class=""><a
																data-v-17147178=""
																href="getProduct.do?productnum=${list.productnum }"
																class="" data-v-080a389a="">
																	<div class="img-area">
																		<img
																			src="${pageContext.request.contextPath}/imgs/${list.photo1 }"
																			alt="${list.productname }">
																		<!---->
																	</div>
																	<div data-v-17147178="" class="info-area">
																		<p data-v-17147178="" class="disc">${list.productname }</p>
																		<c:if test="${list.discount eq '0' }">
																			<div data-v-17147178="" class="amount">
																				<!---->
																				<span data-v-17147178="" class="reduced"> <em
																					data-v-17147178=""><fmt:formatNumber
																							value="${list.price}" pattern="#,###" /></em>원
																				</span>
																			</div>
																		</c:if>
																		<c:if test="${list.discount ne '0' }">
																			<div data-v-17147178="" class="amount">
																				<span data-v-17147178="" class="cost"><del
																						data-v-17147178="">
																						<fmt:formatNumber value="${list.price}"
																							pattern="#,###" />
																					</del>원 </span> <span data-v-17147178="" class="reduced"><em
																					data-v-17147178=""><fmt:formatNumber
																							type="number" pattern="#,###"
																							value="${list.price * (100 - list.discount) / 100 }" /></em>원
																				</span> <span data-v-17147178="" class="discount">
																					${list.discount } % </span>
																			</div>
																		</c:if>
																	</div>
															</a></li>
														</c:forEach>
													</c:if>
													<c:if test="${empty EditionsList }">
														<tr>
															<td colspan="4" class="center">데이터가 없습니다</td>
														</tr>
													</c:if>
												</ul>
											</div>
										</div>
									</div>
								</div>
							</div>
						</section>
					</div>
				</div>
			</main>

			<button class="goto-top show" onclick="gotop()">상단으로 이동</button>
		</div>
	</div>
</body>
<%@include file="/common/footer.jspf"%>
</html>