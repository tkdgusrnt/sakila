<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<title>City List</title>
<meta charset="UTF-8">
<style>
    body {
        padding: 0;
        margin: 0;
        width: 100%;
        height: 100%;
        overflow: hidden;
        background-position: 0 0;
        background-repeat: no-repeat;
        background-attachment: fixed;
        background-size: cover;
        position: relative;
        overflow-y: auto;
    }
    
    #aside {
        width: 200px;
        height: 3000px;
        position: fixed;
        background: orange;
        overflow: hidden;
        float: left;
    }
    
    #section {
        margin-left: 300px;
        background: white;
    }
</style>
</head>
<body>
    <div id="aside">
        <jsp:include page="/inc/sidemenu.jsp"></jsp:include>
    </div>
    <div id="section">
    
     <h1>LANGUAGE LIST</h1>
     <%
     	String searchword = "";
     	if(request.getParameter("searchword")!=null){
     		searchword = request.getParameter("searchword");
     	}
     	 LanguageDao languageDao = new LanguageDao();
     	 ArrayList<Language> list = languageDao.selectLanguageListAll(searchword);
     %>
     <form method="post" action="<%=request.getContextPath()%>/language/languageList.jsp">
     	<input type="text" name="searchword">
     	<button type="submit">검색</button>
     </form>
     <br>
     <table border="1">
     <thead>
     	<tr>
     		<th>language_id</th>
     		<th>name</th>
     		<th>last_update</th>
     		<th>language 입력</th>
     	</tr>
     </thead>
     <tbody>
     	<%
     		for(Language l: list){
     	%>	
     		<tr>
     			<td><%=l.getLanguageId()%></td>
     			<td><%=l.getName()%></td>
     			<td><%=l.getLastUpdate()%></td>
     			<td><a href="<%=request.getContextPath()%>/language/insertLanguageForm.jsp?languageId=<%=l.getLanguageId()%>">LANGUAGE 입력</a></td>
     		</tr>	
     	<%	
     		}
     	%>
     </tbody>
     </table>

     
