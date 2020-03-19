<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="dao.*"%>
<%@ page import="vo.*"%>
<%@ page import="java.util.*"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf8");
		int languageId = Integer.parseInt(request.getParameter("languageId"));
		String name = request.getParameter("name");
		
		Language lg = new Language();
		lg.getLanguageId();
		lg.getName();
		
		LanguageDao languageDao = new LanguageDao();
		languageDao.insertLanguage(lg);
		response.sendRedirect(request.getContextPath()+"/languageList.jsp");
	%>

</body>
</html>
