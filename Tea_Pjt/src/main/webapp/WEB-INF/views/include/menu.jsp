<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-1 logo">
				<a href="#"><img alt="logo" src=""></a>
			</div>
			<nav class="col-sm-7 menu">
				<ul>
					<li>Brand</li>
					<li>Menu</li>
					<li>Store</li>
					<li>Benefit</li>
					<li>Event&News</li>
				</ul>
			</nav>
			<nav class="col-sm-4 menu2">
				<ul>
					<li><a href="#">고객센터</a></li>
					<li><a href="#">공지사항</a></li>
					<c:choose>
						<c:when test="${sessionScope.user ==null}">
							<li><a href="${path}/member/login.do" title="로그인"><span
								class="glyphicon glyphicon-log-in"></span></a></li>
							<li><a href="${path}/member/signup.do" title="회원가입"><span
								class="glyphicon glyphicon-user"></span></a></li>
						</c:when>
						<c:otherwise>
							<li><a href="userInfo.do">${user.user_id}(${user.user_name})님 환영합니다!</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</nav>
		</div>
		<div class="row submenu" style="background: black;">
			<div class="col-sm-1"></div>		
			<div class="col-sm-7 ">
				<ul>
					<li><a href="${path}/menu/introduceGongcha.do">브랜드소개</a></li>
					<li><a href="#">주문방법</a></li>
					<li><a href="#">매장찾기</a></li>
					<li><a href="#">제휴혜택</a></li>
					<li><a href="#">이벤트</a></li>
				</ul>
	
				<ul>
					<li><a href="#">공차의약속</a></li>
					<li><a href="#">주문방법</a></li>
					<li><a href="#"></a></li>
					<li><a href="#"></a></li>
					<li><a href="#"></a></li>
				</ul>
	
				<ul>
					<li><a href="#">브랜드소개</a></li>
					<li><a href="#">주문방법</a></li>
					<li><a href="#"></a></li>
					<li><a href="#"></a></li>
					<li><a href="#"></a></li>
				</ul>
	
				<ul>
					<li><a href="#">브랜드소개</a></li>
					<li><a href="#">주문방법</a></li>
					<li><a href="#"></a></li>
					<li><a href="#"></a></li>
					<li><a href="#"></a></li>
				</ul>
			</div>
			<div class="col-sm-4">
			</div>	
		</div>

	</div>