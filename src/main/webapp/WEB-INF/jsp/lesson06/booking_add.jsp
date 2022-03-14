<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section class="booking-add d-none">
	<div class="insert">
		<div class="add-text text-center mt-4 mb-4">예약 하기</div>
		
		<label for="name"><b>이름</b></label>
		<input type="text" class="form-control" id="name" name="name">
		
		<label for="date" class="mt-3"><b>예약날짜</b></label>
		<input type="text" class="form-control" id="date" name="date">
		
		<label for="day" class="mt-3"><b>숙박일수</b></label>
		<input type="text" class="form-control" id="day" name="day">
		
		<label for="headcount" class="mt-3"><b>숙박인원</b></label>
		<input type="text" class="form-control" id="headcount" name="headcount">
		
		<label for="phoneNumber" class="mt-3"><b>전화번호</b></label>
		<input type="text" class="form-control" id="phoneNumber" name="phoneNumber">
		
		<button type="button" id="addBtn" class="btn btn-warning mt-4 mb-4 form-control">예약하기</button>
	</div>
</section>