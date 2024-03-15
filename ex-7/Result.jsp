<%-- 
    Document   : Result
    Created on : Mar 14, 2024, 9:04:40 PM
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
    <style>
        td,th{
            border: 1px solid black;
            padding: 2px 6px;
        }
        .btn{
            width:100px;
            font-size: 20px;
        }
        a{
            text-decoration: underline;
            color:blue;
            cursor:pointer;
        }
    </style>        
    <body>
        <button class="btn" onclick="document.location.href = '7.html'">Home</button><br><br>
        <table style="border:2px solid black;text-align: center">
            <tr>
                <th>Id</th>       
                <th>Name</th> 
                <th>Mark-1</th> 
                <th>Mark-2</th> 
                <th>Mark-3</th> 
                <th>Total</th> 
                <th>Percentage</th> 
                <th>calculate</th>
            </tr>
            <%
                try {
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "manager");
                    PreparedStatement pt = con.prepareStatement("select * from student1");
                    ResultSet rs = pt.executeQuery();
                    int count = 1;
                    while (rs.next()) {
                        out.print("<tr>");
                        out.print("<td>" + rs.getInt(1) + "</td>");
                        out.print("<td>" + rs.getString(2) + "</td>");
                        out.print("<td>" + rs.getInt(3) + "</td>");
                        out.print("<td>" + rs.getInt(4) + "</td>");
                        out.print("<td>" + rs.getInt(5) + "</td>");
                        out.print("<td id=total" + count + ">-</td>");
                        out.print("<td id=perc" + count + ">-</td>");
                        out.print("<td><a onclick=calculate(" + count + "," + rs.getInt(3) + "," + rs.getInt(4) + "," + rs.getInt(5) + ")>calculate</a></td>");
                        out.print("</tr>");
                        count++;
                    }
                } catch (Exception e) {
                    out.print(e);
                }
            %>
        </table>
    </body>
    <script>
        function calculate(id, m1, m2, m3) {
            document.getElementById("total" + id).innerHTML = m1 + m2 + m3;
            document.getElementById("perc" + id).innerHTML = ((m1 + m2 + m3) / 3).toFixed(2) +"     %";
        }
    </script>
</html>
