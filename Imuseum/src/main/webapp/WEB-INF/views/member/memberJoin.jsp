<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>VISIT | I MUSEUM</title>
<%@include file = "/common/style.jspf" %>
<link rel="stylesheet" type="text/css"
	href="/Imuseum/common/css/memberJoin.css"/>
</head>
<body>
<!-- 회원 정보로 헤더 표시 -->
<c:choose>
	<c:when test="${empty member }">
		<%@include file = "/common/guestMenu.jspf" %>	
	</c:when>	
	<c:when test="${not empty member }">
		<c:if test="${member.admin eq 'ADMIN' }">
			<%@include file = "/common/adminMenu.jspf" %>
		</c:if>
		<c:if test="${member.admin eq 'NORMAL' }">
			<%@include file = "/common/MemberMenu.jspf" %>
		</c:if>
	</c:when>
</c:choose>
<%@include file = "/common/main.jspf" %>
<!-- 모달창 -->
<%@include file = "/common/MemberModal.jspf" %>

<section class="sub-contents-wrap notosanskr">
	<div class="container" style="margin: 0 auto;">
		<div class="row">
			<div class="col-7" style="margin-top: 40px; margin-bottom: 40px;">
				<p style="font-size: 4em; font-weight: bold;">BECOME A MEMBER</p>
			</div>
			<div class="col-5 text-end" id="noweb">
				<i class="bi bi-house-fill" onclick="goHome.do" style="cursor: pointer; font-size: 1.1em;"></i>
				<span>&nbsp;&nbsp;| BECOME A MEMBER </span>
			</div>
		</div>
	</div>
	<div class="visual membershipinfo">
	</div>
		<div class="visual-content">
			<h5>지금 IMUSEUM에 가입하고 <br>특별한 혜택을 만나보세요!</h5>
			<ul>
				<li>
					<p>
						혜택 1.
					</p>	
						<span>
						신규가입 후,
						<br>
						첫 전시 관람 시 50%할인
						</span>
				</li>
				<li>
					<p>
						혜택 2.
					</p>
						<span>
						전시 티켓 30% 할인
						<br>
						(상시, 본인 티켓에 한함)
						</span>
				</li>
				<li>
					<p>
						혜택 3.
					</p>
						<span>
						신규 가입 후, 뮤지엄 샵
						<br>
						아트상품 첫 구매 시 30% 할인
						</span>
				</li>						
			</ul>
		</div>
	
	<div class="container2" style="margin-bottom: 100px;">
		<div class="propose-area btn-group">
			<div class="btn-area">
				<button type="button" onclick="location.href='moveToJoin.do'" class="primary arrow">가입하고 혜택 받기</button>
			</div>
			<div class="btn-area">
				<button type="button" class="primary arrow" onclick="location.href='moveTologin.do'">로그인</button>
			</div>
		</div>
		<div class="content-area">
			<h3>등급별 혜택</h3>
			<div class="content-area">
				<ul class="col-divide-area">
					<li>
						<img src="data:image/png;base64,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">
						<dl class="titleAndList">
							<dt>SEED</dt>
							<dd>- 신규 가입 후, 첫 전시 티켓 50% 할인 쿠폰 1매 제공</dd>
							<dd>- 전시 티켓 30% 상시 할인<br>(본인 티켓에 한함)</dd>
							<dd>- 신규 가입 후, 뮤지엄샵 상품 첫 구매 30% 할인 쿠폰 1매 제공 <br>(일부 품목 적용 불가)</dd>
							<dd>- 생일 쿠폰 제공<br>(온라인스토어 5% 할인 쿠폰 1매, 일부 품목 적용 불가)</dd>
						</dl>
						<dl class="titleAndList">
							<dt >SEED 등급 선정 기준</dt>
							<dd >회원 신규 가입 시 또는 등급 선정 기간 내 조건 미 충족으로 등급 하향 시</dd>
						</dl>						
					</li>
					<li>
						<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAASsAAAErBAMAAAB0iriHAAAAIVBMVEVHcEwDAwQDBAUDBAUCAwQDBAUDBAUAAAACBAQDBAUDBAbfK4GUAAAACnRSTlMAXJ6BOufFGW+yWdbxiAAAA/dJREFUeNrtnUtLG1EUgCdmdKIrQayQVUuhlKzcuGhWaVUKriyVPrKyFBWyKhX7cGW7UOiqdFVcaTVpc35l5yYxzuROnFuI9wz0+1ZxJpCPc899DMw5BgEAAAAAAAAAAAAAAAAAAACAGh/Xnr4rmtPqg6bEvLjfKJDUp1MZ8rMwIXsiSX4VJGB3+jrt3Z3+h858EaxWjMrrL70YPX5kUqx9pG+1aOKzNPwzMrFrq4/j59jieSrL901+Ked9GA/aq5Fr+/G1LV2tehyZzAgua1rNZufRYpasR+Jl9HvG5aglclc1WOeZN8qq4TqV9pgpt64YrimRvTG3oqZc6E3Dztj16UBEaQ8KxwerF65LHa2DsZnVz662zlLfujEeJaWkr4jceFKo6YzigXRvvD8jbQ2tmvzOmxEK564o91drsqmxluaN0aH88a91OGY7/BfxW1niN/OH2f9C38xP6Frmqee2d57cRXxDzvxnfDf3O9O56TdxXH6y7KA+8Yl45jDQ3qdi1SWdRXw/x9ZcHrlOvW8/LZdAfPN+thGZ1EhPdqNuO80Lz5t1KB2Hb835Xk9DpyVpOudINnFKTk/NM77PzW5as8XUmvK9KaKFFlpooYUWWmihhRZaaKGFFlpooYUWWmihhRZaaKGFFlpooYUWWmihhRZaaKGFFlpo/c9aLm/pzvrWCh21Ln1rubxqPeNfy+XFdO+vWme9xr/aGL0yJ2eetZpW9VFoj5j31/iDllUfVrZLlr0XPQR1q3IlQ6vmvaNAVbbztVre63wOrUl2pbUwVImcylsmyoy1gA+0Ste+FafFbaKUrU1xoFW9Li2d9V9laq+nfa2SyMvxA+1j4TrK0qom2mnUrWnhY4XYzNAqJbufNBUKq61K4Z5WMlgVjUphqzzZaKWCNa3RqcKqQjdayWDFw+w/4+2a/VgrFaxQp5nN4chiGWulgqXU4WC0H0RZOqkmRHX/5cuDjfgyrZVqARSK/xr0HhvpbiJGKxGsA61eI3GCb6e1EsHS68xi+tiktVLB0upjY1ok7SW1ksFq6XX9iZM+0fYndTpd10r4wUhtZWrFaddRszJ5fZ1BSa36TX2Kbp8Pie5yCa34cjfQ5FTkmaVV0e7tZpJI3oxoFaATnhmvQd/AK633Begb2O+y2J0fakXHputiI1CnbnpS/jjpaUVfW2bDnte3CqKa8broaZV7LTyXgyIQraS0OidBQVhtXmu9bQSFIVq413/yebgUFIyy4pkBLbTQQgsttNBCCy200EILLbTQQgsttNDywPHugB1pX33cPdK2CiWLS22tUqbWubaW+dc9NnvquRWuZRAAAAAAAAAAAAAAAAAAAAAAeOcvOauQU0PIx2wAAAAASUVORK5CYII=">
						<dl class="titleAndList">
							<dt>TREE</dt>
							<dd>- 전시 티켓 30% 상시 할인<br>(본인 티켓에 한함)</dd>
							<dd>- 뮤지엄샵 상품 구매 시 5% 상시 할인<br>(일부 품목 적용 불가)</dd>
							<dd>- 생일 쿠폰 제공<br>(온라인스토어 5% 할인 쿠폰 1매, 일부 품목 적용 불가)</dd>
							<dd>- 이벤트 프로그램 5% 쿠폰 1매 제공<br>(일부 프로그램 적용 불가)</dd>
						</dl>
						<dl class="titleAndList">
							<dt >TREE 등급 선정 기준</dt>
							<dd>
								전시 또는 프로그램 3회 이상 관람 AND
								<br>
								온·오프라인 뮤지엄샵 상품 누적 10만원 이상 구매 시
								<br>
								또는 등급 선정 기간 내 조건 미 충족으로 등급 하향 시
								<br>
							</dd>
						</dl>						
					</li>
					<li>
						<img src="data:image/png;base64,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">
						<dl class="titleAndList">
							<dt>FORESET</dt>
							<dd>- 전시 티켓 30% 상시 할인<br>(본인 티켓에 한함)</dd>
							<dd>- 전시 관람 티켓 1매 제공</dd>							
							<dd>- 뮤지엄샵 상품 구매 시 15% 상시 할인<br>(일부 품목 적용 불가)</dd>
							<dd>- 생일 쿠폰 제공<br>(온라인스토어 15% 할인 쿠폰 1매, 일부 품목 적용 불가)</dd>
							<dd>- 이벤트 프로그램 10% 쿠폰 1매 제공<br>(일부 프로그램 적용 불가)</dd>
						</dl>
						<dl class="titleAndList">
							<dt >FOREST 등급 선정 기준</dt>
							<dd>
								전시 또는 프로그램 5회 이상 관람 AND
								<br>
								온·오프라인 뮤지엄샵 상품 누적 20만원 이상 구매 시
							</dd>
						</dl>						
					</li>
				</ul>
			</div>	
		</div>
		<div class="normal-area">
			<h3>등급 산정 정책</h3>
			<div class="content-area st">
				<ul class="detail-info-list">
					<li>등급 평가 기간은 매년 1월 1일부터 다음 해 12월 31일까지입니다. (1월 1일 수행한 미션은 다음 해 등급 평가 시 합산됩니다.)</li>
					<li>2022년 3월 1일 이전 가입한 회원의 경우 TREE 등급으로 시작하여 2023년 12월 31일까지 적용됩니다.</li>
					<li>휴면계정 전환 시 회원 등급이 초기화됩니다.</li>
					<li>회원 등급 조정은 미션 수행 이력에 따라 기존 등급 승급 시점으로부터 2년 후 1월 2일부터 적용됩니다. (단, SEED 등급은 신규 회원 가입 시점부터 적용)</li>
					<li>회원 등급은 매년 1월 2일 ~ 다음 해 12월 31일까지 유지됩니다. (신규 회원의 경우 가입한 다음 해 12월 31일까지)</li>
				</ul>
			</div>
		</div>		
		<div class="normal-area">
			<h3>혜택별 상세 정보</h3>
			<div class="content-area st">
				<ul class="detail-info-list">
					<li> 전시 또는 프로그램 관람 횟수 카운팅은 유료 전시 및 프로그램에 한하여 적용됩니다. </li>
					<li> 동일 전시 재관람 혜택 이용 시 전시 관람 횟수로 카운팅되지 않습니다. </li>
					<li> 상품 누적 구매액은 실제 결제금액 기준으로 집계됩니다. </li>
					<li> 상품 쿠폰 구분 : 1) 뮤지엄샵 (오프라인 전용), 2) 온라인스토어 (온라인 전용) </li>
					<li> 등급별 발행된 쿠폰 및 할인 혜택은 해당 등급 유지기간 종료 시 사용 여부와 관계없이 소멸됩니다. </li>
					<li> 생일쿠폰은 회원정보에 등록된 생일 기준 7일 전 발급되며, 발급일로부터 1개월 간 사용 가능합니다.   </li>
					<li> 쿠폰과 할인혜택은 중복 적용이 불가합니다. </li>
					<li> 혜택, 등급선정기준, 등급조정 등 회원 정책은 미술관 사정에 따라 변경될 수 있습니다. </li>
				</ul>
			</div>
		</div>		
	</div>
</section>
</body>
<%@include file ="/common/footer.jspf" %>
</html>