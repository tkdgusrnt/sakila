<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="vo.*"%>
<%@ page import="dao.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<title>INSERT ADDRESS FORM</title>
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
		<%
			CityDao cityDao = new CityDao();
			ArrayList<City> cityIdList = cityDao.selectCityIdListAll();
		%>
		<h3>ADDRESS INSERT FORM</h3>
		<form method="post"
			action="<%=request.getContextPath()%>/address/insertAddressAction.jsp">
			<div>
				ADDRESS ID : <input type="text" name="addressId">
			</div>
			<div>
				ADDRESS : <input type="text" name="address">
			</div>
			<div>
				ADDRESS 2 : <input type="text" name="address2">
			</div>
			<div>
				DISTRICT : <input type="text" name="district">
			</div>
			<div>
				CITY ID : 
				<select name="cityId">
					<%
						for (City c : cityIdList) {
					%>
					<option value="<%=c.getCityId()%>"><%=c.getCity()%></option>
					<%
						}
					%>
				</select>
			</div>
			<div>
				POSTAL CODE : <input type="text" name="postalcode">
			</div>
			<div>
				PHONE : <input type="text" name="phone">
			</div>
			<button type="submit">INSERT</button>
		</form>
	</div>
</body>
</html>
