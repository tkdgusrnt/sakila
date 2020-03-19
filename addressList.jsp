<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*"%>
<%@ page import="dao.*"%>
<%@ page import="util.*"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<title>Address List</title>
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
<%
   ArrayList<AddressAndCityAndCountry> list = new AddressDao().SelectAddress();
%>
    <div id="aside">
         <jsp:include page="/inc/sidemenu.jsp"></jsp:include>
    </div>
    <div id="section">
      <h1>ADDRESS MANAGEMENT</h1>
      <table border = "1">
         <thead>
            <tr>
               <th>CITY ID</th>
               <th>COUNTRY</th>
               <th>CITY</th>
               <th>ADDRESS</th>
               <th>ADDRESS2</th>
               <th>POSTAL CODE</th>
            </tr>
            
         </thead>
         <tbody>
            <%
               for(AddressAndCityAndCountry ad : list){
            %>
               <tr>
                  <th><%=ad.getCity().getCityId() %></th>
                  <th><%=ad.getCountry().getCountry() %></th>
                  <th><%=ad.getCity().getCity() %></th>
                  <th><%=ad.getAddress().getAddress() %></th>
                  <th><%=ad.getAddress().getAddress2() %></th>
                  <th><%=ad.getAddress().getPostalCode() %></th>
               </tr>
            <%   
               }
            %>
         </tbody>
      </table>
      <%
      	/*
         City city = new City();
         int cityId = city.getCityId();
         System.out.println(cityId);
         city = new AddressDao().selectCityId(cityId);
         System.out.println(city);
        */
      %>
      <a href="<%=request.getContextPath()%>/address/insertAddressForm.jsp">ADDRESS INSERT</a>
    </div>
</body>
</html>