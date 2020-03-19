<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>InsertCountryForm</h3>
<form method = "post" action = "<%=request.getContextPath() %>/country/insertCountryAction.jsp">

	<div>
	Country Id:
	<input type = "text" name = "countryId">
	</div>
	<div>
	Country :
	<input type = "text" name = "country">
	</div>
	<button type = "submit">전송</button>
</form>
</body>
</html>
