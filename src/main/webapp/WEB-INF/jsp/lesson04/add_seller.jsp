<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Ǹ��� �߰�</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
	<h1>�Ǹ��� �߰�</h1>
		<form method="POST" action="/lesson04/quiz01/add_seller">
			<div>
				<label for="nickname"><b>�г���</b></label>
				<input type="text" id="nickname" name="nickname" class="form-control" placeholder="�̸��� �Է��ϼ���">
			</div>
			<div>
				<label for="profileImageUrl"><b>������ ���� url</b></label>
				<input type="text" id="profileImageUrl" name="profileImageUrl" class="form-control" placeholder="�̹��� URL�� �Է��ϼ���">
			</div>
			<div>
				<label for="temperature"><b>�µ�</b></label>
				<input type="text" id="temperature" name="temperature" class="form-control" placeholder="�µ��� �Է��ϼ���">
			</div>
			<input type="submit" class="btn btn-primary" value="�߰�">
		</form>
	</div>
</body>
</html>