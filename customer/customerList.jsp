<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Customer List</title>
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
        	CustomerDao customerDao = new CustomerDao();
        	ArrayList<CustomerAndStoreAndAddress> customerList = customerDao.selectCustomerListAll();
        %>
        <h1>Customer List</h1>
        <div>
       		<a href="<%=request.getContextPath() %>/customer/insertCustomerForm.jsp">고객추가</a>     
        </div>
        <table border="1">
        	<thead>
        		<tr>
	        		<th>customer_id</th>
	        		<th>store_id</th>
	        		<th>first_name</th>
	        		<th>last_name</th>
	        		<th>email</th>
	        		<th>address_id</th>
	        		<th>address</th>
	        		<th>phone</th>
	        		<th>active</th>
	        		<th>create_date</th>
	        		<th>last_update</th>
        		</tr>
        	</thead>
        	<tbody>
        	<%
        		for(CustomerAndStoreAndAddress c : customerList) {
        	%>
        			<tr>
        				<td><%= c.getCustomer().getCustomerId() %></td>
        				<td><%= c.getStore().getStoreId() %></td>
        				<td><%= c.getCustomer().getFirstName() %></td>
        				<td><%= c.getCustomer().getLastName() %></td>
        				<td><%= c.getCustomer().getEmail() %></td>
        				<td><%= c.getAddress().getAddressId() %></td>
        				<td><%= c.getAddress().getAddress() %></td>
        				<td><%= c.getAddress().getPhone() %></td>
        				<td><%= c.getCustomer().getActive() %></td>
        				<td><%= c.getCustomer().getCreateDate() %></td>
        				<td><%= c.getCustomer().getLastUpdate() %></td>
        			</tr>
        	<%		
        		}
        	%>
        	</tbody>
        </table>
    </div>
</body>
</html>