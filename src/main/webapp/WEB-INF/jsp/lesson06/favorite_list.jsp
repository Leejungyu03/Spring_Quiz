<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기 목록</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
  <!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script> -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h1>즐겨찾기 목록</h1>
		<table class="table">
			<thead>
				<tr>
					<th>No.</th>
					<th>이름</th>
					<th>주소</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="favorite" items="${favoriteList}">
				<tr>
					<td>${favorite.id}</td>
					<td>${favorite.name}</td>
					<td>${favorite.url}</td>
					<%-- (1) name속성과 value 속성을 이용해서 동적으로 삭제버튼 감지 --%>
					<%-- <td><button type="button" name="delBtn" class="btn btn-danger" value="${favorite.id}">삭제</button></td> --%>
					
					<%-- (2) data를 이용해서 태그에 data를 임시 저장해놓기 --%>
					<td><button type="button" class="favorite-btn btn btn-danger" data-favorite-id="${favorite.id}">삭제</button></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<script>
		$(document).ready(function() {
			
			// (1) name속성과 value 속성을 이용해서 동적으로 삭제버튼 감지
			/* $('td').on('click', 'button[name=delBtn]', function(e) {
				let id = $(this).attr('value');  // 또는 e.target.value
				alert(id);
			}); */
			
			
			// (2) data를 이용해서 태그에 data를 임시 저장해놓기
			// 태그: data-favorite-id      data-    그 뒤부턴 우리가 이름을 정한다.
			// 스크립트: $(this).data('favorite-id');
			
			$('.favorite-btn').on('click', function(e) {
				e.preventDefault();
				
				var favoriteId = $(this).data('favorite-id');
				//alert(favoriteId);
				
				$.ajax({
					type:'post'
					, url:'/lesson06/quiz02/delete_favorite'
					, data: {"favorite_id": favoriteId}
					, success: function(data) {
						if (data.result == 'success') {
							location.reload();
						} else {
							alert("삭제 실패했습니다. 관리자에게 문의해주세요.");
						}
					}, error: function(e) {
						alert("error: " + e);
					}
				});
			});
		});
	</script>
</body>
</html>