<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int countryId = Integer.parseInt(request.getParameter("countryId"));
	System.out.println(countryId + "<--insertCityForm/countryId");
	
	String city = request.getParameter("city");
%>
<h3>City 입력</h3>

<form method = "post" action = "<%=request.getContextPath()%>/city/insertCityAction.jsp">

	
	<div>
	city : <input type = "text" name = "city" >
	</div>
	<div>
	country id : <input type = "text" name = "countryId" value = <%=countryId %> readonly = "readonly">
	</div>
	<button type = "submit">시티입력</button>
</form>
</body>
</html>
