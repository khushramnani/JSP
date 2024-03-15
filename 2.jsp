<%-- 
    Document   : 1
    Created on : Feb 22, 2024, 10:18:52 AM
    Author     : 15hem
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <%
            int n = Integer.parseInt(request.getParameter("Number"));
            int first = 0;
            int second = 1;
            if (n == 1) {
                out.print("0");
            } else if (n == 2) {
                out.print("0 1");
            } else {
                String result = "0 1 ";
                for (int a = 0; a < n - 2; a++) {
                    int add = first + second;
                    first = second;
                    second = add;
                    result = result + add + " ";
                }
                out.print(result);
            }
        %>  

    </body>
</html>

