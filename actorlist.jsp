<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "dao.*" %>
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
<body>
 <div id="aside">
         <jsp:include page="/inc/sidemenu.jsp"></jsp:include><!-- include는 서버 기술이라서 requset.getContextPath()가 오면 안됨  -->
    	</div>
   		 <div id="section">
        <h1>INDEX</h1>
        <div>
         <img src = "<%=request.getContextPath() %>/imgs/apple.jpg">
        </div>

<h1>ACTOR LIST</h1>
<!-- 페이징 관련 비지니스 로직 -->
<% 
	int currentPage = 1;
	if(request.getParameter("currentPage") !=null) {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	int rowPerPage = 10;	

	int beginRow = (currentPage -1) * rowPerPage;
%>
<!-- 컨트롤 로직이 필요함 (메서드 호출 결과값 (model) 가지고 와야함 -->
<%
	ActorDao actorDao = new ActorDao();
	ArrayList<Actor> list = actorDao.selectActorByPage(beginRow, rowPerPage);
%>
<!-- 뷰 로직  -->
	
	<table border = "1">
	<thead>
	<div>
	<a href ="<%=request.getContextPath() %>/actor/actorInsertForm.jsp">추가</a>
	</div>
	<tr>
		<th>actorId</th>
		<th>firstName</th>
		<th>lastName</th>
		<th>lastUpdate</th>
	</tr>
	</thead>
	
	<tbody>
		<%
		for(Actor a : list) {
		%>
		<tr>
			<td><%=a.getActorId() %></td>
			<td><%=a.getFirstName() %></td>
			<td><%=a.getLastName() %></td>
			<td><%=a.getLastUpdate() %></td>
		</tr>
	<%
		}
	%>
	</tbody>
	
	</table>
	<!-- 페이지 로직을 구성 -->
	
	<%
	 if(currentPage >1) {
	%>
	<a href = "<%=request.getContextPath()%>/actor/actorlist.jsp?currentPage=<%=currentPage-1%>">이전</a>
	<%
	 }
%>
<%
	int totalCount = actorDao.selectTotalCount();
	int lastPage = totalCount / rowPerPage;
	if (totalCount % rowPerPage !=0){
		lastPage+=1;
	}
	%>
<%
	if(currentPage < lastPage){
	%>
	<a href = "<%=request.getContextPath()%>/actor/actorlist.jsp?currentPage=<%=currentPage+1%>">다음</a>
	<%
	 }
	%>
</div>
</body>
</html>
