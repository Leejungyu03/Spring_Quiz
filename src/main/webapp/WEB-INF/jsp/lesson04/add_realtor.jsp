<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공인중개사 추가</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h1>공인중개사 추가</h1>
		
		<form method="post" action="/lesson04/quiz02/add_realtor">
			<div class="from-group">
				<label for="office"><b>상호명</b></label>
				<input type="text" id="office" name="office" class="form-control col-5" placeholder="상호명을 입력하세요">
			</div>
			<div class="from-group">
				<label for="phoneNumber"><b>전화번호</b></label>
				<input type="text" id="phoneNumber" name="phoneNumber" class="form-control col-5" placeholder="예)010-1234-5678">
			</div>
			<div class="from-group">
				<label for="address"><b>주소</b></label>
				<input type="text" id="address" name="address" class="form-control col-5" placeholder="주소를 입력하세요">
			</div>
			<div class="from-group">
				<label for="grade"><b>등급</b></label>
				<input type="text" id="grade" name="grade" class="form-control col-5" placeholder="등급을 입력하세요">
			</div>
			
			<input type="submit" class="btn btn-success" value="추가">
		</form>
	
	</div>
</body>
</html>