
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<header>
<title>침 그리고 찌르다.</title>
	<c:set var="varSessionId" value="${sessionId }" scope="session" />
	<c:set var="varSessionState" value="${sessionState }" scope="session"/>
	<c:set var="varSessionName" value="${sessionName }" scope="session"/>
	<nav class="navbar navbar-expand-lg navbar-light shadow-sm">
		<div class="container">

			<a class="navbar-brand" href="main"><span>침, 그리고 찌르다</span></a>


			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupport" aria-controls="navbarSupport"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupport">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link" href="introduce">병원소개</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="myselfTest">자가진단</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="reviewList">치료후기</a>

					</li>

					<li class="nav-item"><a class="nav-link" href="pConsultCount">온라인상담</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="mediaList">강연&방송</a>

					</li>
					<c:choose>
					<c:when test="${varSessionState==4}">
                	 		<li class="nav-item"><a
								class="btn btn-primary ml-lg-3"
								style="background-color: #5F5F5F" href="empOperation">관리자</a>
							</li>
					</c:when>
					<c:when test="${varSessionState==2}">
                	 		<li class="nav-item"><a
								class="btn btn-primary ml-lg-3"
								style="background-color: #5F5F5F" href="empOperation">직원 ID : ${varSessionId }</a>
							</li>
					</c:when>
					<c:when test="${empty varSessionId }">
							<li class="nav-item"> <a
								class="btn btn-primary ml-lg-3"
								style="background-color: #5F5F5F" href="login">로그인 / 회원가입</a>

							</li>
					</c:when>
					<c:when test="${!empty varSessionId}">
                	  <li class="nav-item"><a
								class="nav-link"
								 href="myPage">마이페이지</a></li>
                   	  <li class="nav-item"><a
								class="btn btn-primary ml-lg-3"
								style="background-color: #5F5F5F" href="logout">로그아웃</a></li>
					</c:when>
						
					</c:choose>
				</ul>
			</div>
			<!-- .navbar-collapse -->
		</div>
		<!-- .container -->
	</nav>
</header>
