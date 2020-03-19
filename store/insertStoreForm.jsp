<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert Store Form</title>
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
	StaffDao staffDao = new StaffDao();
	ArrayList<Staff> staffId = staffDao.selectStaffIdList();
	CityDao cityDao = new CityDao();
	ArrayList<City> cityList = cityDao.selectCityListAll();
%>
        <h1>Insert Store Form</h1>
    		<form method="post" action="<%= request.getContextPath() %>/store/insertStoreFormAction.jsp">
	    		<fieldset>
		       		<legend>STORE ADDRESS</legend>
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
	    			<legend>SELECT MANAGER STAFF</legend>
		    		<div>
		    			staff :
		    			<select name="staffId">
		    			<%
		    				for(Staff s : staffId) {
		    					if(s.getActive() == 1) { // 매니저가 아닌 직원 중에서 선택
		    			%>
		    					<option value="<%= s.getStaffId() %>"><%= s.getFirstName() %> <%= s.getLastName() %></option>
		    			<%		
		    					}
		    				}
		    			%>
		    			</select>
		    		</div>
	    		</fieldset>    
	       		<br>
       			<button type="submit">매장 추가</button>
      		</form>
    </div>
</body>
</html>