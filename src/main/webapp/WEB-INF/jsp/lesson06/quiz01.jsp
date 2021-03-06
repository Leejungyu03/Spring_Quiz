<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기 추가하기</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
  <!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script> -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h1>즐겨찾기 추가하기</h1>
		
		<div class="form-group">
			<label for="title">제목</label>
			<input type="text" id="title" class="form-control">
		</div>

		<div class="form-group">
			<label for="url">URL 주소</label>
			
			<div class="form-inline">
				<input type="text" id="url" class="form-control col-10">
				<button type="button" id="checkDuplicateBtn" class="btn btn-info">중복확인</button>
			</div>
			<small id="isDuplicationText" class="text-danger d-none">중복된 url 입니다.</small>
			<small id="availableUrlText" class="text-success d-none">저장 가능한 url 입니다.</small>
		</div>
		
		<button type="button" id="addFavoriteBtn" class="btn btn-success btn-block">추가</button>
	</div>
	
	<script>
		$(document).ready(function() {
			// Quiz02) url 중복 확인
			$('#checkDuplicateBtn').on('click', function(e) {
				var url = $('#url').val().trim();
				if (url == '') {
					alert("검사할 url을 입력해주세요.");
					return;
				}
				
				$.ajax({
					type:'post'
					, url: '/lesson06/quiz02/check_duplication_url'
					, data: {'url': url}
					, success: function(data) {
						if (data.isDuplication == true) {
							// 중복
							$('#isDuplicationText').removeClass('d-none');
							$('#availableUrlText').addClass('d-none');
						} else {
							// 사용가능
							$('#availableUrlText').removeClass('d-none');
							$('#isDuplicationText').addClass('d-none');
						}
					}
				});
			});
			
			
			// 즐겨찾기 추가
			$('#addFavoriteBtn').on('click', function(e) {
				var title = $('#title').val().trim();
				var url = $('#url').val().trim();
				
				if (title == '') {
					alert("제목을 입력하세요.");
					return;
				}
				
				if (url == '') {
					alert("주소를 입력하세요.");
					return;
				}
				
				if (url.startsWith("http://") == false || url.startsWith("https://")) {
					alert("주소 형식이 잘못되었습니다.");
					return;
				}
				
				// quiz02 - 중복확인 체크
				if ($('#availableUrlText').hasClass('d-none')) {
					alert("중복된 url 입니다. 다시 중복확인을 해주세요.");
					return;
				}
				
				$.ajax({
					type:'post'
					, url: '/lesson06/quiz01/add_favorite'
					, data: {'title':title, 'url':url}
					, success: function(data) {
						//alert(data.result);
						if (data.result == 'success') {
							location.href = "/lesson06/quiz01/favorite_list";
						}
					}, error:function(e) {
						alert("error:" + e);
					} 
				});
			});
		});
	</script>
</body>
</html>