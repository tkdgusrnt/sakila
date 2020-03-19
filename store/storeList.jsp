<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import= "java.util.*" %>
<%@ page import= "dao.*" %>
<%@ page import= "vo.*" %>
<!DOCTYPE html>
<html>
<head>
<title>>Store List</title>
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
        	StoreDao storeDao = new StoreDao();
        	ArrayList<StoreAndStaff> storeAndStaffList = storeDao.selectStoreListAll();
        %>
        <h1>Store List</h1>
        <div>
        	<a href="<%= request.getContextPath() %>/staff/insertStaffForm.jsp">직원 추가</a>
        	<a href="<%= request.getContextPath() %>/store/insertStoreForm.jsp">매장 추가</a>    
        </div>
    		<table border="1">
    			<thead>
    				<tr>
    					<th>store_id</th>
    					<th>manager_staff_id</th>
    					<th>manager_staff_first_name</th>
    					<th>manager_staff_last_name</th>
    				</tr>
    			</thead>
    			<tbody>
    			<%
    				for(StoreAndStaff s : storeAndStaffList) {
    			%>
    					<tr>
    						<td><%= s.getStore().getStoreId() %></td>
    						<td><%= s.getStaff().getStaffId()%></td>
    						<td><%= s.getStaff().getFirstName()%></td>
    						<td><%= s.getStaff().getLastName()%></td>
    					</tr>
    			<%		
    				}
    			%>
    			</tbody>
    		</table>
    </div>
</body>
</html>