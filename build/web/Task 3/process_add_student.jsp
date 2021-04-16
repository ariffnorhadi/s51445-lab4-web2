<%-- 
    Document   : process_add_student
    Created on : Mar 29, 2020, 2:29:56 PM
    Author     : Ariff Norhadi <Cucumorsed.Al-Johori at https://t.me/ariffnorhadi>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE HTML>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <title>Task 3: CRUD in JSPs | Add Student</title>
    </head>

    <body>
        <%
            //Step 1: Get required information
            String fName = request.getParameter("txtFname");
            String lName = request.getParameter("txtLname");
            String email = request.getParameter("txtEmail");

//Step 2: Load JDBC Driver
            Class.forName("com.mysql.jdbc.Driver");

//Step 3: Establish the database connection
            String myURL = "jdbc:mysql://localhost:3306/webstudent";
            Connection myConnection = DriverManager.getConnection(myURL, "root", "");

//Step 4: Execute and manipulate query
            String mySQLquery = "insert into student (first_name,last_name,email) values(?,?,?)";
            PreparedStatement ps = myConnection.prepareStatement(mySQLquery);

//set the value
            ps.setString(1, fName);
            ps.setString(2, lName);
            ps.setString(3, email);

//execute the query
            //redirect to view page
            if (!ps.execute()) {

                request.getRequestDispatcher("process-view-student.jsp").include(request, response);
            } else {
                out.print("fail");
            }

            myConnection.close();


        %>


    </body>

</html>
