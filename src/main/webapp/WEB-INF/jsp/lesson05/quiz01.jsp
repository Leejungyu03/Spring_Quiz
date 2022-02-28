<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>1. JSTL core ����</h1>
	<c:set var="number1" value="36"></c:set>
	<c:set var="number2" value="3"></c:set>
	<h3>ù��° ���� : ${number1}</h3>
	<h3>�ι�° ���� : ${number2}</h3>
	
	<h1>2. JSTL core ����</h1>
	<h3>���ϱ� : ${number1 + number2}</h3>
	<h3>���� : ${number1 - number2}</h3>
	<h3>���ϱ� : ${number1 * number2}</h3>
	<h3>������ : ${number1 / number2 }</h3>
	
	<h1>3. JSTL core out</h1>
	<c:out value="<title>core out</title>"></c:out>
	
	<h1>4. core if</h1>
	<c:set var="result"></c:set>
	<c:if test="${(number1 + number2) / 2 >= 10}">
		<h1>${(number1 + number2) / 2}</h1>
	</c:if>
	<c:if test="${(number1 + number2) / 2 < 10}">
		<h3>${(number1 + number2) / 2}</h3>
	</c:if>
	
	<h1>5. core if</h1>
	<c:set var="multiply"></c:set>
	<c:if test="${number1 * number2 > 100 }">
		<c:out value="<script>alert('�ʹ� ū �� �Դϴ�');</script>" escapeXml="false"></c:out>
	</c:if>
</body>
</html>