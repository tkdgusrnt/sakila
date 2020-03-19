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
	CityDao cityDao = new CityDao();
	ArrayList<CityAndCountry> list = cityDao.selectCityList();

%>
<h3>cityList</h3>
	<form method = "post" action = "<%=request.getContextPath()%>/city/cityList.jsp"> 
		<table border = "1">
			<tr>
				<th>cityId</th>
				<th>city</th>
				<th>countryId</th>
				<th>country</th>
				<th>lastUpdate</th>
				<th>추가</th>
			</tr>
	
		<%
		for(CityAndCountry c : list){
		%>
		<tbody>
		<tr>
			<td><%=c.getCity().getCityId() %></td>
			<td><%=c.getCity().getCity() %></td>
			<td><%=c.getCountry().getCountryId() %></td>
			<td><%=c.getCountry().getCountry() %></td>
			<td><%=c.getCountry().getLastUpdate() %></td>
			<td><a href = "<%=request.getContextPath() %>/city/insertCityForm.jsp?countryId=<%=c.getCountry().getCountryId() %>&&city=<%=c.getCity().getCity()%>">추가</a></td>
		</tr>
		</tbody>
		<%
		}
		%>
		</table>
	</form>
	</div>
</body>
</html>
