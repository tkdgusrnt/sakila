<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="vo.*"%>
<%@ page import="dao.*" %>
<!DOCTYPE html>
<html>
<head>
<title>RentalList</title>
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
        <h1>RENTAL</h1>
        <%
        	//searchWord 메소드
        	String searchWord = "";
        	if(request.getParameter("searchWord") !=null){
        		searchWord = request.getParameter("searchWord");
        	}
        	ArrayList<RentalAndInventoryAndCustomerAndStaff>List = new RentalDao().selectRentalList(searchWord);
        %>
        <!-- 검색창 -->
        <!-- inventoryId로 검색 -->
        <form method = "post" action = "<%=request.getContextPath()%>/rental/rentalList.jsp">
        	<input type = "text" name="searchWord">
        	<button type = "submit">검색</button>
        </form>
        <br>
        	<table border = "1">
        		<thead>
        			<tr>
        				<th>RENTAL ID</th>
        				<th>RENTAL DATE</th>
        				<th>INVENTORY ID</th>
        				<th>CUSTOMER ID</th>
        				<th>RETURN DATE</th>
        				<th>STAFF ID</th>
        				<th>LAST UPDATE</th>
        			</tr>
        		</thead>
        		<tbody>
        			<%
        				for(RentalAndInventoryAndCustomerAndStaff rics : List){
        			%>
        			<tr>
        				<td><%=rics.getRental().getRentalId() %></td>
        				<td><%=rics.getRental().getRentalDate() %></td>
        				<td><%=rics.getRental().getInventoryId() %></td>
        				<td><%=rics.getRental().getCustomerId() %></td>
        				<td><%=rics.getRental().getReturnDate() %></td>
        				<td><%=rics.getRental().getStaffId()%></td>
        				<td><%=rics.getRental().getLastUpdate() %></td>

        			</tr>
        			<%
        				}
        			%>
        		</tbody>
        	</table>
        <div>
            <a href="<%=request.getContextPath()%>/rental/insertRentalForm.jsp">RENTAL 입력</a>
        </div>
    </div>
</body>
</html>


