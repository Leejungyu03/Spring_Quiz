<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통나무 팬션 예약 목록</title>
<link rel="stylesheet" type="text/css" href="/css/lesson06/booking_style.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
	<div id="wrap" class="container">
		<jsp:include page="header.jsp" />
		<jsp:include page="nav.jsp" />
		<section class="booking-list">
			<div class="list-text text-center mt-4 mb-4">예약 목록 보기</div>
			<table class="table text-center">
				<thead>
					<tr>
						<th>이름</th>
						<th>예약날짜</th>
						<th>숙박일수</th>
						<th>숙박인원</th>
						<th>전화번호</th>
						<th>예약상태</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${bookingList}" var="bookingList">
					<tr>
						<td>${bookingList.name}</td>
						<td>
							<fmt:formatDate value="${bookingList.date}" pattern="yyyy년 M월 d일"/>
						</td>
						<td>${bookingList.day}</td>
						<td>${bookingList.headcount}</td>
						<td>${bookingList.phoneNumber}</td>
						<td>
						<c:choose>
							<c:when test="${bookingList.state eq '확정'}">
								<span class="text-success">${bookingList.state}</span>
							</c:when>
							<c:otherwise>
								<span class="text-info">${bookingList.state}</span>
							</c:otherwise>
						</c:choose>
						</td>
						<td><button type="button" class="btn btn-danger">삭제</button></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</section>
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>