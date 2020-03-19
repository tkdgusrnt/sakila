<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import= "java.util.*" %>
<%@ page import= "dao.*" %>
<%@ page import= "vo.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Staff List</title>
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
	StaffDao sDao = new StaffDao();
	ArrayList<StaffAndAddressAndStore> list = sDao.selectStaffListAll();
%>
        <h1>Staff List</h1>
	        <div>
	            <a href="<%=request.getContextPath()%>/staff/insertStaffForm.jsp">Staff 입력</a>
	        </div>
        	<table border="1">
        		<thead>
        			<tr>
        				<th>staff_id</th>
        				<th>first_name</th>
        				<th>last_name</th>
        				<th>address_id</th>
        				<th>phone</th>
        				<th>picture</th>
        				<th>email</th>
        				<th>store_id</th>
        				<th>active</th>
        				<th>user_name</th>
        				<th>password</th>
        				<th>last_update</th>
        			</tr>
        		</thead>
        		<tbody>
<%
	for(StaffAndAddressAndStore s : list) {
%>
						<tr>
							<td><%=s.getStaff().getStaffId() %></td>
							<td><%=s.getStaff().getFirstName() %></td>
							<td><%=s.getStaff().getLastName() %></td>
							<td><%=s.getAddress().getAddressId() %></td>
							<td><%=s.getAddress().getPhone() %></td>
							<td><%=s.getStaff().getPicture() %></td>
							<td><%=s.getStaff().getEmail() %></td>
							<td><%=s.getStore().getStoreId() %></td>
							<td><%=s.getStaff().getActive() %></td>
							<td><%=s.getStaff().getUserName() %></td>
							<td><%=s.getStaff().getPassword() %></td>
							<td><%=s.getStaff().getLastUpdate() %></td>
						</tr>
<%						
					}
%>
        		</tbody>
        	
        	</table>
    </div>
</body>
</html>