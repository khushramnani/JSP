<%-- 
    Document   : 7.jsp
    Created on : Mar 13, 2024, 2:38:49 PM
    Author     : 15hem
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>JSP Page</h1>
        <%
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            int mark1 = Integer.parseInt(request.getParameter("mark1"));
            int mark2 = Integer.parseInt(request.getParameter("mark2"));
            int mark3 = Integer.parseInt(request.getParameter("mark3"));
            out.print("Id : "+id+"<br>");
            out.print("Name : "+name+"<br>");
            out.print("Mark1 : "+mark1+"<br>");
            out.print("Mark2 : "+mark2+"<br>");
            out.print("Mark3 : "+mark3+"<br>");
            try {
                Class.forName("oracle.jdbc.driver.OracleDriver");
                Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "manager");
                out.print("connected....!");
//                String create = "create table Student1(id number(10),name varchar2(50),mark1 number(10),mark2 number(10),mark3 number(10))";
//                               st.execute(create);
                String ins = "insert into student1 values(?,?,?,?,?)";
                PreparedStatement pt = con.prepareStatement(ins);
                pt.setInt(1, id);
                pt.setString(2, name);
                pt.setInt(3, mark1);
                pt.setInt(4, mark2);
                pt.setInt(5, mark3);
                pt.executeUpdate();
                response.sendRedirect("Result.jsp");
            } catch (Exception e) {
                out.print(e);
            }
        %>
    </body>
</html>
