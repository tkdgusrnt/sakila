<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>CategoryInsertForm</h1>
	<form method = "post" action = "<%=request.getContextPath()%>/category/categoryInsertAction.jsp">
		
		<div>
			name:
			<input type = "text" name = "name">
		</div>
		<div>
			<button type = "submit" name = "submit">입력</button>
		</div>	
	</form>
</body>
</html>
