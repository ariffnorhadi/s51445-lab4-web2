<%-- 
    Document   : process-delete-student
    Created on : Mar 30, 2020, 1:18:07 PM
    Author     : Ariff Norhadi <Cucumorsed.Al-Johori at https://t.me/ariffnorhadi>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int id = Integer.parseInt(request.getParameter("id"));

            //load jdbc driver
            Class.forName("com.mysql.jdbc.Driver");

            //establish connection to database
            String myURL = "jdbc:mysql://localhost:3306/webstudent";
            Connection myConnection = DriverManager.getConnection(myURL, "root", "");

//create statement and execute query
            Statement stmt = myConnection.createStatement();
            String sqlDelete = "delete from student where id=?";
            PreparedStatement pstmt = myConnection.prepareStatement(sqlDelete);
            pstmt.setInt(1, id);

            if (pstmt.executeUpdate() > 0) {
                request.getRequestDispatcher("process-view-student.jsp").include(request, response);
            } else {
                out.print("fail");
            }


        %>
    </body>
</html>
