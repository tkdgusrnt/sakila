<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "dao.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "vo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
         <jsp:include page="/inc/sidemenu.jsp"></jsp:include><!-- include는 서버 기술이라서 requset.getContextPath()가 오면 안됨  -->
    	</div>
   		 <div id="section">
        <h1>INDEX</h1>
        <div>
         <img src = "<%=request.getContextPath() %>/imgs/apple.jpg">
        </div>


    <%
    String searchWord = "";
    if(request.getParameter("searchWord")!=null) {
    	searchWord = request.getParameter("searchWord");
    }
	CountryDao countryDao = new CountryDao();
	ArrayList<Country> list = countryDao.selectCountryListAll(searchWord);
%>
	<form method = "post" action = "<%=request.getContextPath() %>/country/countryList.jsp">
	<input type = "text" name = "searchWord">
	<button type = "submit" name = "submit">찾기</button>	
	</form>
	<table border = "1">
		<thead>
			<tr>
				<th>Country ID</th>
				<th>COUNTRY</th>
				<th>LAST UPDATE</th>
				<th>CITY추가</th>				
			</tr>
			<%
			for(Country c : list){
			%>
			<tr>
				<td><%=c.getCountryId() %></td>
				<td><%=c.getCountry() %></td>
				<td><%=c.getLastUpdate() %></td>			
				<td><a href = "<%=request.getContextPath() %>/city/insertCityForm.jsp?countryId=<%=c.getCountryId()%>">추가</a></td>
				
			</tr>
			<%
			}
			%>
	
		</thead>
	</table>
	<div>

	<a href = "<%=request.getContextPath()%>/country/insertCountryForm.jsp">부서추가 </a>
		
		</div>
	</div>
</body>
</html>
