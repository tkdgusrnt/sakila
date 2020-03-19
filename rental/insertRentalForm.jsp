<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>insertRentalForm.jsp</title>
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
	<h3>Rental 입력</h3>
    <div id="aside">
         <jsp:include page="/inc/sidemenu.jsp"></jsp:include>
    </div>
    <div id="section">
    	<table>
    		<form method="post" action = "<%=request.getContextPath()%>/rental/insertRentalAction.jsp">
		        <div>
		            RENTAL ID : <input type = "text" name = "rentalId">
		        </div>
		        <div>
		        	RENTAL DATE : <input type = "text" name = "rentalDate">
		        </div>
		        <div>
		        	INVENTORY ID : <input type = "text" name = "inventoryId">
		        </div>
		        <div>
		        	CUSTOMER ID : <input type = "text" name = "customerId">
		        </div>
		        <div>
		        	RETURN DATE : <input type = "text" name = "returnDate">
		        </div>
		        <div>
		        	STAFF ID : <input type = "text" name = "staffId">
		        </div>
		        <button type = "submit">RENTAL 입력</button>
        	</form>
        </table>    
    </div>
   
</body>
</html>


