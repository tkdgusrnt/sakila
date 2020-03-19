<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert Staff Form</title>
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
        <h1>Insert Staff Form</h1>
<%
		CityDao cityDao = new CityDao();
		ArrayList<City> cityList = cityDao.selectCityListAll();		
		StoreDao storeDao = new StoreDao();
		ArrayList<Integer> storeIdList = storeDao.selectStoreIdList();
%> 
        <div>
            <form method="post" action="<%= request.getContextPath() %>/staff/insertStaffFormAction.jsp">
				<fieldset>
					<legend>ADDRESS</legend>
						<div>
							address :
							<input type="text" name="address">
						</div>
						<div>
							address2 :
							<input type="text" name="address2">
						</div>
						<div>
							district :
							<input type="text" name="district">
						</div>
						<div>
							city_id :
							<select name="cityId">
								<%
									for(City c : cityList) {
								%>
										<option value="<%= c.getCityId() %>">
											<%= c.getCity() %>
										</option>
								<%		
									}
								%>
							</select>
						</div>
						<div>
							postal_code :
							<input type="text" name="postalCode">
						</div>
						<div>
							phone :
							<input type="text" name="phone">
						</div>
				</fieldset>
				<br>
				<fieldset>
					<legend>STAFF</legend>
					<div>
						first_name :
						<input type="text" name="firstName">
					</div>
					<div>
						last_name :
						<input type="text" name="lastName">
					</div>
					<div>
						picture :
						<input type="file" name="picture" value="null">
					</div>
					<div>
						email :
						<input type="text" name="email">
					</div>
					<div>
						store_id :
						<select name="storeId">
							<%
								for(Integer storeId : storeIdList) {
							%>
									<option value="<%= storeId %>">
										<%= storeId %>
									</option>
							<%		
								}
							%>
						</select>
					</div>
					<div>
						active :
						<select name="active">
							<option value="1">재직</option>
							<option value="0">퇴직</option>
						</select>
					</div>
					<div>
						user name :
						<input type="text" name="userName">
					</div>
					<div>
						password :
						<input type="text" name="password">
					</div>
				</fieldset>
            	<br>
            	<button type="submit">입력</button>
            </form>
        </div>
    </div>
</body>
</html>