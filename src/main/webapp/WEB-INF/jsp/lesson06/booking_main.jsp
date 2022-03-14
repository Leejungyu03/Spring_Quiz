<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<%-- datepicker --%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
	<div id="wrap" class="container">
		<jsp:include page="header.jsp" />
		<jsp:include page="nav.jsp" />
		<jsp:include page="booking_list.jsp" />
		<jsp:include page="booking_add.jsp" />
		<jsp:include page="booking_check.jsp" />
		<jsp:include page="footer.jsp" />
	</div>
	
	<script>
		$(document).ready(function() {
			
			$('#addBtn').on('click', function(e) {
				
				var name = $('#name').val().trim();
				if (name == '') {
					alert("이름을 입력하세요");
					return;
				}
				
				var date = $('#date').val();
				if (date == '') {
					alert("날짜를 입력하세요");
					return;
				}
				
				var day = $('#day').val();
				if (day == '') {
					alert("숙박일수를 입력하세요");
					return;
				}
				if (isNaN(day)) {
					alert("숙박일수는 숫자를 입력하세요");
					return;
				}
				
				var headcount = $('#headcount').val();
				if (headcount == '') {
					alert("숙박 인원을 입력하세요");
					return;
				}
				if (isNaN(headcount)) {
					alert("숙박인원은 숫자를 입력하세요");
					return;
				} 
				
				var phoneNumber = $('#phoneNumber').val();
				if (phoneNumber == '') {
					alert("전화번호를 입력하세요");
					return;
				}
				if (!phoneNumber.startsWith('010') || phoneNumber.length < 11) {
					alert("전화번호를 제대로 입력하세요");
					return;
				}
				phoneNumber = phoneNumber.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");
				
				$.ajax({
					type : "POST",
					url : "/lesson06/booking/add_booking",
					data : {"name" : name, "date" : date, "day" : day, "headcount" : headcount, "phoneNumber" : phoneNumber,},
					success : function(data) {
						alert(data.result);
						location.href = "/lesson06/booking/booking_main"
					},
					error : function(data) {
						alert("error : " + data.result);
						alert(data.error_message);
					}
				});
			});
			
			$('.deleteBtn').on('click', function() {
				let bookingId = $(this).data('booking-id');
				
				$.ajax({
					// resquest
					type : "DELETE",
					url : "/lesson06/booking/delete_booking",
					data : {"id" : bookingId},
					
					// response
					success : function(data) {
						if (data.result_code == 1) {
							alert("삭제되었습니다.")
							location.reload();
						} else {
							alert(data.error_message);
						}
					},
					error : function(e) {
						alert("삭제가 실패했습니다.")
					}
				});
			});
			
			$('#checkBtn').on('click', function() {
				
				let name = $('#checkName').val().trim();
				if (name == '') {
					alert("이름을 입력해주세요");
					return;
				}
				
				let phoneNumber = $('#checkPhoneNumber').val().trim();
				if (phoneNumber == '') {
					alert("전화번호를 입력해주세요");
					return;
				}
				if (!phoneNumber.startsWith('010') || phoneNumber.length < 11) {
					alert("전화번호를 제대로 입력하세요");
					return;
				}
				phoneNumber = phoneNumber.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");
				
				$.ajax({
					type : "POST",
					url : "/lesson06/booking/check_booking",
					data : {"name" : name, "phoneNumber" : phoneNumber},
					success : function(data) {
						if (data.isDuplication == true) {
							let date = data.result.date.slice(0, 10);
							alert(
									"이름 : " + data.result.name + "\n" +
									"날짜 : " + data.result.date + "\n" +
									"일수 : " + data.result.day + "\n" +
									"인원 : " + data.result.headcount + "\n" +
									"상태 : " + data.result.state
								);
						} else {
							alert("예약 내역이 없습니다.");
						}
					}
				})
			});
			
			
			$('#list').on('click', function() {
				$('.booking-list').removeClass('d-none');
				$('.booking-add').addClass('d-none');
				$('.booing-check').addClass('d-none');
			});
			
			$('#add').on('click', function() {
				$('.booking-add').removeClass('d-none');
				$('.booking-list').addClass('d-none');
				$('.booing-check').addClass('d-none');
			});
			$('#check').on('click', function() {
				$('.booing-check').removeClass('d-none');
				$('.booking-add').addClass('d-none');
				$('.booking-list').addClass('d-none');
			});
			
			$('#date').datepicker({
				changeMonth : true, // 월 셀렉트 박스 
				changeYear : true, // 년 셀렉트 박스 
				dateFormat : "yy-mm-dd", // 표시 포멧 
			});
		});
	</script>
</body>
</html>