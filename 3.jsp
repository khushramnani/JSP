<%-- 
    Document   : 3
    Created on : Mar 4, 2024, 11:51:02 AM
    Author     : 15hem
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.LocalTime" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>
            <%
                response.setHeader("Refresh", "1");
                LocalDate d = LocalDate.now();
                LocalTime t = LocalTime.now();
                out.print(d+"<br>");           
                out.print(t);
            %>
        </h1>
    </body>
</html>
