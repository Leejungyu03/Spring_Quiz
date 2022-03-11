<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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