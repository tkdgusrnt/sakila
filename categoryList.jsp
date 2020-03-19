<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<%@ page import = "dao.*" %>
<%@ page import = "java.util.*" %>
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
<!-- CategoryDao 클래스 값 가져오기 -->
<%
	CategoryDao categoryDao = new CategoryDao();
	ArrayList<Category> list = categoryDao.selectCategoryAll();

%>
<body>
   <div id="aside">
         <jsp:include page="/inc/sidemenu.jsp"></jsp:include><!-- include는 서버 기술이라서 requset.getContextPath()가 오면 안됨  -->
    	</div>
   		 <div id="section">
        <h1>INDEX</h1>
        <div>
         <img src = "<%=request.getContextPath() %>/imgs/apple.jpg">
        </div>

	<h1>CategoryList</h1>
	<table border = "1"><a href = "<%=request.getContextPath() %>/category/categoryInsertForm.jsp" >리스트 추가</a>
		<thead>
		<tr>
			<th>CategoryId</th>
			<th>name</th>
			<th>lastUpdate</th>
			
		</tr>
		</thead>
		<tbody>
			<%
			for(Category c : list){
			%>
			<tr>
			<td><%=c.getCategoryId() %></td>			
			<td><%=c.getName() %></td>		
			<td><%=c.getLastUpdate() %></td>
			
			
			</tr>
			<%
			}
			%>
		</tbody>
	</table>
	</div>
</body>
</html>
