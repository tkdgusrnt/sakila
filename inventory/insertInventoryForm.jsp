<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*"%>
<%@ page import="vo.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert Inventory</title>
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
        width: 250px;
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
    	<h1>Inventory INSERT</h1>
    	<%
    		StoreDao s = new StoreDao();
    		ArrayList<Integer> storeIdList = s.selectStoreIdList();
    		
    		FilmDao f = new FilmDao();
    		ArrayList<Film> filmIdList = f.selectFilmIdListAll();
    	%>
    	<div>
    		<form method="post"
    		action="<%=request.getContextPath()%>/inventory/insertInventoryAction.jsp">
    		
    		<fieldset>
    			<legend>INSERT INVENTORY</legend>

    			<div>
					<select name="filmId">
    					<%
							for (Film fi : filmIdList) {
						%>
						<option value="<%=fi.getFilmId()%>"><%=fi.getTitle()%></option>
						<%
							}
						%>
    				</select>
    			</div>
    			<div>
    				<select name="storeId">
    					<%
							for (Integer st : storeIdList) {
						%>
						<option value="<%=st%>"><%=st%></option>
						<%
							}
						%>
    				</select>
    			</div>
    		</fieldset>
    		<button type="submit">INSERT</button>
    		</form>
    	</div>
    </div>
</body>
</html>