<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날씨 정보</title>
<%-- css import --%>
<link rel="stylesheet" type="text/css" href="/css/lesson05/weather_style.css">
<%-- 부트스트랩 --%>
<link 
	rel="stylesheet" 
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" 
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" 
	crossorigin="anonymous">
	
<%-- datepicker를 위해 slim 버전이 아닌 jquery를 import한다. --%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
	
<%-- datepicker --%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
	<div id="wrap">
		<div class="d-flex">
		<section class="left-contents">
			<div class="image d-flex justify-content-center mt-3">
					<img
						src="/image/lesson05/header_logo.png"
						width="25"> <span class="text-white font-weight-bold ml-2">기상청</span>
				</div>
			<nav>
				<ul>
					<li><a href="/lesson05/quiz05/weather_history">날씨</a></li>
					<li><a href="/lesson05/quiz05/add_weather">날씨입력</a></li>
					<li><a href="#">테마날씨</a></li>
					<li><a href="#">관측 기후</a></li>
				</ul>
			</nav>
		</section>
		<section class="right-contents">
			<h3>과거 날씨</h3>
			<table class="table text-center">
				<thead>
					<tr>
						<th>날짜</th>
						<th>날씨</th>
						<th>기온</th>
						<th>강수량</th>
						<th>미세먼지</th>
						<th>풍속</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${weatherHistoryList}" var="weather">
					<tr>
						<td>
							<fmt:formatDate value="${weather.date}" pattern="yyyy년 M월 d일"/>
						</td>
						<td>
						<c:choose>
							<c:when test="${weather.weather eq '비'}">
								<img src="/image/lesson05/rainy.jpg">	
							</c:when>
							<c:when test="${weather.weather eq '맑음'}">
								<img src="/image/lesson05/sunny.jpg">	
							</c:when>
							<c:when test="${weather.weather eq '구름조금'}">
								<img src="/image/lesson05/cloudy.jpg">	
							</c:when>
							<c:when test="${weather.weather eq '흐림'}">
								<img src="/image/lesson05/partlyCloudy.jpg">	
							</c:when>
							<c:otherwise>
								${weather.weather}
							</c:otherwise>
						</c:choose>
						</td>
						<td>${weather.temperatures}℃</td>
						<td>${weather.precipitation}mm</td>
						<td>${weather.microDust}</td>
						<td>${weather.windSpeed}km/h</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</section>
		</div>
		<footer class="d-flex align-items-center">
			<div class="footer-logo ml-5">
				<img class="foot-logo-image"
					src="/image/lesson05/foot_logo.png"
					width="120">
			</div>
			<div class="copyright ml-5">
				<small class="text-secondary"> (07062) 서울시 동작구 여의대방로16길 61 <br>
					Copyright@2020 KMA. All Rights RESERVED.
				</small>
			</div>
		</footer>
	</div>
</body>
</html>