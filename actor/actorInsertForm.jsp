<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>actorInsertForm</h1>
	<form method = "post" action = "<%=request.getContextPath()%>/actor/actorInsertAction.jsp">
	<table border = "1">
	<tr>	
	<td>
	<div>
	firstName:
	<input type = "text" name = "firstName">
	</div>
	</td>
	<td>
	<div>
	lastName:
	<input type = "text" name = "lastName">
	</div>
	</td>
	<td>
	<div>
	<button type = "submit" name = "submit">전송</button>
	</div>
	</td>
	</table>
	</form>
	
</body>
</html>
